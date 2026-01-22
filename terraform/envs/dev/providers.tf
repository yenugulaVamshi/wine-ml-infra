provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project = "wine-ml"
      Env     = "dev"
      Managed = "terraform"
    }
  }
}
