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