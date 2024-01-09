data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}

output "ami-output" {
  value = data.aws_ami.centos.image_id
}

resource "ec2-instance" "frontend" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "frontend"
  }
}

resource "ec2-instance" "mongodb" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "mongodb"
  }
}

resource "ec2-instance" "catalogue" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "catalogue"
  }
}

resource "ec2-instance" "user" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "user"
  }
}

resource "ec2-instance" "mysql" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "mysql"
  }
}

resource "ec2-instance" "cart" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "cart"
  }
}

resource "ec2-instance" "redis" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "redis"
  }
}

resource "ec2-instance" "shipping" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "shipping"
  }
}

resource "ec2-instance" "payment" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name   = "payment"
  }
}
