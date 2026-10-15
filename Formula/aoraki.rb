# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.5.1/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "ad0edc3612fc413530dc02ade56e6dc74b79e5d07984f6e00dfd8ba746d7fa62"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.5.1/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "ecebddd05849bb9fa867477d825bf69f5f99de6b4ec5e113f304fbc5c62da11e"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.5.1/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "828acd4511be310e0f080342f9bb40dbb0e103fb201f7f1b079ec4b4437adff3"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
