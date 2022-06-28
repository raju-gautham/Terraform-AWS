resource "aws_instance" "example" {
    ami = "ami-052efd3df9dad4825"
    instance_type = "t2.nano"
    subnet_id = "subnet-47632f6b"
    key_name = "Linux"
  
    # user_data = <<-EOF
    #               #!/bin/bash
    #               sudo apt-get install busybox -y
    #               echo "Hello World" > index.html
    #               nohup busybox httpd -f -p 8080  &
    #               EOF
  
    tags = {
        Name = var.instance_name
        ServiceNowInstance = var.instance_name
    }
  
  }
