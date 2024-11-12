terraform {
    backend "s3" {
        bucket = "terraform-dove-state311"      # S3 bucket name
        key    = "terraform/backend"            # Path within the bucket
        region = "us-east-1"                    # Region where the bucket is located
    }
}
