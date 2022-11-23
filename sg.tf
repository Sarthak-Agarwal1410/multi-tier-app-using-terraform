resource "aws_security_group" "sg_bastion_host" {
  depends_on = [
    aws_vpc.vpc,
  ]
  name        = "sg bastion host"
  description = "bastion host security group"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    content {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["157.240.239.17"]
    }
  }
}

#   provisioner "file" {
#     source      = "/home/sarthak/terra-infra/ec2Key.pem"
#     destination = "/home/ec2-user/ec2Key.pem"

#     connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     private_key = tls_private_key.private_key.private_key_pem
#     host     = aws_instance.bastion_host.public_ip
#     }
#   }