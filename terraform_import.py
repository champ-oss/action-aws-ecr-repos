import os
import sys

for name in sys.argv[1].splitlines():
    os.system(f"terraform import 'module.this[\"{name}\"].aws_ecr_repository.this' {name}")
    os.system(f"terraform import 'module.this[\"{name}\"].aws_ecr_lifecycle_policy.this[0]' {name}")
    os.system(f"terraform import 'module.this[\"{name}\"].aws_ecr_repository_policy.ecr_policy[0]' {name}")
