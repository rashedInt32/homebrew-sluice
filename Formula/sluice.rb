# Written by sluice's release workflow; edits here are overwritten.
class Sluice < Formula
  desc "Tmux-style sessions and prefix keys on top of zmx, with raw PTY passthrough"
  homepage "https://github.com/rashedInt32/sluice"
  license "MIT"

  depends_on "fzf"
  depends_on "neurosnap/tap/zmx"

  on_macos do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.2/sluice-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "4354c304af9fc9cef0ff3781570cfc0ff13dd0eed47716780c28cdb560350564"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.2/sluice-0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "2790613bc4feb5dd782e00981b2433e6ce8930832d0cd44269453b550fc3cf4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.2/sluice-0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "feeb6570ab273d156cf96a81deae6e7018ba0e3389abf39c793e0089f0b33bef"
    end
    on_intel do
      url "https://github.com/rashedInt32/sluice/releases/download/v0.4.2/sluice-0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "805358baeaef0647625cab14dc6bf89156c3ea95dd0052b4dd31ca47136e05df"
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
