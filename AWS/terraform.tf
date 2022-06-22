// this is to store the tfstate file to s3 bucket
terraform {
  backend "s3" {
    bucket         = "name-of-s3-bucket"
    key            = "s3-bucket-key"
    region         = "region"
    dynamodb_table = "table_name"
  }

}
