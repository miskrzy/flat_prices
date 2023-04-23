aws s3api create-bucket --bucket flat-prices-tf-backend --region eu-central-1 --create-bucket-configuration LocationConstraint=eu-central-1

aws s3api delete-bucket --bucket flat-prices-tf-backend
