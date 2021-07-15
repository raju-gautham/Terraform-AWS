provider "aws" {
  access_key = "AKIA2UZ5GYI7IC4ZZUQT"
  secret_key = "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"
  region = "us-east-2"
}

resource "aws_instance" "test01" {
  ami = "ami-0233c2d874b811deb"
  instance_type = "t2.micro"
}
