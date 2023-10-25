output "names" {
  value = split("\n", var.names)
}

output "trusted_accounts" {
  value = split("\n", var.trusted_accounts)
}

output "image_tag_mutability" {
  value = var.image_tag_mutability
}

output "encryption_type" {
  value = var.encryption_type
}

output "scan_on_push" {
  value = var.scan_on_push
}

output "force_delete" {
  value = var.force_delete
}

output "image_limit" {
  value = var.image_limit
}