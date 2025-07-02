class IdentitySuite < Formula
  desc "CLI for identity generation and API bootstrapping"
  homepage "https://github.com/neon-covenant/identity-suite"
  url "https://github.com/neon-covenant/identity-suite/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "<fill-this-in>"
  license "MIT"

  depends_on "perl"

  def install
    bin.install "cli.pl" => "identity-suite"
    system "chmod", "+x", bin/"identity-suite"
  end

  test do
    system "#{bin}/identity-suite", "status"
  end
end
