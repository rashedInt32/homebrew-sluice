# Written by sluice's release workflow; edits here are overwritten.
class Sluice < Formula
  desc "Tmux-style sessions and prefix keys on top of zmx, with raw PTY passthrough"
  homepage "https://github.com/rashedInt32/sluice"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.0/sluice-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "aa441282b79940abc9299faddbcb495271a7697e78ab3b78d78ba607eecff054"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.0/sluice-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "f93b9b0ef208a0ef9f7d360c96d344ae83fbc6178a353722dcd0b3e58d87c453"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.0/sluice-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d17a47ae3e1b7c9769ca3c07709e49ae6a6563333320124983e1633e47d2d3e"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.0/sluice-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27ecb96c3b03d0ec343053442daad223ae97e20a298fea677867312db084b520"
    end
  end

  depends_on "fzf"
  depends_on "neurosnap/tap/zmx"

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
