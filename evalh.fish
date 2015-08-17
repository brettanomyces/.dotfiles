function evalh
	echo "- cmd:" $argv >> ~/.config/fish/fish_history
	echo "  when:" (date "+%s") >> ~/.config/fish/fish_history
	history --merge
	eval $argv
end
