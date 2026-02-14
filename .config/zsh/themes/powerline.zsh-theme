#  Set powerline-go based prompt
#  -----------------------------------------------------------------------------
    zmodload zsh/datetime

    function preexec() {
        __TIMER=$EPOCHREALTIME
    }

    function powerline_precmd() {

        # Have to figure out the duration ourselves
        local __ERRCODE=$?
        local __DURATION=0

        if [ -n $__TIMER ]; then
            local __ERT=$EPOCHREALTIME
            __DURATION="$(($__ERT - ${__TIMER:-__ERT}))"
        fi

        # Only show node segment when there is a package.json in the current directory or above
        NODE=""
        DIR="$PWD"

        while :; do
            if [[ -f "$DIR/package.json" ]]; then
                NODE="node,"
                break
            fi
            [[ "$DIR" == "/" ]] && break
            DIR="${DIR%/*}"
            [[ -z "$DIR" ]] && DIR="/"
        done

        DOTFILES_CHANGED=""
        
        # Show a segment if:
        #   1. We are in ~
        #   2. There are staged changes to dotfiles
        #.  3. There are unstaged changes to dotfiles
        #   4. There are unpushed commits to dotfiles
        if [[ "$PWD" == "$HOME" ]] && \
           (! dotfiles diff --quiet --ignore-submodules --cached || \
            ! dotfiles diff --quiet --ignore-submodules || \
            [[ $(dotfiles rev-list --count @{u}..HEAD 2>/dev/null) -gt 0 ]]); then
            DOTFILES_CHANGED=$'%{\e[48;5;22m\e[38;5;124m%}%{\e[48;5;124m\e[38;5;254m%}   %{\e[0m%}'
        fi

        # Most of the config is in ~/.config/powerline-go/config.json
        eval "$(powerline-go \
            -modules-right venv,${NODE}docker-context,duration,load \
            -error $__ERRCODE \
            -duration $__DURATION)"

        RPROMPT+="$DOTFILES_CHANGED"

        # This is required to get 2 line prompt to have the right segments show on the 1st line
        PROMPT=$'%{\e[38;5;248;48;5;241m%}╷%{\e[0m%}'"${PROMPT}"
        RPROMPT=$'%{\e[1A%}'${RPROMPT}$'%{\e[1B%}'
        PROMPT+=$'\n%{\e[38;5;248m%}└%{\e[0m%}'
    }

   function install_powerline_precmd() {
       for s in "${precmd_functions[@]}"; do
           if [ "$s" = "powerline_precmd" ]; then
               return
           fi
       done
       precmd_functions+=(powerline_precmd)
   }

   if [ "$TERM" != "linux" ]; then
       install_powerline_precmd
   fi

#  Other prompt options
#  -----------------------------------------------------------------------------

   # export PS1="[\w]\n>";
   # export PS1=">"
   # export PS1="[\w] \h:\u\n>";
