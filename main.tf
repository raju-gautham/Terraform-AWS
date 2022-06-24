resource "aws_instance" "example" {
    ami = "ami-0022f774911c1d690"
    instance_type = "t2.nano"
    subnet_id = "subnet-8de0fcc0"
    key_name = "USEast1Linux"
  
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
