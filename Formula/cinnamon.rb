# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.3.2"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.2/cinnamon-darwin-arm64.tar.gz"
    sha256 "6151bcc025fb01b02d618a77e2e121d1f1c79a133effc99288021d2d4bbc97b0"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.2/cinnamon-darwin-x64.tar.gz"
    sha256 "3c99bca0f9f352ee12963b0aff1f8438acb9b66983e0a01e20fa72c538406720"
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
