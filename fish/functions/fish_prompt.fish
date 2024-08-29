set -x __fish_git_prompt_char_stateseparator ''
set -x __fish_git_prompt_showdirtystate 1

function fish_prompt
    set -l err_code $status
    set -f base (set_color blue)
    if [ $err_code != 0 ]
        set -f base (set_color yellow)
    end

    set -l curr_time (date '+%H:%M:%S')
    set -l curr_dir (prompt_pwd --dir-length 0)
    
    echo -en "$base╭─[$curr_time]─[$(set_color green)$curr_dir$base]"

    if set -l git_prompt (fish_git_prompt)
        echo -en "─["
        set_color magenta
        printf '%s' (string replace ' (' '' -- $git_prompt | string replace ')' '')
        echo -n "$base]"
    end
    echo

    if [ $err_code = 0 ]
        echo -e "$base╰─> "
    else
        echo -e "$base╰─[$(set_color red)$err_code$base]─> "
    end
end
