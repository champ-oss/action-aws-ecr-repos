variable "names" {
  description = ""
  type        = string
}

variable "trusted_accounts" {
  description = ""
  type        = string
}

variable "trusted_accounts_ssm" {
  description = ""
  type        = string
  nullable    = false
}

variable "image_tag_mutability" {
  description = ""
  type        = string
}

variable "encryption_type" {
  description = ""
  type        = string
}

variable "scan_on_push" {
  description = ""
  type        = string
}

variable "force_delete" {
  description = ""
  type        = string
}

variable "image_limit" {
  description = ""
  type        = string
}