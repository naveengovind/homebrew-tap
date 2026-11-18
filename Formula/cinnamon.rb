# Cinnamon: themes and extensions for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  version "0.4.1"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.1/cinnamon-darwin-arm64.tar.gz"
    sha256 "93f2f5aabb15865755c146e2062540d0fbe9794d606e585f4641e90d21c27bcc"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.1/cinnamon-darwin-x64.tar.gz"
    sha256 "dfc224b03f85070eae238be4e8d79e258ecde5b01be420da32452a1279924af1"
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
