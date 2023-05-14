# simple-aws-infrastucture
Aws Cloud Services and Components

1. Start local-stack container on http://localhost:4566

> docker-compose up

2. Check local-stack healt http://localhost:4566/health

3. Create cloud infrastuctore (main.tf)

> terraform init

> terraform fmt

> terraform validate

> terraform apply

4. login to local-stack with aws-cli

> aws configure

5. show aws s3 bucket list

> aws s3api list-buckets --query "Buckets[].Name" --endpoint-url=http://localhost:4566