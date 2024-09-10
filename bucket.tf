# HINT: use `terraform plan` & `terraform apply` to create the resources

# TODO: Create a google_storage_bucket 
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket

resource "google_storage_bucket" "bucket" {
  name          = "mustafa-heat-bucket"
  location      = "EU"
}

# TODO: Create an IAM binding with the role Storage Object User and yourself as the member
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.bucket.name
  role = "roles/storage.objectUser"
  member = "user:mustafa.iskender@senacor.com"
}

# TODO: Create a data source for a GCS Bucket and use following bucket: hack-and-heat-2024-task-5
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_bucket

# TODO: Upload Readme.md to the bucket with your name prefixed
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object
