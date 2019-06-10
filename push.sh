#!/usr/bin/env bash

set -e

if [[ $# -lt 2 ]]; then
    printf "Usage: $0 \e[4mGCP_PROJECT\e[0m \e[4mDOCKER_HUB_REPO\e[0m\n"
    exit 1
fi

project="$1"
docker_hub_repo="$2"

# Change into this directory.
cd "$(cd "$(dirname "$0")" && pwd)"

# Submit the build.
printf "\n\e[38;5;116mSubmitting build.\e[0m\n"

build_id="$(
    gcloud builds submit \
    --async \
    --format "value(id)" \
    --project "$project" \
    --substitutions "_DOCKER_HUB_REPO=${docker_hub_repo}" \
    --config ./cloudbuild.yaml .)"

printf "\nUsing build ID ${build_id}.\n"
printf "Do you want to follow the build logs? [Y/n] "
read confirm

if [[ "$confirm" = "Y" ]] || [[ "$confirm" = "y" ]] || [[ "$confirm" = "" ]]; then
    gcloud builds log "$build_id" --stream
else
    printf "To follow the build logs, run the following command:\n\n"
    printf "  \e[3mgcloud builds log ${build_id} --stream\e[0m\n"
fi
