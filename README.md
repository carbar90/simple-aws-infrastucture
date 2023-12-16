# simple-aws-infrastucture
Aws Cloud Services and Components

Start local-stack container on http://localhost:4566

> docker-compose up

Check local-stack healt http://localhost:4566/health

## run s3-bucket

from *s3-bucket* folder

1. Create cloud infrastuctore

> terraform init

> terraform plan

> terraform apply

2. login to local-stack with aws-cli

> aws configure

> AWS_ACCESS_KEY_ID="test"

> AWS_SECRET_ACCESS_KEY="test"

3. show aws s3 bucket list

> aws s3api list-buckets --query "Buckets[].Name" --endpoint-url=http://localhost:4566

## run lamba

from *lambda* folder

1. create zip file

2. (optional) create zip before

> tar -cvzf lambda_function.zip example-lambda.js

3. run terraform infrastucture

> terraform init

> terraform plan

> terraform apply

4. perform lambda

> aws lambda get-function --function-name=example_lambda --endpoint-url=http://localhost:4566 --region=us-east-1

> aws --endpoint-url=http://localhost:4566 lambda invoke --function=example_lambda --payload '{}' outputfile.txt

> aws lambda invoke --function-name example_lambda out --log-type Tail