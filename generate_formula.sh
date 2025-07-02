#!/bin/bash
set -e
VERSION="$1"
if [[ -z "$VERSION" ]]; then
  echo "Usage: ./generate_formula.sh vX.Y.Z"
  exit 1
fi

TARBALL="https://github.com/neon-covenant/identity-suite/archive/refs/tags/${VERSION}.tar.gz"
curl -L -o temp.tar.gz "$TARBALL"
SHA256=$(shasum -a 256 temp.tar.gz | awk '{print $1}')
rm temp.tar.gz

cat > Formula/identity-suite.rb <<EOF
class IdentitySuite < Formula
  desc "IdentitySuite CLI and API tools"
  homepage "https://github.com/neon-covenant/identity-suite"
  url "${TARBALL}"
  sha256 "${SHA256}"
  license "MIT"

  depends_on "perl"

  def install
    bin.install "cli.pl"
  end

  test do
    system "#{bin}/cli.pl", "--version"
  end
end
EOF

echo "[✓] Formula generated with SHA: $SHA256"
