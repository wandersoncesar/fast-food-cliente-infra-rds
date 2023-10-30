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
  subnet_ids        = ["subnet-0732bdd5e5c7d90de", "subnet-0adfce1ac08c6b744"]
  vpc_id            = "vpc-0dbe202c10e297c7f"
  instance_class    = "db.t3.micro"
}