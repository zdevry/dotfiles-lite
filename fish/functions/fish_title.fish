function title_basename
    if [ $PWD = $HOME ]
        echo '~'
    else
        path basename $PWD
    end
end

function fish_title
    if set -q argv[1]
        set -l currprog (string split ' ' -f1 -- $argv[1])
        printf '%s@%s' $currprog (title_basename)
    else
        title_basename
    end
end
