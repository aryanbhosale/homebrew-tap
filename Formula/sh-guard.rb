class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.9/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "5ea5d99f4bea610e51fb14fafb43cdb502c63ff1bf16ffa814c3abd3bf578e71"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.9/sh-guard-x86_64-apple-darwin.tar.gz"
      sha256 "1474bd10db27a393cd99e547e18e189022d1402af4c950d3b74dc4486755f0d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.9/sh-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b09ada0cc34b0368e9e8cdce6442d5ac7e32ff88f3cb38ea4629c47a970bc9d4"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.9/sh-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2d3bedbb8b86e76f9da0f2954d608dd3797684b609788ffd8fbc8331aa1d63c"
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
