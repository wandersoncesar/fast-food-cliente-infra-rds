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
  subnet_ids        = ["subnet-054f3041d61eb3975", "subnet-03da4468b1b6b1571"]
  vpc_id            = "vpc-0a2cba44022ac9eaa"
  instance_class    = "db.t3.micro"
}
