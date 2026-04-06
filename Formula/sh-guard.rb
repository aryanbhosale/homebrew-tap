class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.4/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "0405f83b35dee8d28dcc99ba1396ee27ccb2d5fd5ad8ed9a92625561577c323a"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.4/sh-guard-x86_64-apple-darwin.tar.gz"
      sha256 "82548ad8045f93a826a1fa69532b68a96dc66383f84f8eadb46eaf6c497850d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.4/sh-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3441ff8f59589a10596315500b57f3c711c5c4e5f97cb342ef5e188a4b4946f0"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.4/sh-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dfa7bc29f1129bf296df0e8e08f6da8a98b40cbe14b4ed2207625248728d5d45"
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
