resource "aws_elb" "bar" {
  name               = "kvl-elb"
  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                 = ["${aws_instance.one.id}", "${aws_instance.two.id}"]
  cross_zone_load_balancing = true
  idle_timeout              = 400
  tags = {
    Name = "raham-tf-elb"
  }
}

 /*resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.11.2"
  availability_zones      = ["ap-southeast-1a", "ap-southeast-1b"]
  database_name           = "mydb"
  master_username         = "Krishna"
  master_password         = "Rahamshaik#444555"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot = true
}*/

/*resource "aws_instance" "kkvl" {
  for_each = toset(["k", "r", "i"])
  ami           = "ami-06018068a18569ff2"
  instance_type = "t2.micro"
  tags = {
    Name = "instance-${each.key}"
  }*/
}*/

