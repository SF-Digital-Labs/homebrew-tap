# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.4.0/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "d61f95f4f56e604fffd26ba0b7c8bf7e0cbcb02c7078c92f6ecb90046501fcff"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.4.0/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "97ff5f853212b7ffbd6176bc28fec16a78765617f4613547689cd8e3f2a48fba"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.4.0/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0e1f1e7a0b832c4f3645c7b0c5e19ea5a37974e5e102c40c1502b89c071458f3"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
