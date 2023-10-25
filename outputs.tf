output "names" {
  value = split("\n", trimspace(var.names))
}

output "trusted_accounts" {
  value = split("\n", trimspace(var.trusted_accounts))
}

output "image_tag_mutability" {
  value = var.image_tag_mutability
}

output "encryption_type" {
  value = var.encryption_type
}

output "scan_on_push" {
  value = tobool(var.scan_on_push)
}

output "force_delete" {
  value = tobool(var.force_delete)
}

output "image_limit" {
  value = var.image_limit
}