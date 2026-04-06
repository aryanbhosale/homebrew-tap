class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.3/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "b1900d9ef9948a19d947d6895e025b0b0496c3a550c44b9bcf9843c12055063b"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.3/sh-guard-x86_64-apple-darwin.tar.gz"
      sha256 "f7ae6c5564e7d10f869dde409a2570a03f37ce772b0af4e5b805cb053f98db64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.3/sh-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab71f2a6643eebae85e16066ceeb77ab00c813b0d3d2230d40bc08fe6d66aaba"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.3/sh-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "989e9faf689a746797d16339d7435d95f840bcb5b5704fe1d7cf61144aba110f"
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
