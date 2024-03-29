#!/usr/bin/env bash

set -e
set -o pipefail
set -v

initialGitHash=$(git rev-list --max-parents=0 HEAD)
node ./studio-build.js $initialGitHash &

npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5d9345cb70023300157f9a56
gatsby build

wait
echo "Stackbit-build.sh finished build"
