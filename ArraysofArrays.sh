## This takes the value of index [1] of array wowzas and uses it to echo to the terminal  a range of the the array wow between index ${wowzas[1] and value 12345.

wow[12345]=12345
wowzas=(1 12344)

echo ${wow[@]:${wowzas[1]}:12345}

## Coincidentally it sometimes can take along time to find out how to do a simple task. 



somenumbers=( 1 2 3 4 5) ;

wow[1]=1 ;

wowzas=($(echo "${#somenumbers[@]}")) ;

echo ${somenumbers[@]:${wow[1]}:${wowzas[0]}}
## this strips the array of the first element 
##output 2 3 4 5
