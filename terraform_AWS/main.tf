provider "aws" {
  region = "us-east-2"
  access_key = "AKIAU3KOHYRLKQDTSRTZ"
  secret_key = "dRtClzHUl9NX0F84M4qJMjaoJCddDhbr4p803sE9"

}
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  tags = {
    Name = "terraform-ex1"
  }
}



resource "aws_db_instance" "default" {
  engine         = "mysql"
  allocated_storage = "5"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  name           = "initial_db"
  username       = "rootuser"
  password       = "rootpasswd"
}

provider "mysql" {
  endpoint = "aws_db_instance.default.endpoint"
  username = "aws_db_instance.default.username"
  password = "aws_db_instance.default.password"
}