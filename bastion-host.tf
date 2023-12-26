resource "aws_instance" "main-bastion-host" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.main_key.key_name
  subnet_id              = module.vpc.public_subnets[0]
  count                  = var.Instance_Count
  vpc_security_group_ids = [aws_security_group.Bastion_host_sg.id]
  associate_public_ip_address = "true"

  tags = {
    Name    = "Main_bation_host"
    Project = "Main_website"
  }

  provisioner "file" {
    content     = templatefile("templates/db-deploy.tmpl", { rds-endpoint = aws_db_instance.main-rds.address, dbuser = var.db_user, dbpass = var.db_pass })
    destination = "/tmp/main-dbdeploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/main-dbdeploy.sh",
      "sudo /tmp/main-dbdeploy.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file(var.Private_key)
    host        = self.public_ip
  }

  depends_on = [aws_db_instance.main-rds, aws_elastic_beanstalk_environment.main-bean-env]


}