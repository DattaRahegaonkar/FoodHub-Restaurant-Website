#key-pair

resource aws_key_pair jenkins_key {

  key_name   = "terraform-key"
  public_key = file("terraform-key.pub")
}

# default vpc

resource aws_default_vpc default {

}

# security group

resource aws_security_group jenkins_master_sg {

    name        = "jenkins-master-sg"

    ingress {
        from_port   = 22
        to_port     = 22
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

resource aws_instance jenkins_master {

  ami           = "ami-06468be052a4195a6"
  instance_type = "c7i-flex.large"
  key_name      = aws_key_pair.jenkins_key.key_name
  security_groups = [aws_security_group.jenkins_master_sg.name]


  root_block_device {

    volume_size = 8
    volume_type = "gp3"

  }

  tags = {
    Name = "Jenkins Master"
  }

}