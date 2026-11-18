# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.4.0"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.0/cinnamon-darwin-arm64.tar.gz"
    sha256 "b72e0b0c7639384dabbc13af0ae7e28c4e2b321e1cc92f37b6ed92860d8514fc"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.0/cinnamon-darwin-x64.tar.gz"
    sha256 "ca7a704a7997cb51ae41165d2668869e7f6a3a0e2a822c6456d284e3ea3309a3"
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
