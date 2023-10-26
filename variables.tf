variable "names" {
  description = "List of AWS ECR repos to create"
  type        = string
  nullable    = false
}

variable "trusted_accounts" {
  description = "Trusted accounts that are allowed to pull images"
  type        = string
  nullable    = false
}

variable "trusted_accounts_ssm" {
  description = "AWS SSM parameter name to pull a list of trusted accounts"
  type        = string
  nullable    = false
}

variable "image_tag_mutability" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#argument-reference"
  type        = string
  nullable    = false
}

variable "encryption_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#argument-reference"
  type        = string
  nullable    = false
}

variable "scan_on_push" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#argument-reference"
  type        = string
  nullable    = false
}

variable "force_delete" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository#argument-reference"
  type        = string
  nullable    = false
}

variable "image_limit" {
  description = "If not null, a default lifecycle policy will be deployed to prune repository images to this limit"
  type        = string
  nullable    = false
}