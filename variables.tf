variable "names" {
  description = ""
  type        = string
  nullable    = false
}

variable "trusted_accounts" {
  description = ""
  type        = string
  nullable    = false
}

variable "trusted_accounts_ssm" {
  description = ""
  type        = string
  nullable    = false
}

variable "image_tag_mutability" {
  description = ""
  type        = string
  nullable    = false
}

variable "encryption_type" {
  description = ""
  type        = string
  nullable    = false
}

variable "scan_on_push" {
  description = ""
  type        = string
  nullable    = false
}

variable "force_delete" {
  description = ""
  type        = string
  nullable    = false
}

variable "image_limit" {
  description = ""
  type        = string
  nullable    = false
}