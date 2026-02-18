#  =============================================================================
#  Always
#  =============================================================================

#  Manage dotfiles in GitHub
#  -----------------------------------------------------------------------------
   # Enables $() to be used in ~/.config/zsh/themes/powerline.zsh-theme
   #
   # To initialize a new home dir (after ~/.ssh/github.readme):
   #
   # git init --bare $HOME/.dotfiles
   # git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
   # git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME remote add origin git@github.com:coxd/dotfiles.git
   # git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME fetch origin main
   # git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME reset --hard origin/main
   # git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -b main origin/main
   #
   # fetch/reset is required instead of pull to overwrite any local files. checkout is required so that git will know
   # about the remote branch (otherwise dotfiles pull will fail for example).

   dotfiles() {
       local git=(/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME")
   
       if [[ "$1" == "update-all" ]]; then
           shift  # remove "update-all"
   
           if [[ -z "$1" ]]; then
               echo "Usage: dotfiles update-all \"commit message\""
               return 1
           fi
   
           local msg="$1"

           "${git[@]}" add -u || return 1
           
           if ! "${git[@]}" diff --cached --quiet; then
               "${git[@]}" commit -m "$msg" || return 1
               "${git[@]}" push || return 1
           else
               echo "No changes to commit."
           fi
   
           return 0
       fi
   
       "${git[@]}" "$@"
   }

   # Necessary for git completions to work
   compdef dotfiles=git 
   
#  Replace "raw" which with one that resolves symlinks and gives full ls details
#  -----------------------------------------------------------------------------
   which() {
       local resolved_path
       resolved_path=$(command -v "$1" | xargs realpath 2>/dev/null || command -v "$1")
       ls -l "$resolved_path"
   }

#  JQ Playground
#  -----------------------------------------------------------------------------
   jqplay() { 
       command echo '' | fzf --preview 'jq {q} < '$1''  --preview-window=up,99%
   }

#  =============================================================================
#  macos only
#  =============================================================================

if [[ "$(uname)" == "Darwin" ]]; then

#  Move a file to trash
#  -----------------------------------------------------------------------------
   trash() { 
       command mv "$@" ~/.Trash ; 
   }

fi 

#  =============================================================================
#  linux only
#  =============================================================================

if [[ "$(uname)" == "Linux" ]]; then

# Nothing yet

fi