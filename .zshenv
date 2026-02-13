#  Use ~/.config/zsh/export.zsh for anything that is interactive only, only non-interactive exports here.

#  Set VSCode as default editor (here because tools may invoke this outside of shells)
#  ------------------------------------------------------------
   # Requires running "Shell Command: Install 'code' command in PATH" one time from Visual Studio Command Palette (⇧⌘P). 
   export EDITOR="code -w"

#  Move data/config directories to consistent homes
#  ------------------------------------------------------------
   export NPM_CONFIG_CACHE="$HOME/.cache/npm"
  
#  Load NVM (Node Version Manager) (here because VS Code plugins may look for these - macos pushes anything here into
#  environment of all processes)
#  -----------------------------------------------------------------------------
   export NVM_DIR="$HOME/.local/share/nvm"
   # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
   # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion