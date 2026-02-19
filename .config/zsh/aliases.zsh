#  =============================================================================
#  Always
#  =============================================================================

#  CD
#  -----------------------------------------------------------------------------
   alias cd..="cd ../"
   alias ..="cd ../"
   alias ...="cd ../../"

#  Print each PATH entry on a separate line
#  -----------------------------------------------------------------------------
   alias path='echo -e ${PATH//:/\\n}'

#  Clear scrollback buffer (command+K equivalent)
#  -----------------------------------------------------------------------------
   alias cls="tput reset && tput ed"

#  Make sudo honor aliases
#  -----------------------------------------------------------------------------
   alias sudo='sudo '

#  URL Encode a string
#  -----------------------------------------------------------------------------
   alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]));"'

#  TLS
#  -----------------------------------------------------------------------------
   alias tls-nmap='nmap --script ssl-enum-ciphers -p 443 ''$1'''
   alias tls-nmap-with-port='nmap --script ssl-enum-ciphers -p ''$2'' ''$1'''
   alias tls-openssl='openssl s_client -prexit -showcerts -state -status -tlsextdebug -verify 10 -connect ''$1:443'''
   alias tls-enum='~/bin/ssl-cipher-suite-enum.pl ''$1'''
   alias tls-sslyze='python3 -m sslyze --regular ''$1'''

#  Networking
#  -----------------------------------------------------------------------------
   alias ip="dig +short myip.opendns.com @resolver1.opendns.com -4" # Public facing IP Address
   alias localip="ipconfig getifaddr en0"                           # Local network IP
   alias netCons='lsof -i'                                          # All open TCP/IP sockets
   alias flushDNS='dscacheutil -flushcache'                         # Flush out the DNS Cache
   alias lsock='sudo /usr/sbin/lsof -i -P'                          # Display open sockets
   alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'                # Display only open UDP sockets
   alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'                # Display only open TCP sockets
   alias ipInfo0='ipconfig getpacket en0'                           # Get info on connections for en0
   alias ipInfo1='ipconfig getpacket en1'                           # Get info on connections for en1
   alias openPorts='sudo lsof -i | grep LISTEN'                     # All listening connections
   alias showBlocked='sudo ipfw list'                               # All ipfw rules inc/ blocked IPs

#  =============================================================================
#  macos only
#  =============================================================================

if [[ "$(uname)" == "Darwin" ]]; then

#  ls defaults w/ formatting/coloring
#  -----------------------------------------------------------------------------
   eval "$(gdircolors -b ~/.config/zsh/dircolors)"
   alias ls='gls -lFha --color --time-style="+%Y-%m-%d %H:%M:%S"'

#  Show/hide hidden files in Finder
#  -----------------------------------------------------------------------------
   alias showHidden="defaults write com.apple.finder AppleShowAllFiles YES; defaults write -g AppleShowAllFiles -bool true; killall Finder /System/Library/CoreServices/Finder.app"
   alias hideHidden="defaults write com.apple.finder AppleShowAllFiles NO; defaults write -g AppleShowAllFiles -bool false; killall Finder /System/Library/CoreServices/Finder.app"

#  Turn on normal key repeat vs extended characters
#  -----------------------------------------------------------------------------
   alias keyRepeatOn="defaults write -g ApplePressAndHoldEnabled -bool false"
   alias keyRepeatOff="defaults write -g ApplePressAndHoldEnabled -bool true"

#  Clean up LaunchServices to remove duplicates in the "Open With" menu
#  -----------------------------------------------------------------------------
   alias cleanOpenWith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#  List non-apple daemon/agent processes
#  -----------------------------------------------------------------------------
   alias startups="sudo launchctl list | awk 'NR>1 {print \$3}' | grep -Ev '^(com\.apple|com\.vix|org\.cups.)' | sort"

#  Yubikey + ssh
#  -----------------------------------------------------------------------------
#  alias yubikey-ssh="ssh-add -s /usr/local/lib/libykcs11.dylib"   

fi

#  =============================================================================
#  linux only
#  =============================================================================

if [[ "$(uname)" == "Linux" ]]; then

#  ls defaults w/ formatting/coloring
#  -----------------------------------------------------------------------------
   eval "$(dircolors -b ~/.config/zsh/dircolors)"
   alias ls='ls -lFha --color --time-style="+%Y-%m-%d %H:%M:%S"'

fi