variable "accessKey" {}  
variable "secretKey" {}
variable "AWSregion" {
    default = "us-east-1"
}
variable "instance_name" {
    type = string
    default = "testvm"
  }
  
  variable "sn_instance" {
    type = string
    default = "DoNotModify"
  }
  
