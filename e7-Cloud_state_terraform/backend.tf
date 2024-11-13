terraform {
    backend "s3" {
        bucket = "terraform-vprofile-qube"      # S3 bucket name
        key    = "terraform/backend_state"            # Path within the bucket
        region = "us-east-1"                    # Region where the bucket is located
    }
}


#s3://terraform-vprofile-qube/terraform/
