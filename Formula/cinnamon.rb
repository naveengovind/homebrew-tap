# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.3.3"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.3/cinnamon-darwin-arm64.tar.gz"
    sha256 "427ba867e12422852fceb7e2d41ee5d01694fc9c669506613cd07027c50c5b72"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.3/cinnamon-darwin-x64.tar.gz"
    sha256 "ecbf922b446ac4302a4441bdb178b1ca0d5562ef63af837db9c30725075fabb5"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: :ventura

  def install
    bin.install "cinnamon"
  end

  def caveats
    <<~EOS
      Finish setting up (adds the login item that applies Cinnamon each time Claude starts):
        cinnamon install

      Cinnamon needs Developer Mode in Claude: Help > Troubleshooting > Enable Developer Mode.

      Before `brew uninstall cinnamon`, run: cinnamon uninstall
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cinnamon --version").strip
  end
end
