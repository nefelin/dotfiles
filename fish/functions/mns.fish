#creates a new sublime snippit
function mns
	if count $argv > /dev/null 
		cp /Users/nefelin/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets/template.sublime-snippet /Users/nefelin/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets/$argv[1].sublime-snippet 

		subl /Users/nefelin/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Snippets/$argv[1].sublime-snippet
	else
		echo "Need a snippet name as argument"		   
	end
end
