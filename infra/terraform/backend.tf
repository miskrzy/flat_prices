terraform {
  backend "s3" {
    bucket = "flat-prices-tf-backend"
    key = "tf-state"
    region = "eu-central-1"
  }
}