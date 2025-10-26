# MacOS settings to manually set
# Settings -> Keyboard -> repeat rate -> max

# old:
# ```
# {
#     "@\UF703" = ("moveWordForward:", "moveWordForward:", "moveWordBackward:");
#     "@$\UF703" = ("moveWordForwardAndModifySelection:", "moveWordForwardAndModifySelection:", "moveWordBackwardAndModifySelection:");
#     "\UF729" = "moveToBeginningOfLine:";
#     "\UF72B" = "moveToEndOfLine:";
#     "$\UF729" = moveToBeginningOfLineAndModifySelection:; // shift-home
#     "$\UF72B" = moveToEndOfLineAndModifySelection:; // shift-end
#     "@\UF729" = moveToBeginningOfDocument:; // ctrl-home
#     "@\UF72B" = moveToEndOfDocument:; // ctrl-end
#     "@$\UF729" = moveToBeginningOfDocumentAndModifySelection:; // ctrl-shift-home
#     "@$\UF72B" = moveToEndOfDocumentAndModifySelection:; // ctrl-shift-end
# }

# Home, End, and Ctrl+Arrow key bindings for macOS
# (not quite right, still needs adjustment, but mostly works)
mkdir -p ~/Library/KeyBindings
cd ~/Library/KeyBindings
cat > DefaultKeyBinding.dict << 'EOF'
{
    // Ctrl (remapped Command) + Right / Left → move by word
    "@\UF703"  = ("moveWordForward:", "moveWordForward:", "moveWordBackward:");
    "@\UF702"  = ("moveWordBackward:", "moveWordBackward:", "moveWordForward:");

    // Ctrl (remapped Command) + Shift + Right / Left → select by word
    "@$\UF703" = ("moveWordForwardAndModifySelection:", "moveWordForwardAndModifySelection:", "moveWordBackwardAndModifySelection:");
    "@$\UF702" = ("moveWordBackwardAndModifySelection:", "moveWordBackwardAndModifySelection:", "moveWordForwardAndModifySelection:");

    // Home / End → line navigation
    "\UF729"   = moveToBeginningOfLine:;
    "\UF72B"   = moveToEndOfLine:;
    "$\UF729"  = moveToBeginningOfLineAndModifySelection:;
    "$\UF72B"  = moveToEndOfLineAndModifySelection:;

    // Ctrl (remapped Command) + Home / End → document navigation
    "@\UF729"  = moveToBeginningOfDocument:;
    "@\UF72B"  = moveToEndOfDocument:;
    "@$\UF729" = moveToBeginningOfDocumentAndModifySelection:;
    "@$\UF72B" = moveToEndOfDocumentAndModifySelection:;

    // Alt+Backspace → delete previous word
    "~\U0008"  = deleteWordBackward:;
}
EOF


# Remove Finder from Dock
cd ~/Library/KeyBindings
cat << EOF >> /System/Library/CoreServices/Dock.app/Contents/Resources/DockMenus.plist
This is text entered via the keyboard or via a script.
EOF

# homebrew
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip-components 1 -C homebrew

# 
# User interface / usability
#
# Rectangle (control windows)
brew install --cask rectangle
#   manually import config
# Swift Quit (make quitting programs actually make them stop)
brew install --cask swift-quit
#   all apps except the following: Logic Pro X
# Alt Tab 
brew install --cask alt-tab
# karabiner-elements (bind Cmd -> Ctrl, etc)
brew install --cask karabiner-elements
cp configs/karabiner.json ~/.configs/karabiner/karabiner.json
# mos (smooth scrolling)
brew install mos
# Background Music (mute individual apps)
brew install --cask background-music

#
# Applications 
#
# libre office
brew install --cask libreoffice
# krita
brew install --cask krita
# betterdisplay
brew install --cask betterdisplay
# linear mouse
brew install --cask linearmouse
# FireFox
brew install --cask firefox

# others to consider:
# Raycast
# brew install --cask raycast
# Sound Control (use Background Music instead)
#brew install --cask sound-control

# disable scroll acceleration (possibly not necessary since linear mouse install)
# defaults write -g com.apple.scrollwheel.scaling -1