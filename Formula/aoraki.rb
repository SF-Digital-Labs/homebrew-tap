# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.5.0/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "9507e0f239bca54754c8f255aef361e2905b18f661cab3d3a44196cea8536b4f"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.5.0/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "42f1285285d8ce36b8284f4490d62de503b7a745500feb113c9894bb979d0935"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.5.0/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8af3b4a31a27f6676bf72310e48b824aff32fc4866325684a69e93ed4c02ef84"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
