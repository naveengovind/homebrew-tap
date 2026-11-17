# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.3.1"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.1/cinnamon-darwin-arm64.tar.gz"
    sha256 "465dedfb7f07e5656a01c150b5b4035b2deb6e0b662ee777f2c6a4865cbf6433"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.1/cinnamon-darwin-x64.tar.gz"
    sha256 "c8eaa2ca34884536f40e34d338408073210a4515ef3f6897d298daaf5898cb88"
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
