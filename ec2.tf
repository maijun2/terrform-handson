#----------------------------------------
# EC2インスタンスの作成
#----------------------------------------
resource "aws_instance" "web_server" {
  ami           = "ami-01cc34ab2709337aa" # Amazon Linux 2
  instance_type = "t2.micro"
  #iam_instance_profile   = "LabInstanceProfile"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = <<EOF
#! /bin/bash
sudo yum -y update
EOF
}