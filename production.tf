/*====
Variables used across all modules
======*/
locals {
  environment = "api-cliente"
}

provider "aws" {
  region = var.region
}

module "rds" {
  source            = "./rds"
  environment       = local.environment
  allocated_storage = "20"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
  subnet_ids        = ["subnet-0f0b0e3f23171860c", "subnet-022c67825a30e9c88"]
  vpc_id            = "vpc-056a4b3846658a575"
  instance_class    = "db.t3.micro"
}
