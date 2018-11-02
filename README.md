<p align="center"><img src="https://i.imgur.com/x5kv2Vt.png" /></p>

> Terraform module to create S3 bucket on AWS


<p align="center">
    <a href="LICENSE.md">
      <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square" alt="Software License">
    </a>
    <a href="https://www.paypal.me/anmolnagpal">
      <img src="https://img.shields.io/badge/PayPal-Buy%20Me%20A%20BEER-blue.svg?style=flat-squares" alt="Donate">
    </a>
  </p>
</p>

Example of Bucket with only private access
------------------------------------------

```hcl
module "s3_bucket" {
    source         = "git@github.com:devopswhizz/terraform-aws-s3.git"
    s3_name        = "${var.s3_name}"
    aws_account_id = "${var.aws_account_id}"
    aws_username   = "${var.aws_username}"
    versioning     = "${var.versioning}"

    tags = {
        ManagedBy   = "Terraform"
        Environment = "stage"
        Project     = "DevOpsWhizz"
    }
}
```


Example of Bucket with read public access
-----------------------------------------

```hcl
module "s3_bucket" {
    source         = "git@github.com:devopswhizz/terraform-aws-s3.git"
    s3_name        = "${var.s3_name}"
    aws_account_id = "${var.aws_account_id}"
    aws_username   = "${var.aws_username}"
    versioning     = "${var.versioning}"
    allow_public   = "true"

    tags = {
        ManagedBy   = "Terraform"
        Environment = "stage"
        Project     = "DevOpsWhizz"
    }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_public | Allow public read access to bucket | string | `false` | no |
| aws\_account\_id | AWS Account Id | string | - | yes |
| aws\_username | AWS Username | string | - | yes |
| create\_bucket | Conditionally create S3 bucket | string | `true` | no |
| loggingBucket | The bucket you want to log S3 access to. | string | `` | no |
| s3\_name | Name for s3 bucket | string | - | yes |
| tags | A mapping of tags to assign to bucket | map | `<map>` | no |
| versioning | Enable Versioning of S3 | string | `false` | no |


## 👬 Contribution
- Open pull request with improvements
- Discuss ideas in issues

- Reach out with any feedback [![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/anmol_nagpal.svg?style=social&label=Follow%20%40anmol_nagpal)](https://twitter.com/anmol_nagpal)
