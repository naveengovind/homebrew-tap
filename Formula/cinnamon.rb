# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.3.4"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.4/cinnamon-darwin-arm64.tar.gz"
    sha256 "c88974762b47552d56669835b496e4bce0947a786fa0bed2d23d50f45e5f9fc0"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.3.4/cinnamon-darwin-x64.tar.gz"
    sha256 "b69d1fe98f21eb54a7b593d5f7f765741b125c320d885595a6b1224f55a17360"
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
