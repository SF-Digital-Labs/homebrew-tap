# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.1.0/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "0f8e5c4656be62d17c161f9c800a9b396ba9d93a46b9c6662a65eaf2663a75d2"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.1.0/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "18948f44e5cef3d64a11d96a7d0f2dd030bcd4574c3a215af47ce21a024623c5"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.1.0/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "081e00cb4a84d6685be19f0ee667bbcf2de0d199f9ef97fe475899801d6f0477"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
