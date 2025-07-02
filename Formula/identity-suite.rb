class IdentitySuite < Formula
  desc "CLI + REST API identity generator with Plack server"
  homepage "https://neoncovenant.com"
  url "https://github.com/neon-covenant/identity-suite/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ADD_REAL_SHA_HERE"
  license "MIT"

  depends_on "perl"
  depends_on "cpanm"

  def install
    bin.install "cli.pl" => "identity-suite"
    prefix.install Dir["lib", "scripts", "meta_api.psgi", "README.md"]
  end

  test do
    system "#{bin}/identity-suite", "status"
  end
end
