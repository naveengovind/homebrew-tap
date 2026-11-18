# Cinnamon: the menu bar app and the cinnamon command, for the Claude desktop app (macOS).
# Made by scripts/formula.ts in naveengovind/claude-cinnamon at each release; change it there.
cask "cinnamon" do
  version "0.4.0"

  on_arm do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.0/Cinnamon-app-darwin-arm64.zip"
    sha256 "51e1c2f5bc17155dc9431bc34a3efcd7040fe1007f3456f1d8150c0f5913307d"
  end
  on_intel do
    url "https://github.com/naveengovind/claude-cinnamon/releases/download/v0.4.0/Cinnamon-app-darwin-x64.zip"
    sha256 "9e34f36ad8ed904529b5d034f9905d0a12f2ed522de3808b38a83fa2f41acb8c"
  end

  name "Cinnamon"
  desc "Themes and extensions for the Claude desktop app"
  homepage "https://github.com/naveengovind/claude-cinnamon"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

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
