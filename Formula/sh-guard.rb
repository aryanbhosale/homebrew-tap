class ShGuard < Formula
  desc "Semantic shell command safety classifier for AI coding agents"
  homepage "https://github.com/aryanbhosale/sh-guard"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.8/sh-guard-aarch64-apple-darwin.tar.gz"
      sha256 "ff45d2604aa6b39f69e7d3042d92c0de754b01a6c0df2a30c3f7349403abd80e"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.8/sh-guard-x86_64-apple-darwin.tar.gz"
      sha256 "086e4a75afa757af13ed111972288affa25d9648b3f32ce29f13db65bfad2901"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.8/sh-guard-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf380a9ed45aa5ef2ffeb2526b18ec98975357964b2457a184dfe5a37d7a9fe0"
    end
    on_intel do
      url "https://github.com/aryanbhosale/sh-guard/releases/download/v0.1.8/sh-guard-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0db9b2eb75646175ea00b414b2c53db628034c17d7db91204a2a7d87cd52cce"
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
