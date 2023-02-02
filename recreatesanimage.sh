#! /bin/sh.

##This script creates a one to one copy of an image; by extracting the images colours and their associated pixel coordinates and from this creating (and evalling) imagemagick convert command. 
 ##I don't know what would happen with a rgba encoded image. 
 ##Its slow and inneficient.  So try it on a small image.  

 echo  '#' 'enter a imagefile type carefully' ;
 read "image" ;
  echo  '#' 'enter a newname for the imagefile type carefully' ;
 read "imagenamenew" ;
 imagedimension=$( identify -ping -format '%w %h' "$image" | sed 's| |x|g' ) ;
 ## gets the dimensions of the image to manipulate. 
 colours=($(  convert "$image"  txt:-  | awk  '  {print $2 } ' | tail -n +2  | sort -u )) ;
## gets the colours present in the image in rgb format. 
 command=$(
for i in "${colours[@]}"  ;  do somevar+=$( convert "$image"  txt:-  > apipe | cat apipe | awk -v awcolours=$i  ' ($2==awcolours) { printf $1}'  ) ; for i in "${somevar[@]}" ; do  echo -n  " -fill 'rgb ${colours[$f]} ' "; x+=($( echo "${somevar[@]}"  | sed  's|:| |g')) ; for i in "${x[@]}" ; do echo -n " -draw 'point $i '" ; done ;  done ; x=() ; somevar=() ; f=$(($f+1))  ; done )
##  for each colour in colour this selects all coordinates of that colour (as a single blob) splits that blob into individual coordinates then for each colour creates a blob of  "  -fill colour -draw point one -draw point two .. etc  "  
##too do make it so each colour pixel coordinate can be more easily manipulated individually. 
  
  hmm2=$(echo "convert -size ${imagedimension[@]} xc:skyblue ${command[@]}  -scale ${imagedimension[@]} ${imagenamenew[@]} " ) ; eval "${hmm2[@]}" 
  ## inserts the blob of  "  -fill colour -draw point one -draw point two  - -fill colour -draw point three -draw point four ...etc into the rest of the convert command ; including the dimmensions and new name.   
