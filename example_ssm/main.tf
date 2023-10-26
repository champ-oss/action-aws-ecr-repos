resource "aws_ssm_parameter" "accounts" {
  name  = "example-aws-accounts"
  type  = "StringList"
  value = join(",", ["266458841044", "432418664414"])
}