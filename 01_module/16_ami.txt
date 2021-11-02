resource "aws_ami_from_instance" "hlpark_ami" {
  name = "hlpark-ami"
  source_instance_id = aws_instance.hlpark_weba.id
  depends_on = [
    aws_instance.hlpark_weba
  ]
  
}