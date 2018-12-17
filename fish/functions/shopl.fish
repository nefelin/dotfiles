# Defined in /var/folders/0b/0nzsk96j0qn8112_hksl60qh0000gq/T//fish.U9WDby/shopl.fish @ line 2
function shopl
	if count $argv > /dev/null
		
		# Get our shopping list from server
		wunderline list Shopping > list.shopl
		set -l result (cat list.shopl)
		
		if [ $argv[1] = 'a' ] 
			if [ -z $argv[2] ]
				# Check if list was empty
				echo "RESULT $result"
				if [ -z $result ]
					echo "Shopping list is empty"
				else
					cat list.shopl
				end
				
				set -l added 0 
				# Get new items to add to list
				while true
					read -l -P 'new item: ' item
					switch $item
						case Q q quit exit done ""
							if [ $added -ge 1 ]
								echo "Syncing $added new item(s) with Wunderlist..."
								cat newitems.shopl | wunderline add --stdin --list Shopping
							end
							break
						case '*'
							if cat list.shopl | grep -i $item > /dev/null
								echo "Item already on list: "
								cat list.shopl | grep -i $item
								echo "...skipping..."
							else
								echo $item >> newitems.shopl
								set added (math "$added+1")
							end
					end
				end
			else
				# 'a' flag had args, add a single item to list
				if cat list.shopl | grep -i "$argv[2..-1]" >/dev/null
					# cat -n $SHOPPINGLIST
					cat list.shopl | grep -i "$argv[2..-1]"
					echo "$argv[2..-1] is already on your list"
				else
					# echo $argv[2..-1] >> $SHOPPINGLIST
					wunderline add $argv[2..-1] --list Shopping
					echo "Added $argv[2..-1] to your list" 
				end
			end
		end
		# Clean up!
		rm *.shopl
	else
		#Simply show list if no arguments
		wunderline list Shopping
	end
end
