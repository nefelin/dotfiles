# Defined in /var/folders/0b/0nzsk96j0qn8112_hksl60qh0000gq/T//fish.YDIqZX/range.fish @ line 2
function range
	ranger --choosedir=$HOME/.rangerdir;; and cd (cat $HOME/.rangerdir)
end
