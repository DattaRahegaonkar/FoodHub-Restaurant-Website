
# security group

resource aws_security_group jenkins_target_sg {

    name        = "jenkins-target-sg"
    vpc_id      = aws_default_vpc.default.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

# ec2 instance

resource aws_instance jenkins_target_server {

  ami           = "ami-06468be052a4195a6"
  instance_type = "t3.small"
  key_name      = aws_key_pair.jenkins_key.key_name
  security_groups = [aws_security_group.jenkins_target_sg.name]


  root_block_device {

    volume_size = 8
    volume_type = "gp3"

  }

  tags = {
    Name = "Jenkins Target"
  }

}