resource "aws_s3_bucket" "datalake" {
  # Parâmetros de configuração do recurso escolhido
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }


  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3"{
    bucket = "terraform-state-igiti-lucas"
    key = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}

