resource "null_resource" "web-upload" {
  # 等待 ec2-web 资源创建
  depends_on = [module.ec2-web]

  # SSH 连接到 ec2-web 服务器
  connection {
    type        = "ssh"
    host        = module.ec2-web[0].public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("keypair/deeplearnaws-ssh-key.pem")
    timeout     = "2m"
  }
  # 建立web目录
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /var/www/html",
      "sudo chown -R ec2-user:ec2-user /var/www/html",
    ]
  }
  # 上传本地文件
  provisioner "file" {
    source      = "files/"
    destination = "/var/www/html"
  }
}