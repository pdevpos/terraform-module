resource "aws_instance" "instance" {
  ami           = data.aws_ami.example.id
  instance_type = var.instanceType
}