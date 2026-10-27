# Written by sluice's release workflow; edits here are overwritten.
class Sluice < Formula
  desc "Tmux-style sessions and prefix keys on top of zmx, with raw PTY passthrough"
  homepage "https://github.com/rashedInt32/sluice"
  license "MIT"

  depends_on "fzf"
  depends_on "neurosnap/tap/zmx"

  on_macos do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.4/sluice-0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "83fcf0e354b480ae1a3154bf832f659145da5719f3b22f58f376c3be6c6cd41b"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.4/sluice-0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "d1bb5d7b5321f7268f273a07f12566f8aa6830f3f0b4e2cd7cc779badd4ee5e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.4/sluice-0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef899b0ccf8c49d4c848b2f6f11519298063f9a1f32694a241ba7990228cd837"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.4/sluice-0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "544bbbc01aaee108537ecb58637596b1a35b61f3783ae2b744faf0b09c41f5a9"
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
