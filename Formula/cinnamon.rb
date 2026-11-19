# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.4.4"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.4/cinnamon-darwin-arm64.tar.gz"
    sha256 "cafb0d58d0b19b7b0706507eebedc617d55b8750a55180f13b8dd748661495f5"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.4/cinnamon-darwin-x64.tar.gz"
    sha256 "d98b8d53c6f0d75329537cccb7a2a03f7a12737378613946f1a1d99e8c61a95d"
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
