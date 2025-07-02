#!/bin/bash
set -e
VERSION="$1"
if [[ -z "$VERSION" ]]; then
  echo "Usage: ./release.sh vX.Y.Z"
  exit 1
fi

cd ../identity-suite
git tag "$VERSION"
git push origin "$VERSION"
cd ../brew-identity

./generate_formula.sh "$VERSION"
git add Formula/identity-suite.rb
git commit -m "Publish Homebrew tap for $VERSION"
git push origin main
