# Cinnamon: the menu bar app and the cinnamon command, for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
cask "cinnamon" do
  version "0.4.3"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.3/Cinnamon-app-darwin-arm64.zip"
    sha256 "d02edc28c2bf080971167834a39902ee78f25258b80630deaed71cd34791664a"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.3/Cinnamon-app-darwin-x64.zip"
    sha256 "1af8aa29b5ac2d8c4e6643730df0dbc98a4af38e29227e3577ae5c4ee9a64b52"
  end

  name "Cinnamon"
  desc "Themes and extensions for the Claude desktop app"
  homepage "https://github.com/naveengovind/claude-cinnamon"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Cinnamon.app"
  binary "#{appdir}/Cinnamon.app/Contents/Resources/cinnamon"

  # takes out the login item, the Claude Code mod and the skill, and leaves Claude as it was
  uninstall script: {
              executable: "#{appdir}/Cinnamon.app/Contents/Resources/cinnamon",
              args:       ["uninstall"],
              must_succeed: false,
            },
            quit:   "local.claude-cinnamon.app"

  zap trash: "~/.config/claude-cinnamon"

  caveats <<~EOS
    Open Cinnamon from Applications (it lives in the menu bar) to finish setting up, or run: cinnamon install
    Cinnamon needs Developer Mode in Claude: Help > Troubleshooting > Enable Developer Mode.
    If you installed the cinnamon formula before, remove it first: brew uninstall cinnamon
  EOS
end
