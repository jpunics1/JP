provider "aws" {
  region = "us-west-2" 
}

# Define a list of instance types
variable "instance_types" {
  default = ["t2.micro", "t2.small", "t2.medium"]
}

resource "aws_instance" "example" {
  count         = 5
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_types[count.index]
  key_name      = "your-key-pair-name"   

  tags = {
    Name = "ExampleInstance-${count.index}"
  }
}
