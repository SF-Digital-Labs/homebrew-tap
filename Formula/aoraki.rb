# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.1/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "1ea5a4ff0c6fdc9bd4ed5da5fac31c4f5e69156f3b6fe496161e4441e170e943"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.1/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "83de5d76c9bb3a9c9dcc1868ab89aa0c46a5b0a8dcfbef043ff84b250fb56bca"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.1/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "32c72d43b0439648f6db3cc1c85ac2c7e5da58487878e14d5f411c5add6224e7"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
