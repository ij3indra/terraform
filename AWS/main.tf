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

// s3 bucket
resource "aws_s3_bucket" "tf-demo-bucket" {
  bucket = "tfuser-bucket-220622"
  tags = {
    "Description" = "Bucket created using terraform"
  }

}

// uploading file in bucket
resource "aws_s3_bucket_object" "tf-demo-bucket-file" {
  content = "tf_user_policy.json"
  key     = "tf_user_policy.json"
  bucket  = aws_s3_bucket.tf-demo-bucket.id

}

// attach external group to bucket
data "aws_iam_group" "tfgroup-data" {
  group_name = "admin"

}

resource "aws_s3_bucket_policy" "tf-bucket-policy" {
  bucket = aws_s3_bucket.tf-demo-bucket.id
  policy = <<EOF
  {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "*",
        "Effect" : "Allow",
        "Resource" : "arn:aws:s3:::${aws_s3_bucket.tf-demo-bucket.id}/*",
        "Principal" : {
          "AWS" : [
            "${data.aws_iam_group.tfgroup-data.arn}"
          ]
        }
      }
    ]
  }

EOF

}
