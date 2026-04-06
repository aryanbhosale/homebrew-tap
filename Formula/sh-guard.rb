class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.5/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "c1a00f293902d51c55a033b1f367dc6c0184eed160e23006c9c0282dd0c38938"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.5/sh-guard-x86_64-apple-darwin.tar.gz"
      sha256 "6bb4e1711dd4b384026da17515a695281e471ce5072f3303408abc53c1a4a48f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.5/sh-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40b4fb1e1aaa0f27a38f1594c7978889b214e56de7e3df9ace587d0a539ffb46"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.5/sh-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c286e01366b0eda394f398296c7a57f40d7492a3891293502356416eeb46e42"
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
