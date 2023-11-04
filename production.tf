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
  subnet_ids        = ["subnet-0e802add561560eb9", "subnet-006a26a695d5712df"]
  vpc_id            = "vpc-0b59352822e8ca1eb"
  instance_class    = "db.t3.micro"
}
