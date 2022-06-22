## terraform

###### to init and download resource

`terraform init`

###### preview the configuration

`terraform plan`

###### apply the configuration after the preview

`terraform apply`

###### show last applied configuration

`terraform show`

###### pass the external variable to configuration

`terraform apply -var "varname=value" -var "varname1=value1"`

###### apply with env variables

`export TF_VAR_varname="value"`
`terraform apply`

###### apply by creating file name with extension tfvars and file content can be

`varname="value"`

###### Terraform state command

`terraform state list`

`terraform state show`

`terraform state show aws_s3_bucket.tf-demo-bucket`

`terraform state mv` to rename the resource

`terraform state pull` in case if state file is maintained remotely

`terraform state rm` in case if state file is maintained remotely
