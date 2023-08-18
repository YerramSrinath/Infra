

resource "aws_s3_bucket" "s3" {
    bucket = var.name
    acl = "private"

     versioning {
    enabled = true
  }
}

