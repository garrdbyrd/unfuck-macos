

# Settings -> Keyboard -> Keyboard Shortcuts -> Modifer Keys
#             Control key   -> Command            
#             Option        -> Control
#             Command       -> fn Function
#
#
#
#
#
#

# Home and End keys
sudo mkdir ~/Library/KeyBindings
cd ~/Library/KeyBindings
cat >> DefaultKeyBinding.dict << EOF
    "\UF729"  = moveToBeginningOfLine:; // home
    "\UF72B"  = moveToEndOfLine:; // end
    "$\UF729" = moveToBeginningOfLineAndModifySelection:; // shift-home
    "$\UF72B" = moveToEndOfLineAndModifySelection:; // shift-end
    "^\UF703" = ("moveWordForward:", "moveWordForward:", "moveWordBackward:");
    "^$\UF703" = ("moveWordForwardAndModifySelection:", "moveWordForwardAndModifySelection:", "moveWordBackwardAndModifySelection:");
EOF

# homebrew
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip-components 1 -C homebrew

# Rectangle
brew install --cask rectangle
# Swift Quit
brew install --cask swift-quit
# Alt Tab
brew install --cask alt-tab