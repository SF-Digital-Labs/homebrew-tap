# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.3/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "aff735aee652c4a02e7e7de2edf18d3361015a2bfcb34e308606b65174cffb48"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.3/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "81387f2384795c7166f1170e0eab896f944ac80db0796760c8eee4854144e2b3"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.3/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "355028ca14139fbe893609b74f0257067882bc4b7b7d8ac8048f228a1bef5df1"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
