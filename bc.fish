# To automatically set the scale run the following:
# echo "scale=3;" > ~/.bc

function bc
	command bc -q $argv;
end
