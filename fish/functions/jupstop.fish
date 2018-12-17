# Defined in /var/folders/0b/0nzsk96j0qn8112_hksl60qh0000gq/T//fish.50dzBh/jupstop.fish @ line 1
function jupstop
	if tmux ls | grep jupyter
		tmux kill-session -t jupyter
	else
		echo "jupyter is not running"
	end
end
