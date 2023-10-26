# action-aws-ecr-repos

A GitHub Action which creates AWS ECR repositories

[![.github/workflows/test.yml](https://github.com/champ-oss/action-aws-ecr-repos/actions/workflows/test.yml/badge.svg?branch=main)](https://github.com/champ-oss/action-aws-ecr-repos/actions/workflows/test.yml)
[![.github/workflows/release.yml](https://github.com/champ-oss/action-aws-ecr-repos/actions/workflows/release.yml/badge.svg)](https://github.com/champ-oss/action-aws-ecr-repos/actions/workflows/release.yml)
[![.github/workflows/sonar.yml](https://github.com/champ-oss/action-aws-ecr-repos/actions/workflows/sonar.yml/badge.svg)](https://github.com/champ-oss/action-aws-ecr-repos/actions/workflows/sonar.yml)

[![SonarCloud](https://sonarcloud.io/images/project_badges/sonarcloud-black.svg)](https://sonarcloud.io/summary/new_code?id=action-aws-ecr-repos_champ-oss)

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=action-aws-ecr-repos_champ-oss&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=action-aws-ecr-repos_champ-oss)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=action-aws-ecr-repos_champ-oss&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=action-aws-ecr-repos_champ-oss)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=action-aws-ecr-repos_champ-oss&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=action-aws-ecr-repos_champ-oss)

## Features

- Create multiple AWS ECR repositories at once
- Updates ECR repositories if they already exist

## Example Usage

```yaml
jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: hashicorp/setup-terraform@v2 # https://github.com/hashicorp/setup-terraform/tags
        with:
          terraform_version: 1.5.7 # https://github.com/hashicorp/terraform/tags
          terraform_wrapper: false
      - uses: aws-actions/configure-aws-credentials@v4 # https://github.com/aws-actions/configure-aws-credentials/tags
        with:
          role-to-assume: arn:aws:iam::${{ vars.AWS_ACCOUNT_ID }}:role/${{ vars.AWS_ROLE_NAME }}
          aws-region: ${{ vars.AWS_DEFAULT_REGION }}

      # Create one ECR repo
      - uses: champ-oss/action-aws-ecr-repos
        with:
          names: test1

      # Create multiple ECR repos
      - uses: champ-oss/action-aws-ecr-repos
        with:
          names: |
            test1
            test2

      # Share the ECR repos with the specified trusted accounts
      - uses: champ-oss/action-aws-ecr-repos
        with:
          names: |
            test1
            test2
          trusted_accounts: |
            081040173940
            477331159723

      # Get a list of trusted accounts from SSM parameter as a comma separated string
      - uses: champ-oss/action-aws-ecr-repos
        with:
          trusted_accounts_ssm: example-aws-accounts
          names: |
            test1
            test2

      # Combine trusted accounts from SSM parameter and specified list
      - uses: champ-oss/action-aws-ecr-repos
        with:
          names: |
            test1
            test2
          trusted_accounts_ssm: example-aws-accounts
          trusted_accounts: |
            081040173940
            477331159723

```

## Parameters

See the `terraform-aws-ecr`Terraform module for a list of available parameters:
https://github.com/champ-oss/terraform-aws-ecr
