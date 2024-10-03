# resource "aws_instance" "instance" {
#   ami           = data.aws_ami.ami.image_id
#   instance_type = var.instance_type
#   instance_market_options {
#         market_type = "spot"
#         spot_options {
#           spot_instance_type = "persistent"
#           instance_interruption_behavior = "stop"
#         }
#   }
#   provisioner "remote-exec" {
#     connection {
#       type     = var.protocol_type
#       user     = var.ssh_user
#       password = var.ssh_password
#       host     = self.public_ip
#     }
#     inline = [
#       "sudo dnf install nginx -y"
#     ]
#   }
# }
# if there is any fail in provisioner first terraform instance will destroy existing instances and recreate a new instance
#  so here we have to decouple the provisioner with null resource
# if provisioner fails terraform instance will not destroy and recreate
resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  instance_market_options {
    market_type = "spot"
    spot_options {
      spot_instance_type             = "persistent"
      instance_interruption_behavior = "stop"
    }
  }
}
resource "null_resource" "provisioner" {
  provisioner "remote-exec" {
    connection {
      type     = var.protocol_type
      user     = var.ssh_user
      password = var.ssh_password
      host     = aws_instance.instance.public_ip
    }
    inline = [
      "dnf install nginx -y"
    ]
  }
}
