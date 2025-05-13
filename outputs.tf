output "instance_public_ip" {
  value       = aws_instance.web.public_ip
  description = "The public IP of the web server"
}

output "web_url" {
  value       = "http://${aws_instance.web.public_ip}"
  description = "URL to access NGINX"
}
