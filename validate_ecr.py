import json
import sys

import boto3

name = sys.argv[1]
expected_accounts = sys.argv[2].split(',')

client = boto3.client('ecr', region_name='us-east-2')
response = client.get_repository_policy(repositoryName=name)

policy = json.loads(response.get('policyText'))
aws_principals = policy['Statement'][0]['Principal']['AWS']

for expected_account in expected_accounts:
    assert f'arn:aws:iam::{expected_account}:root' in aws_principals, f'{aws_principals} does not contain account: {expected_account}'
