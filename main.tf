resource "aws_instance" "docker" {
  ami = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [local.sg_id]
  subnet_id = local.public_subnet_id

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
    tags = {
      Name = "docker"
    }
  }

  user_data = file("docker.sh")

  tags = {
      Name = "docker"
    }
}


