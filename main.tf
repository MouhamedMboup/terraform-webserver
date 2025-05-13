# 5.1 Security Group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
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

# 5.2 EC2 Instance
resource "aws_instance" "web" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.key_name

  # Note: modern AWS provider uses vpc_security_group_ids, not security_group_ids
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Cloud-init script to install and start NGINX
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "Terraform-Web-Server"
  }
}
