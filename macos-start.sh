

# Settings -> Keyboard -> Keyboard Shortcuts -> Modifer Keys
#             Control key   -> Command            
#             Option        -> Control
#             Command       -> fn Function
#
# These steps are deprecated, use karabiner-elements to rebind all keys.
#
#
#
#

# Home and End keys
# sudo mkdir ~/Library/KeyBindings
# cd ~/Library/KeyBindings
# cat >> DefaultKeyBinding.dict << EOF
#     "\UF729"  = moveToBeginningOfLine:; // home
#     "\UF72B"  = moveToEndOfLine:; // end
#     "$\UF729" = moveToBeginningOfLineAndModifySelection:; // shift-home
#     "$\UF72B" = moveToEndOfLineAndModifySelection:; // shift-end
#     "^\UF703" = ("moveWordForward:", "moveWordForward:", "moveWordBackward:");
#     "^$\UF703" = ("moveWordForwardAndModifySelection:", "moveWordForwardAndModifySelection:", "moveWordBackwardAndModifySelection:");
# EOF
# Home, End, and Ctrl+Arrow key bindings for macOS
mkdir -p ~/Library/KeyBindings
cd ~/Library/KeyBindings
cat > DefaultKeyBinding.dict << 'EOF'
{
    "\UF729"  = moveToBeginningOfLine;                     // Home
    "\UF72B"  = moveToEndOfLine;                           // End
    "$\UF729" = moveToBeginningOfLineAndModifySelection;   // Shift+Home
    "$\UF72B" = moveToEndOfLineAndModifySelection;         // Shift+End

    "^\UF702"  = moveWordBackward;                         // Ctrl+Left
    "^\UF703"  = moveWordForward;                          // Ctrl+Right
    "^$\UF702" = moveWordBackwardAndModifySelection;       // Ctrl+Shift+Left
    "^$\UF703" = moveWordForwardAndModifySelection;        // Ctrl+Shift+Right
}
EOF


# Remove Finder from Dock
cd ~/Library/KeyBindings
cat << EOF >> /System/Library/CoreServices/Dock.app/Contents/Resources/DockMenus.plist
This is text entered via the keyboard or via a script.
EOF

# homebrew
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip-components 1 -C homebrew

# Rectangle
brew install --cask rectangle
# Swift Quit
brew install --cask swift-quit
# Alt Tab
brew install --cask alt-tab
# FireFox
brew install --cask firefox
# Sound Control ?
brew install --cask sound-control
# krita
brew install --cask krita
# karabiner-elements
brew install --cask karabiner-elements
# mos ?
brew install mos
# libre office
brew install --cask libreoffice
# betterdisplay
brew install --cask betterdisplay
# mute individual apps
brew install --cask background-music

# disable scroll acceleration
defaults write -g com.apple.scrollwheel.scaling -1