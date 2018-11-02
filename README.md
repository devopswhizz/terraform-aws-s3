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

## 👬 Contribution
- Open pull request with improvements
- Discuss ideas in issues

- Reach out with any feedback [![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/anmol_nagpal.svg?style=social&label=Follow%20%40anmol_nagpal)](https://twitter.com/anmol_nagpal)
