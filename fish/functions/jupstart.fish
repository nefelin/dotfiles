# Defined in /var/folders/0b/0nzsk96j0qn8112_hksl60qh0000gq/T//fish.8CzPzF/jupstart.fish @ line 2
function jupstart
	if tmux ls | grep jupyter 
		echo "jupyter notebook already running"
	else
		echo "starting jupyter"
		tmux new -d -t jupyter
		tmux send-keys -t jupyter 'cd ~/Documents/Jupyter' C-m 'jupyter notebook' C-m
	end
end
