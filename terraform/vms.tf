resource "aws_instance" "vm" {
  ami                         = "ami-04505e74c0741db8d"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.chave_ssh_public.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.liberar_portas.id
  ]

  tags = {
    Name = "Jenskins"
  }
}