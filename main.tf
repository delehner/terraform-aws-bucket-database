module "database" {
    source  = "app.terraform.io/${var.organization}/bucket/aws"
    version = "~> 1"

    name              = "${var.name}"
    acl               = "private"
    enable_versioning = false
    policy            = data.aws_iam_policy_document.database.json
}

data "aws_iam_policy_document" "database" {
    statement {
        sid = "AllowWriter"
        actions = [
            "s3:Put*",
            "s3:Delete*",
        ]

        resources = [
            "${module.database.arn}",
            "${module.database.arn}/*",
        ]

        principals {
            type        = "AWS"
            identifiers = [
                "${var.writer_arn}",
            ]
        }
    }
    
    statement {
        sid = "AllowReader"

        actions = [
            "s3:Get*",
            "s3:List*",
        ]

        resources = [
            "${module.database.arn}",
            "${module.database.arn}/*",
        ]

        principals {
            type        = "AWS"
            identifiers = [
                "${var.reader_arn}",
            ]
        }
    }
}