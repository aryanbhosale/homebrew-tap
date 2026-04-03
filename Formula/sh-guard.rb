class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.0/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "d848cd9db06b398b7b52f6c3d6afea7be5a5a0b761a96589cbbd4fc679d9a3ff"
    end
  end

  def install
    bin.install "sh-guard"
    bin.install "sh-guard-mcp" if File.exist?("sh-guard-mcp")
  end

  test do
    assert_match "SAFE", shell_output("#{bin}/sh-guard 'ls -la'")
  end
end
