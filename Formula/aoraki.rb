# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version ""
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download//aoraki-aarch64-apple-darwin.tar.gz"
      sha256 ""
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download//aoraki-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download//aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 ""
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
