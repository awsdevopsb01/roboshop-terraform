
resource "aws_instance" "instance" {
  for_each = var.components
  ami = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = {
    Name   = each.value["name"]
  }
}

resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.dnsrecord]
  for_each = var.components
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance[each.value["name"]].private_ip
}

    inline = [
      "rm -rf roboshop-adv-shell",
      "git clone https://github.com/awsdevopsb01/roboshop-adv-shell.git",
      "cd roboshop-adv-shell",
      "sudo bash ${each.value["name"]}.sh"
    ]
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
