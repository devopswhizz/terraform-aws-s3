locals {
  defaultLoggingBucket = "${var.s3_name}-bucket-log"
}

resource "aws_s3_bucket" "bucket_log" {
  count  = "${var.loggingBucket == "" && var.create_bucket ? 1 : 0}"
  bucket = "${local.defaultLoggingBucket}"
  acl    = "log-delivery-write"

  tags {
    name = "LoggingBucket"
  }
}

resource "aws_s3_bucket" "this" {
  count         = "${var.create_bucket ? 1 : 0}"
  bucket        = "${var.s3_name}"
  force_destroy = false
  tags          = "${merge(var.tags, map("Name", format("%s", var.s3_name)))}"

  logging {
    target_bucket = "${var.loggingBucket != "" ? var.loggingBucket : local.defaultLoggingBucket}"
    target_prefix = "log/"
  }

  versioning {
    enabled = "${var.versioning}"
  }
}

resource "aws_s3_bucket_policy" "private" {
  count  = "${var.allow_public != true && var.create_bucket ? 1 : 0}"
  bucket = "${aws_s3_bucket.this.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Action": ["s3:*"],
      "Effect": "Allow",
      "Resource": ["arn:aws:s3:::${var.s3_name}",
                   "arn:aws:s3:::${var.s3_name}/*"],
      "Principal": {
        "AWS": ["arn:aws:iam::${var.aws_account_id}:user/${var.aws_username}"]
      }
    }
  ]
}
EOF
}

resource "aws_s3_bucket_policy" "public" {
  count  = "${var.allow_public && var.create_bucket ? 1 : 0}"
  bucket = "${aws_s3_bucket.this.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Action": ["s3:*"],
      "Effect": "Allow",
      "Resource": ["arn:aws:s3:::${var.s3_name}",
                   "arn:aws:s3:::${var.s3_name}/*"],
      "Principal": {
        "AWS": ["arn:aws:iam::${var.aws_account_id}:user/${var.aws_username}"]
      }
    },
    {
      "Sid": "",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": ["arn:aws:s3:::${var.s3_name}",
                   "arn:aws:s3:::${var.s3_name}/*"],
      "Principal": {
        "AWS": "*"
      }
    }
  ]
}
EOF
}
