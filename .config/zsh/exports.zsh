#  Use ~/.zshenv for anything that is needed outside of an interactive shell,
#  only interactive exports here.

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
#  The $PATH being setup here assumes that there will not be a need for these
#  paths for non-interactive shells such as ones you execute through 
#  launchctl/launchd - those need to set an explicit path for anything they 
#  need.
#
#  export PATH="<more important path>:$PATH"
   path=(
      /opt/homebrew/opt/curl/bin
      /opt/homebrew/opt/openssl/bin
      $path
      $HOME/bin
      /Tools/node/bin)
   export PATH

#  Tell anything that pays attention to use colors
#  -----------------------------------------------------------------------------
   export CLICOLOR=1

#  Redirect man to browser
#  -----------------------------------------------------------------------------
   export MANPAGER="col -b | open -a /Applications/Firefox.app -f"

#  Set default blocksize for ls, df, du
#  ------------------------------------------------------------
   export BLOCKSIZE=1k

#  Stop tracking history for less command (~/.lesshst)
#  ------------------------------------------------------------
   export LESSHISTFILE=-