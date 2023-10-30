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
  subnet_ids        = ["subnet-090645056d7342986", "subnet-07b6cfbf2e49b00f2"]
  vpc_id            = "vpc-09e1933376ac822fc"
  instance_class    = "db.t3.micro"
}