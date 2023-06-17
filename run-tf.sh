#!/bin/bash

echo "------------ Running Terraform  ------------------"
git_sha=$(git rev-parse HEAD)

cd terraform

export GOOGLE_OAUTH_ACCESS_TOKEN=$(gcloud auth print-access-token --impersonate-service-account=github-action-pipeline@sandbox-381502.iam.gserviceaccount.com)

terraform plan -lock=false -var "revision=$git_sha" -var-file="dev/terraform.tfvars" -out tfplan

terraform apply -lock=false tfplan
