data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "selected" {
  name = "practice-devops-allow-all"
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name   = each.value["name"]
  }
}

resource "aws_route53_record" "dnsrecord" {
  for_each = var.components
  zone_id = "Z01307132WU1DJMGVKGO6"
  name    = "${each.value["name"]}-dev.nldevopsb01.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}
