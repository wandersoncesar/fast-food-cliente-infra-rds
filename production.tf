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
  subnet_ids        = ["subnet-0ed872fb39094e628", "subnet-055ecb6a3ba4588f9"]
  vpc_id            = "vpc-03599603e61e08c59"
  instance_class    = "db.t3.micro"
}
