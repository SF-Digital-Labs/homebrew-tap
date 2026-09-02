# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.0/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "53b9496f9e3c9f64cd0309acc938505f108965e68b87df3dff62ac245ad4a9e1"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.0/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "37c7c4245edda946724e8f1fc402441057463c8a54c37b85010662e242453734"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.0/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ab7faf80e32015ec5e0ae1f29b5e0e0e3b65bc85bc07933a8c2b653c322967f3"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
