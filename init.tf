terraform {
  backend "s3" {
    bucket = "diana-terraform-state"
    key    = "staging/infra.tfstate"
    region = "us-east-1"
  }
}
