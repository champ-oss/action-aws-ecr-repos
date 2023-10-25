#module "this" {
#  for_each = toset([
#    "foo"
#  ])
#  source               = "github.com/champ-oss/terraform-aws-ecr.git?ref=v1.0.88-7582d14"
#  name                 = each.value
#  trusted_accounts     = var.trusted_accounts
#  image_tag_mutability = var.image_tag_mutability
#  encryption_type      = var.encryption_type
#  scan_on_push         = var.scan_on_push
#  force_delete         = var.force_delete
#  image_limit          = var.image_limit
#}