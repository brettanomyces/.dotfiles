function evalh
    eval $argv

    # backup history file
    cp ~/.config/fish/fish_history /tmp/fish_history.tmp

    # clear internal history and history file (using builtin means we don't get a prompt)
    builtin history --clear

    # restore history file
    cp /tmp/fish_history.tmp ~/.config/fish/fish_history

    # append our command 
    echo "- cmd:" $argv >> ~/.config/fish/fish_history
    echo "  when:" (date "+%s") >> ~/.config/fish/fish_history

    # merge history file with (empty) internal history
    history --merge
end
