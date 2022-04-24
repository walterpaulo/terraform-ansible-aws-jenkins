
resource "aws_key_pair" "chave_ssh_public" {
  key_name   = "chave_ssh"
  public_key = "${var.public_key}"
}