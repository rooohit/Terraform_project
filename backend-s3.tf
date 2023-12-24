terraform {
  backend "s3" {
    bucket = "kubebalti"
    key    = "Terraform/project-backend"
    region = "ap-south-1"

  }
}