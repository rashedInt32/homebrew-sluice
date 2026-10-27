# Written by sluice's release workflow; edits here are overwritten.
class Sluice < Formula
  desc "Tmux-style sessions and prefix keys on top of zmx, with raw PTY passthrough"
  homepage "https://github.com/rashedInt32/sluice"
  license "MIT"

  depends_on "fzf"
  depends_on "neurosnap/tap/zmx"

  on_macos do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.5/sluice-0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "285ab7f78b2903cd0abb65b6d41bd5ee9fa8e22c9ea6cab2d5c42711c7df177a"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.5/sluice-0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "b28b54c656aa09d081639441d568d5b7bee7ada6be9086c36f8e849fe935cdb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.5/sluice-0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "987e0d3188c00d00f8223c7ce6b47d91a8fe2a09f695b4cd8396dd3a6af453ce"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.5/sluice-0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62480d53041465a744192f29749427760dfad679885ec7cca70e47c077248d85"
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
