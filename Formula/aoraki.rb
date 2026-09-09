# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.4/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "9b1f21e61c499c68d87c5b692361355a8f87b9c0f2bad6e4bb8b4cbfdf0a3bd1"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.4/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "4029acc6b1cb4019ad31dc71e37492c42bb2256fab88832c29b73d85841ac4cb"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.4/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "97ccc4271a921cfc80cf2ee8c169427a06ad61038ecf0e94244ac87b40d29730"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
