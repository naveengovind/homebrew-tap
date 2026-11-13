# Cinnamon — themes and extensions for the Claude desktop app (macOS).
# The source repo is private: Homebrew fetches it with git, using your normal GitHub credentials.
class Cinnamon < Formula
  desc "Themes and extensions for the Claude desktop app, Spicetify-style"
  homepage "https://github.com/naveengovind/claude-cinnamon"
  url "https://github.com/naveengovind/claude-cinnamon.git",
      tag:      "v0.1.2",
      revision: "9e1b9516fdc2001e0507621ca460e6f86fb9f996"
  head "https://github.com/naveengovind/claude-cinnamon.git", branch: "main"

  depends_on :macos
  depends_on "oven-sh/bun/bun"

  def install
    libexec.install Dir["*"]
    # CINNAMON_ROOT points at the stable opt/ path, so the login item keeps working across upgrades.
    (bin/"cinnamon").write_env_script libexec/"bin/cinnamon", CINNAMON_ROOT: opt_libexec
  end

  def caveats
    <<~EOS
      Finish setting up (builds Cinnamon Helper and adds its login item):
        cinnamon install

      Needs the Xcode Command Line Tools (xcode-select --install) and Developer Mode
      in Claude (Help > Troubleshooting > Enable Developer Mode).

      Before `brew uninstall cinnamon`, run: cinnamon uninstall
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/cinnamon help")
  end
end
