# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.3.0/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "117df78041aaf2b1ec1183a7f6c281514d4d101c3d4368c522b97bdb71852428"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.3.0/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "fbe63d2744b0a3c1bb71e2e315d1e9fa0938b4f5865d91f6047ee953b3d6180d"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.3.0/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4796303a374748801f5ca36ecd38cf14295ff91c2eb3a73bb7a7e026125ed4c4"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
