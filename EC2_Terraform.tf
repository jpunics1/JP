provider "aws" {
  region = "us-west-2"  # Specify the AWS region you want to use
}

resource "aws_instance" "myinstance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"                
  key_name      = "your-key-pair-name"     

  tags = {
    Name = "ExampleInstance"             
  }
}
