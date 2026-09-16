# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.5/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "48a5342b9578d61b1a6ba548c78bc83903f6f349d28f1453b050c9d190e53068"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.5/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "0608618eaa1db89b9db079c54ad259b5e4aa18ef9fc24a1ca4ba3eec6ef22cbb"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.5/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "21ccf8752b5b22496d456b80e2c4037bd33ebed51f6d58be44997d1ce940b211"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
