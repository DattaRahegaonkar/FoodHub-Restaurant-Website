
output jenkins_master_public_ip {

  value = aws_instance.jenkins_master.public_ip

}

output jenkins_target_server_public_ip {

  value = aws_instance.jenkins_target_server.public_ip

}

output jenkins_target_server_private_ip {

  value = aws_instance.jenkins_target_server.private_ip

}