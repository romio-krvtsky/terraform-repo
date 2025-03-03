provider "aws" {
  region  = "eu-north-1"
  profile = "terraform"

  default_tags {
    tags = {
      Environment = "dev"
      Owner       = "Mentor"
      Project     = "Ann-TF"
    }
  }
}
