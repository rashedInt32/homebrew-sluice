# Written by sluice's release workflow; edits here are overwritten.
class Sluice < Formula
  desc "Tmux-style sessions and prefix keys on top of zmx, with raw PTY passthrough"
  homepage "https://github.com/rashedInt32/sluice"
  license "MIT"

  depends_on "fzf"
  depends_on "neurosnap/tap/zmx"

  on_macos do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.1/sluice-0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "7ae6e225e23c9a4cc6cfcb1a7f11b6cd183114a0ed2dc00e01acd98ddae82ef3"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.1/sluice-0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "8df6f6e2ab2c6f8f38b18861c152dbee7f1faf49a7104f9cfbd94aea133440e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.1/sluice-0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4bf39ff5da5e38058561e198412f7529211ebd2a6f563f702175220a704a53fd"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.1/sluice-0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aafa814165e249a15f0a87be2bb6ea30249e25d700b86ea57507aa27ada5880a"
    end
  end

  def install
    bin.install "bin/sluice"
    pkgshare.install "share/sluice/bin", "share/sluice/config.example"
  end

  def caveats
    <<~TEXT
      Type `sluice` to start. With no sessions it opens the project picker.

      Config lives in ~/.config/sluice/config; copy only the lines you change
      from the example, which lists every default:
        #{opt_pkgshare}/config.example

      prefix+u, the Claude agent picker, needs jq: brew install jq
    TEXT
  end

  test do
    assert_match "sluice #{version}", shell_output("#{bin}/sluice --version")
  end
end
