#  Set powerline-go based prompt
#  -----------------------------------------------------------------------------
    zmodload zsh/datetime

    function preexec() {
        __TIMER=$EPOCHREALTIME
    }

    function powerline_precmd() {
        local __ERRCODE=$?
        local __DURATION=0

        if [ -n $__TIMER ]; then
            local __ERT=$EPOCHREALTIME
            __DURATION="$(($__ERT - ${__TIMER:-__ERT}))"
        fi

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

         eval "$(powerline-go \
            -modules-right venv,${NODE}docker-context,duration,load \
            -error $__ERRCODE \
            -duration $__DURATION)"
    
        # Re-wrap RPROMPT to move it up
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
