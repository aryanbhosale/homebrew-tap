class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.10/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "56a4e91df78ac11eacb046885ca7266da965ca76e5be6c908127dd5333fd16c0"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.10/sh-guard-x86_64-apple-darwin.tar.gz"
      sha256 "513dd61dd34d739b240011f9d620ec3fb6b7d11524d2c1fd7b9545ca795e15ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.10/sh-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "772a53bb5f736462b21e1e643006fc2d6abbd31ef93f575a030e3d86b2daeee3"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.10/sh-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c1a34a26e5eb4ab58bfc4f879ba6bca366c1df8e3a568e2b77198a92fd83d9f"
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
