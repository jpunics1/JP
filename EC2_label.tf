provider "aws" {
  region = "us-west-2"
}

variable "instance_tags" {
  default = [
    {
      Name = "Instance1Name"
      Environment = "Production"
      Role = "WebServer"
    },
    {
      Name = "Instance2Name"
      Environment = "Staging"
      Role = "DatabaseServer"
    },
    {
      Name = "Instance3Name"
      Environment = "Development"
      Role = "AppServer"
    }
  ]
}

resource "aws_instance" "example" {
  count         = length(var.instance_tags)
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro" 
  key_name      = "your-key-pair-name" 

  tags = var.instance_tags[count.index]
}
