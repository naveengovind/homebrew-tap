# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.3.0"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.0/cinnamon-darwin-arm64.tar.gz"
    sha256 "cfb183d3fae8796ba3c81f2ad42f5db253541794377ba88c3837a6713d404c05"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.0/cinnamon-darwin-x64.tar.gz"
    sha256 "c334b50253ddcbf5de557d4dd9caaa1266c12f1d1ed4fa582603d188ad31f2fe"
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
