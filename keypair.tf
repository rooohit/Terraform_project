resource "aws_key_pair" "main_key" {
  key_name   = "main_key"
  public_key = file(var.Public_key)

}