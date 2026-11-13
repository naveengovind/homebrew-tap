# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.2.1"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.2.1/cinnamon-darwin-arm64.tar.gz"
    sha256 "7b2c27020fff63103d6ad6d4ef5f95392f39c917197d0c2bdb466828a758c150"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.2.1/cinnamon-darwin-x64.tar.gz"
    sha256 "6975b4e2250373c5ce90997cced8c02f595ab5a0ad3bca26b439cc2971b49ff1"
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
