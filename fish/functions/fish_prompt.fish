
function prompt_errcode
    set -l errcode $argv[1]
    [ $errcode = 0 ] && return

    set_color brred
    printf '∴ %s ' $errcode
    set_color normal
end

function prompt_git
    set __fish_git_prompt_char_stateseparator ''
    set __fish_git_prompt_show_dirty_state 1
    
    set -l prompt (fish_git_prompt) || return 0
    set_color e26b16
    printf '%s ' (string replace ' (' '󰘬 ' -- $prompt | string replace ')' '')
    set_color normal
end

function fish_prompt
    prompt_errcode $status
    
    set -l cwd (prompt_pwd --dir-length 0)
    set_color green
    printf '󰉋 %s ' $cwd
    
    prompt_git

    set_color blue
    if [ (string length $cwd) -gt 50 ]
        printf '\n '
    end
    echo -n '→ '
    set_color normal
end
