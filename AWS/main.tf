terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

// IAM user
resource "aws_iam_user" "tf_iam_demo" {
  name = "tfuser"
  tags = {
    "Description" = "This is user created using terraform"
  }

}

// IAM policy
resource "aws_iam_policy" "tf-user-policy" {
  name   = "tfUser"
  policy = file("tf_user_policy.json")
  // policy = <<EOF
  // policy json 
  // EOF

}

// IAM policy attachment to user
resource "aws_iam_user_policy_attachment" "tfuser-policy-attachment" {
  user       = aws_iam_user.tf_iam_demo.name
  policy_arn = aws_iam_policy.tf-user-policy.arn

}
