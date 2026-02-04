# Terraform - Bucket Database Module

This Terraform module provides S3 features to create and manage a database using S3.

## Usage

Here's a code example of how you can use this module:

```hcl
module "my_s3_database" {
  source  = "app.terraform.io/<organization>/bucket-database/aws"
  version = "~> 1"

  name       = "my_s3_database"
  writer_arn = module.writer.lambda.arn
  reader_arn = module.reader.lambda.arn
}
```
