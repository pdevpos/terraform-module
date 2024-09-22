resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg
  tags = var.tags
}