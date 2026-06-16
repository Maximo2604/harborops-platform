terraform {
  backend "s3" {
    bucket = "harborops-tfstate"
    key    = "harborops/terraform.tfstate"
    region = "us-east-1"
  }
}
