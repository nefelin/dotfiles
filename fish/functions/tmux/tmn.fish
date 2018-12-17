#new tmux screen
function tmn
	if count $argv > /dev/null 
		tmux new -s $argv[1]
	else
		tmux new
	end
end
