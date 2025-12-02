module "this" {
  for_each                    = toset(split("\n", trimspace(var.names)))
  source                      = "github.com/champ-oss/terraform-aws-ecr.git?ref=v1.0.91-9b7a1d8"
  name                        = each.value
  trusted_principal_org_paths = "${var.trusted_org}/*"
  image_tag_mutability        = var.image_tag_mutability
  encryption_type             = var.encryption_type
  scan_on_push                = tobool(var.scan_on_push)
  force_delete                = tobool(var.force_delete)
  image_limit                 = tonumber(var.image_limit)
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}