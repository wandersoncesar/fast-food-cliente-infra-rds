/*====
Variables used across all modules
======*/
locals {
  environment = "fast-food-cliente"
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
  subnet_ids        = ["subnet-052bca6bb5af799b5", "subnet-0975413e62f9ae778"]
  vpc_id            = "vpc-0b36947dc0287234c"
  instance_class    = "db.t3.micro"
}
