module "this" {
  for_each             = toset(split("\n", trimspace(var.names)))
  source               = "github.com/champ-oss/terraform-aws-ecr.git?ref=v1.0.88-7582d14"
  name                 = each.value
  trusted_accounts     = split("\n", trimspace(var.trusted_accounts))
  image_tag_mutability = var.image_tag_mutability
  encryption_type      = var.encryption_type
  scan_on_push         = tobool(var.scan_on_push)
  force_delete         = tobool(var.force_delete)
  image_limit          = tonumber(var.image_limit)
}