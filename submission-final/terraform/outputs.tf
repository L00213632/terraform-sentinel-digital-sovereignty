output "aws_region" {
  value = "eu-west-1"
}

output "instance_type" {
  value = aws_instance.web_server.instance_type
}

output "ebs_encryption" {
  value = aws_ebs_volume.encrypted_data.encrypted
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}
