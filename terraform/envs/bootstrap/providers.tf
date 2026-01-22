provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project = "wine-ml"
      Env     = "bootstrap"
      Managed = "terraform"
    }
  }
}
