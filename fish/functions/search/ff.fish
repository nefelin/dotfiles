#find file
function ff
	if test (count $argv) = 1
		find . -name $argv[1]
	else
		find $argv[1] -name $argv[2]
	end
end
