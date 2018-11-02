## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| allow\_public | Allow public read access to bucket | string | `false` | no |
| aws\_account\_id | AWS Account Id | string | - | yes |
| aws\_username | AWS Username | string | - | yes |
| create\_bucket | Conditionally create S3 bucket | string | `true` | no |
| loggingBucket | The bucket you want to log S3 access to. | string | `` | no |
| s3\_name | name for s3 bucket | string | - | yes |
| tags | A mapping of tags to assign to bucket | map | `<map>` | no |
| versioning | Enable Versioning of S3 | string | `false` | no |
