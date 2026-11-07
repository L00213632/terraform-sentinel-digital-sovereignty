
provider "aws" {
  region = "eu-west-1"

  # Dummy credentials for plan-only testing.
  # Do not use this configuration to deploy resources.
  access_key = "mock_access_key"
  secret_key = "mock_secret_key"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  skip_region_validation      = true
}

resource "aws_security_group" "web_sg" {
  name        = "digital-sovereignty-web-sg"
  description = "Restricted web access"

  ingress {
    description = "HTTPS from approved network"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami                    = "ami-0c1ac8a41498c1a9c"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name        = "Digital-Sovereignty-Demo"
    Environment = "Ireland"
    Project     = "Digital-Sovereignty"
  }
}

resource "aws_ebs_volume" "encrypted_data" {
  availability_zone = "eu-west-1a"
  size              = 5
  encrypted         = true

  tags = {
    Name = "Encrypted-Demo-Volume"
  }
}
