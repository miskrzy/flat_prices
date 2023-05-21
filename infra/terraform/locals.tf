locals {
  region = "eu-central-1"
  account_id = "044819077477"
  resource_prefix = "flat-prices"
  path_to_application = "../../application"
  path_to_python_scraping_lambda = "${local.path_to_application}/python/scraping_lambda"
}