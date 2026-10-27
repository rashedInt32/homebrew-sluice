# Written by sluice's release workflow; edits here are overwritten.
class Sluice < Formula
  desc "Tmux-style sessions and prefix keys on top of zmx, with raw PTY passthrough"
  homepage "https://github.com/rashedInt32/sluice"
  license "MIT"

  depends_on "fzf"
  depends_on "neurosnap/tap/zmx"

  on_macos do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.3/sluice-0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "9ab77b0ec78a4c9283a6bfa74b61eb5c9b875576f5b3f2e5c32f2e5d30d6df8c"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.3/sluice-0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "84c50cb398d52dccbacd81135e1431e30ab8b0b935d32ada4a73199839ce2caf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.3/sluice-0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4d8a55f5405fecbff628e78b7c8686319bb6ae05775f8d8cae31b67775d7ddc"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.3/sluice-0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4dddce31c874f76e9c2f5015bc409d643b22b1fcfa1dd93a1b87886e6b7fff7d"
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
