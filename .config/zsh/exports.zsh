#  Use ~/.zshenv for anything that is needed outside of an interactive shell,
#  only interactive exports here.

#  =============================================================================
#  Always
#  =============================================================================

#  Path
#  -----------------------------------------------------------------------------
#  For a shell on zsh the following are processed in the order shown:
#
#  1. /etc/zshenv : always
#  2. ~/.zshenv : always
#  3. /etc/zprofile : login
#  4. ~/.zprofile : login
#  5. /etc/zshrc : interactive
#  6. ~/.zshrc : interactive
#  7. /etc/zlogin : login
#  8. ~/.zlogin : login
#
#  Interactive = terminal (you can type into it)
#  Login = ssh, shell invoked with `-l`, etc.
#
#  Normally you could/should set your path in ~/.zshenv so it is available to 
#  all possible shells. However on macos it injects the contents of the file
#  /etc/paths and all files in /etc/paths.d into the _start_ of $PATH as part
#  of /etc/zprofile. Thus if anything you want before these cannot be done in
#  .zshenv
#
#  The $PATH being setup here and/or the os-specific sections assumes that there
#  will not be a need for these paths for non-interactive shells such as ones 
#  you execute through launchctl/launchd - those need to set an explicit path 
#  for anything they need.
#
   path=(
       $path
       $HOME/bin)
   export PATH

#  Tell anything that pays attention to use colors
#  -----------------------------------------------------------------------------
   export CLICOLOR=1


#  Set default blocksize for ls, df, du
#  ------------------------------------------------------------
   export BLOCKSIZE=1k

#  Stop tracking history for less command (~/.lesshst)
#  ------------------------------------------------------------
   export LESSHISTFILE=-
   
#  =============================================================================
#  macos only
#  =============================================================================

if [[ "$(uname)" == "Darwin" ]]; then

#  Path
#  -----------------------------------------------------------------------------
#  See do above
   path=(
       /opt/homebrew/opt/curl/bin
       /opt/homebrew/opt/openssl/bin
       $path)
   export PATH

#  Redirect man to browser
#  -----------------------------------------------------------------------------
   export MANPAGER="col -b | open -a /Applications/Firefox.app -f"

#  Dump man to terminal instead of using less (MANPAGER)
#  -----------------------------------------------------------------------------
   export MANPAGER="col -bx"

fi

#  =============================================================================
#  linux only
#  =============================================================================

if [[ "$(uname)" == "Linux" ]]; then

# Nothing yet

fi