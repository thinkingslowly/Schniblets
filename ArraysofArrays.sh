## This takes the value of index [1] of array wowzas and uses it to echo to the terminal  a range of the the array wow between index ${wowzas[0] and index 12345.

wow[2]=two
wow[12345]=12345
wowzas=(1 12344)

echo ${wow[@]:${wowzas[0]}:12345}

##OUTPUT: two 12345
## Coincidentally it sometimes can take along time to find out how to do a simple task. 

## There has to be a record where its looking otherwise it will evaluate in such a way as to fail. And from poking at it usually....(although not always) it will default to echoing the whole record. 


