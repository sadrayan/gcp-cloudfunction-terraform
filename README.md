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


## Setup Federation
https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions
```
gcloud iam workload-identity-pools create "github-action-pool" \
  --project="sandbox-381502" \
  --location="global" \
  --display-name="github action pool"
```
```
gcloud iam workload-identity-pools providers create-oidc "gh-action-provider" \
  --project="sandbox-381502" \
  --location="global" \
  --workload-identity-pool="github-action-pool" \
  --display-name="github action provider" \
  --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.aud=assertion.aud" \
  --issuer-uri="https://token.actions.githubusercontent.com"
```

```
gcloud iam service-accounts add-iam-policy-binding "github-action-pipeline@sandbox-381502.iam.gserviceaccount.com" \
  --project="sandbox-381502" \
  --role="roles/iam.workloadIdentityUser" \
  --member="principalSet://iam.googleapis.com/projects/sandbox-381502/locations/global/workloadIdentityPools/github-action-pool/attribute.repository/my-org/gcp-cloudfunction-terraform"
```


