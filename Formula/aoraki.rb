# typed: false
# frozen_string_literal: true

# Binary formula for the Aoraki CLI. Kept in sync with the latest GitHub
# release of SF-Digital-Labs/aoraki-cli by .github/workflows/sync.yml.
class Aoraki < Formula
  desc "Ship code to the Aoraki cloud from your terminal, by hand or by agent"
  homepage "https://sf-digital-labs.github.io/aoraki-cli/"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.6/aoraki-aarch64-apple-darwin.tar.gz"
      sha256 "f3915ab090e3405197b24c8e57a1caa1e9879d5671d88423ed492083b30a7117"
    else
      url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.6/aoraki-x86_64-apple-darwin.tar.gz"
      sha256 "91e2237643bf53600155d40e531f294ff4e841d2601bd906bb439dd3afc1cece"
    end
  end

  on_linux do
    url "https://github.com/SF-Digital-Labs/aoraki-cli/releases/download/v0.2.6/aoraki-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b902f070e28ba96e88f583470dc927d47b46ae186b75a9387c52467b71c9c815"
  end

  def install
    bin.install "aoraki"
  end

  test do
    assert_match "aoraki", shell_output("#{bin}/aoraki --version")
  end
end
