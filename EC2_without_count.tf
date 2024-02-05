provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"         
  key_name      = "your-key-pair-name" 

  count = 3

  tags = {
    Name = "ExampleInstance-${count.index}"
  }
}
