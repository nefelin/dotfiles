# Defined in /var/folders/0b/0nzsk96j0qn8112_hksl60qh0000gq/T//fish.OzOSw7/ran.fish @ line 1
function ran
	ranger --choosedir=$HOME/.rangerdir;; and set LASTDIR (cat $HOME/.rangerdir);; and cd $LASTDIR
end
