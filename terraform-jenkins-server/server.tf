# Define the Jenkins server
resource "aws_instance" "jenkins-server" {
  ami                         = "ami-005fc0f236362e99f"
  instance_type               = var.instance_type
  key_name                    = "SuperMarioKey222"
  subnet_id                   = aws_subnet.jenkins-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.jenkins-sg.id]
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  # Specify a script to be executed when the instance is launched
  user_data                   = file("jenkins-script.sh")
  tags = {
    Name = "jenkins-SuperMarioGame"
  }
}

