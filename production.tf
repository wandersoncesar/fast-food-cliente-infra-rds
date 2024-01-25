/*====
Variables used across all modules
======*/
locals {
  environment = "fast-food"
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
  subnet_ids        = ["subnet-07feb062c5ccf071c", "subnet-0420b3c2c14b17c36"]
  vpc_id            = "vpc-07a59b130204263c2"
  instance_class    = "db.t3.micro"
}