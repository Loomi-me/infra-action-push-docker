#!/bin/sh -l

IMAGE_NAME="$INPUT_GCR_HOST/$INPUT_GCR_PROJECT_ID/$INPUT_IMAGE_NAME:$INPUT_IMAGE_TAG"

echo -n $GCLOUD_SERVICE_KEY | docker login -u _json_key --password-stdin https://$INPUT_GCR_HOST/

cd $INPUT_WORKING_DIR

docker build -t $IMAGE_NAME .
docker push $IMAGE_NAME
