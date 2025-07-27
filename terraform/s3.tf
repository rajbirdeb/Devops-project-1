resource "aws_s3_bucket" "artifact_bucket" {
  bucket         = "devops-rajbir-artifacts"
  force_destroy  = true
}
