resource "aws_instance" "myec2" {
    ami = "ami-020cba7c55df1f615"
    instance_type = "t2.micro"
    tags = {
      Name = "myec2"
    }
    
  
}
