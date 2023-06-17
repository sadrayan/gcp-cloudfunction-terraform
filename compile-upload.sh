#!/bin/bash

echo "------------ Building Project -----------------"
cd app/MyHTTPFunction
npm run compile:ci
cd -

echo '------------ Uploading Artifacts -----------------'
git_sha=$(git rev-parse HEAD)
sa="github-action-pipeline@sandbox-381502.iam.gserviceaccount.com"

gcloud --quiet config set project sandbox-381502
gcloud --quiet --impersonate-service-account=$sa alpha storage cp app/MyHTTPFunction/dist/my-http-function.zip gs://artifact-sandbox-381502/MyHTTPFunction/myfunction-"$git_sha".zip

