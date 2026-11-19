# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.4.5"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.5/cinnamon-darwin-arm64.tar.gz"
    sha256 "7d696612cfc00816ea52e8992ff164490c5e651cfef8a6a8adb497206700afe6"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.5/cinnamon-darwin-x64.tar.gz"
    sha256 "e02d5a9e1b46933928ef5e5aecb10cb67ea7ff4e88cb5d1c442dac67a5ea8413"
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
