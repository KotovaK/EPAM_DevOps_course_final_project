provider "aws" {
  region = "eu-central-1"
}
resource "aws_instance" "jenkins" {
  #AMI - is an image we use for our instance 
 ami           = "ami-05f7491af5eef733a"
 instance_type = "t2.micro"

  #here we specify security group we created above to allow ssh access
  vpc_security_group_ids = [aws_security_group.webapp.id]
  #we need only one instance
  #pair of ssh keys 
  key_name  = aws_key_pair.webapp.id
}
resource "aws_instance" "webapp" {
  #AMI - is an image we use for our instance 
 ami           = "ami-05f7491af5eef733a"
 instance_type = "t2.micro"

  #here we specify security group we created above to allow ssh access
  vpc_security_group_ids = [aws_security_group.webapp.id]
  #we need only one instance
  #pair of ssh keys 
  key_name  = aws_key_pair.webapp.id
}
resource "aws_security_group" "webapp" {
  name        = "allow_webapp"
  description = "Allow web/ssh inbound traffic"
  vpc_id      = "vpc-88be18e2"
  ingress {
    description      = "80 from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description      = "22 from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "8080 from Jenkins"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "webapp" {
  key_name   = "web_id_rsa.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdmDV6QD3oe10pZerUlZl2mlMcHqvwgmJ5o+bdYPIjEH7mzbg0wjGKba5R0Gi6HlMUuExqEnZ4+P1csKNrHMuUWK2yMdNhVX1CWNgBXCoHaQHjpbxmYeMEx1qRNNs0joVfyhVQA3whSBWKG6XT3fK0Jzg1gYd9KO5sM827yO9Zca3OcfCqVO+6shYQZOvO+hvO299Pwr5xMVA6hVQ+dpiCjKbpyumBbF6EkNRJG+N3/fShkGeE5q2RYY4jC1Lnq+WFo5siYtYCyT3FDOX4mBJhWIjs0DJyG5l3m9vF/D3QJYrkOK9kmDUAPfHSlahNUtS/KjBSV1t9ADvxRHHS5Pzb katya@desktop"
}