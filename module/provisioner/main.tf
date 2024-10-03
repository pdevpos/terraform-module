resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  instance_market_options {
        market_type = "spot"
        spot_options {
          spot_instance_type = "persistent"
          instance_interruption_behavior = "stop"
        }
  }
  provisioner "remote-exec" {
    connection {
      type     = var.protocol_type
      user     = var.ssh_user
      password = var.ssh_password
      host     = self.public_ip
    }
    inline = [
      "sudo dnf install nginx -y"
    ]
  }
}