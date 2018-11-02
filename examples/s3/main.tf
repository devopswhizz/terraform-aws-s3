provider "aws" {
  region = "eu-west-1"
}

module "s3_bucket" {
  source         = "git@github.com:devopswhizz/terraform-aws-s3.git"
  s3_name        = "devopswhizz"
  aws_account_id = "374095273805"
  aws_username   = "anmolnagpal"
  versioning     = true

  tags = {
    ManagedBy   = "Terraform"
    Environment = "stage"
    Project     = "DevOpsWhizz"
  }
}
