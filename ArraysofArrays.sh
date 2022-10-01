## This takes the value of index [1] of array wowzas and uses it to echo to the terminal  a range of the the array wow between index ${wowzas[1] and value 12345.

wow[12345]=12345
wowzas=(1 12344)

echo ${wow[@]:${wowzas[1]}:12345}

## Coincidentally it sometimes can take along time to find out how to do a simple task. 
