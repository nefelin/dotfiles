# Defined in /var/folders/0b/0nzsk96j0qn8112_hksl60qh0000gq/T//fish.3p3543/tmk.fish @ line 1
function tmk
	if count $argv > /dev/null
		tmux kill-session -t $argv[1]
	else
		echo "Need name of session to kill"
	end
end
