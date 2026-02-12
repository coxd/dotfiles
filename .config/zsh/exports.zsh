#  Use ~/.zshenv for anything that is needed outside of an interactive shell, only interactive exports here.

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