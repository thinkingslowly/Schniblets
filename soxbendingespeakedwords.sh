## This apllies a bend to the esepaked output of each individual word in an one element array and plays them as a combined modified unit to the standard audio device. 

bendsize=(-100) ;
splitwords=$(echo "a block of text to test this thing" | sed "s| |\n|g" ) ;
##this input array is not protected from special characters. 

 for i in ${splitwords[@]} ; do
 
  x=$( echo "$i" | espeak  --stdout  | sox -  -t wav -n stat 2>&1 | sed -n 's#^Length (seconds):[^0-9]*\([0-9.]*\)$#\1#p' ) ;
    ## gets the length of each word
    
y=$(echo $x/0.2 | bc -l  | awk '{print int($1+0.5)}' ) ;
##calculates the number of bends 
m=$(echo "$y * 0.2" | bc ) ;
k=$(echo "$m - $x" | bc | sed 's|-||g') ;
##this calculates a pad value from the difference between the total length of the number of bends and the temporallength of each word
bendduration=$(echo $x/$y | bc -l) ;


z=($( bendflow=(0) ; while [[ "$y" -gt 0 ]] ; do bendsize=$(echo 0 - "$bendsize" | bc) ; echo -n "$bendflow,"; echo -n "$bendsize," ; echo "$bendduration" ; y=("$y"-1) ; done  )) ;
##builds bend pattern  

precommand+=$( echo -n "'|" ; echo " echo "$i" | espeak  --stdout | sox -t wav -  -t wav - pad 0 "$k" | sox -t wav -  -t wav - gain -9 bend ${z[@]} " ; echo -n "' " ) ; done ; 
## builds a collection of program sub-units to be later fed to a sox command 
##something here garbles a wav header maybe the lazy chaining of the pad command 


command=$( echo -n "sox  " ; echo "$precommand " ; echo -n "  -t wav - | sox -t wav -  -t wav - silence 1 0.1 1% -2 0.1 1% | play - " )
## combines sub-unit programs applies a silience filter the pipes to play reading from stdinn  
## this bit needs converting from a play to a sox command if a commands output is to be stored or further modified. 

eval $command

##too do change array names and make the silence more responsive to rhythmic context therby reducing the choppiness of the audio flow. 
