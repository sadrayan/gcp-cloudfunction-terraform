# gcp-cloudfunction-terraform
example of GCP cloud functions, terraform, and github actions

## Run a Function
```
npx functions-framework --target=helloHTTPFunction
```

## GCP Login and Impersonate
```
gcloud auth login
export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud auth print-access-token --impersonate-service-account=github-action-pipeline@sandbox-381502.iam.gserviceaccount.com)
gcloud config set core/account github-action-pipeline@sandbox-381502.iam.gserviceaccount.com
```


```
gcloud config configurations list
gcloud config set project sandbox-381502
gcloud config unset project
gcloud auth print-identity-token
```

## Terraform
```
cd terraform
terraform init -backend-config=dev/backend.conf
terraform plan -var-file="dev/terraform.tfvars" -out ftplan
terraform apply tfplan
```


