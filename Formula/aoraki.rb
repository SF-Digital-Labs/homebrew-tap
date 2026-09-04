# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.2/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "1e73db824a28140f7fecacd37dd7cd5de16340a4f7387080a32755dce3fc599f"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.2/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "6ff19ebf77ab18d72eeb087bff8b066f2a4e3e036dbc76e79e48464056cf349a"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.2/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9b668c2ec7279243a46fcc7b653f93e86ebb7b48ca1ab638fbaed7f6b4b26a68"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
