# aws_instance.jenkins-build-agent.pulic_ip

resource "aws_instance" "jenkins-build-agent" {
  ami                    = data.aws_ami.ami.id
  instance_type          = "t2.xlarge"
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  user_data              = file("${path.module}/template/jenkins.sh")
  iam_instance_profile   = local.instance_profile

  tags = {
    Name = "jenkins-build-agent"
  }
}
