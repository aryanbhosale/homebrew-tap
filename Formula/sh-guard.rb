class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.6/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "375649581cb738db52ec7a5e394f231f8327003894780f0cd0059624c738b1fb"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.6/sh-guard-x86_64-apple-darwin.tar.gz"
      sha256 "7f14a5b1d5b8c3a59040e1da84ccf7e73b04d1312e8dac825601c76f53e83da2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.6/sh-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f76429bc6c6aaad2addcbb66a9bfd4c2819d1814e653124cd9f789a88fd7769"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.6/sh-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b8f5e258de318b92e57174e5d167622502c6ffe4762236f3c98294a5f7c700d"
    end
  end

  def install
    bin.install "sh-guard"
    bin.install "sh-guard-mcp" if File.exist?("sh-guard-mcp")
  end

  def caveats
    <<~EOS
      To auto-configure all your AI coding agents (Claude Code, Codex, Cursor, etc.):
        sh-guard --setup

      To remove sh-guard from all agents:
        sh-guard --uninstall
    EOS
  end

  test do
    assert_match "SAFE", shell_output("#{bin}/sh-guard 'ls -la'")
  end
end
