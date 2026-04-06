class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.7/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "5902e32263df24e76f5bbb973710ee66a80faa995e74abdbd2ccf3e26e11fca2"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.7/sh-guard-x86_64-apple-darwin.tar.gz"
      sha256 "6179079fa30cde617af9bd8d9d32420691f053e598433bdf43864fc1e371378d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.7/sh-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d2cb24bf48140db758c3845cd28d3b82cb6555b1ec2d2bbeb443a0e5a106f88"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.7/sh-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31310992fa85b7f460fd7c27ac82aaf8df20c34681fcbfaa6331108afd5ba47d"
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
