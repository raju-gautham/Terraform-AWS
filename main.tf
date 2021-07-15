provider "aws" {
  access_key = "AKIA2UZ5GYI7KHGMNA5R"
  secret_key = "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"
  region = "us-east-2"
}

resource "aws_instance" "test01" {
  ami = "ami-0233c2d874b811deb"
  instance_type = "t2.micro"
}
