data "aws_caller_identity" "this" {}

locals {
  local_account_list        = [data.aws_caller_identity.this.account_id]
  trusted_accounts_list     = var.trusted_accounts != "" ? split("\n", trimspace(var.trusted_accounts)) : []
  trusted_accounts_ssm_list = var.trusted_accounts_ssm != "" ? split(",", trimspace(data.aws_ssm_parameter.trusted_accounts_ssm[0].value)) : []
}

data "aws_ssm_parameter" "trusted_accounts_ssm" {
  count = var.trusted_accounts_ssm != "" ? 1 : 0
  name  = var.trusted_accounts_ssm
}

module "this" {
  for_each             = toset(split("\n", trimspace(var.names)))
  source               = "github.com/champ-oss/terraform-aws-ecr.git?ref=v1.0.88-7582d14"
  name                 = each.value
  trusted_accounts     = toset(concat(local.local_account_list, local.trusted_accounts_list, local.trusted_accounts_ssm_list))
  image_tag_mutability = var.image_tag_mutability
  encryption_type      = var.encryption_type
  scan_on_push         = tobool(var.scan_on_push)
  force_delete         = tobool(var.force_delete)
  image_limit          = tonumber(var.image_limit)
}