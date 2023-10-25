import sys
import os

for name in sys.argv[1].splitlines():
    os.system(f"terraform import 'module.this[\"{name}\"].aws_ecr_repository.this' {name}")
