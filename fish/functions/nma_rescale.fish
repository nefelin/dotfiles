# Defined in /var/folders/0b/0nzsk96j0qn8112_hksl60qh0000gq/T//fish.BC40hH/nma_rescale.fish @ line 2
function nma_rescale
	for dir in (ls -d */)
		cd $dir
		mkdir HD
		for file in (ls -p *mp4| grep -v '/$')
			ffmpeg -i $file -vf scale=1280:720 "./HD/$file"
		end
		cd ..
	end
end
