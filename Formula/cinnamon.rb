# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.4.3"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.3/cinnamon-darwin-arm64.tar.gz"
    sha256 "d7f799e4acdb661eb081819232a465956f2ef1b24a6543aeb4db71f5e6d58bac"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.3/cinnamon-darwin-x64.tar.gz"
    sha256 "b79da186ae3a8fda23e5f722a61357164f16a87b3b3b7c508ace32b3b7821695"
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
