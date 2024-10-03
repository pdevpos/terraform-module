resource "aws_instance" "instance" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  instance_market_options {
        market_type = "spot"
        spot_options {
          spot_instance_type = "persistent"
          instance_interruption_behavior = "stop"
        }
  }
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }
    inline = [
      "sudo dnf install nginx -y"
    ]
  }
}