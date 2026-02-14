#  Manage dotfiles in GitHub
#  -----------------------------------------------------------------------------
   # This enables this to be used in $() in
   # ~/.config/zsh/themes/powerline.zsh-theme
   #
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

           "${git[@]}" add -u || return 1
           "${git[@]}" commit -m "$msg" || return 1
           "${git[@]}" push || return 1
   
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

# JQ Playground
jqplay() { 
    command echo '' | fzf --preview 'jq {q} < '$1''  --preview-window=up,99%
}

# Move a file to trash
trash() { 
    command mv "$@" ~/.Trash ; 
}