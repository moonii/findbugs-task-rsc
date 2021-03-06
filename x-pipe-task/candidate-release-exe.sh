#!/bin/bash
# vim: set ft-sh

set -e

OUTPUT="$PWD/candidate-release"
VERSION="$(cat ./version/number)"
FINAL_VERSION="$(cat final-version/version)"

echo "OUTPUT=$OUTPUT=VERSION=$VERSION=FINAL_VERSION=$FINAL_VERSION="

pushd source-git/
  echo "$FINAL_VERSION" > src/version/VERSION

  #bosh -n create release --with-tarball --name concourse --version "$VERSION"
  mv dev_releases/PaasXpert-${VERSION}.war "$OUTPUT"
popd
