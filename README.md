# simple-aws-infrastucture
Aws Cloud Services and Components

Start local-stack container on http://localhost:4566

> docker-compose up

Check local-stack healt http://localhost:4566/health

## run s3-bucket

from *s3-bucket* folder

1. Create cloud infrastuctore

> terraform init

> terraform fmt

> terraform validate

> terraform apply

2. login to local-stack with aws-cli

> aws configure

3. show aws s3 bucket list

> aws s3api list-buckets --query "Buckets[].Name" --endpoint-url=http://localhost:4566

## run lamba

from *lambda* folder

1. create zip file

> tar -cvzf test-lambda.zip example-lambda.js

2. run terraform infrastucture

> terraform init

> terraform plan

> terraform apply