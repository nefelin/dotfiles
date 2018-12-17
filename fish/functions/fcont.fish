#find files containing arg
function fcont
	grep -rn . -e $argv[1]
end
