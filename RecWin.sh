#! /bin/sh
##this script allows for the recording of a video from a specified window
##note the inputs are not as of yet protected  so no spaces or dangerous characters ; the file format for the output has to be speciefied as .mp4  ; 

killprocess () { exit ; } ;

aprog () { data=($( zenity --forms --title=RecWin  --text="Add a number of frame and output filename" --add-entry=”number-of-frames” --add-entry=”outputfilename”   ;
if [[ $? == 1 ]] ; then killprocess ; else zenity --info --title=RecWin --text="Click ok if you wish to proceed ; then click on a window you wish to record" ; if [[ $? == 1 ]] ; then killprocess ; else  hmm=$( xwininfo | awk ' (NR==6) {print $0} ' )  ; 
zenity --info --title=RecWin  --text="click ok if this is the window you want to capture:\n $hmm "  ; if [[ $? == 1 ]] ; then killprocess ; else echo "$hmm" | awk '  {print $4 } ' ; zenity --forms --title=RecWin --text="Recording will commence when you enter a countdown and click ok"  --add-entry=”countdown”  ; if [[ $? == 1 ]] ; then killprocess ; else echo "wazzup" ; fi ; fi ; fi ; fi ))  ; } ;


aprog ;  if [[ "${data[3]}" == wazzup ]] ; then 
outputfilename=${data#*|};
framerange=${data%|*} ;
windowid=$( echo "${data[1]}" ) ;
delay=$( echo "${data[2]}" ) ;

while [ "$delay" -gt 0 ] ; do echo "$delay" | espeak ; delay=$(($delay-1)) ;  done ; echo "recording comencing" | espeak ;


x=($framerange) ; while [ "$x" -gt 0 ] ; do import -silent -window "$windowid" png:-  >apipe | cat apipe ; x=$(($x-1)) ; done | ffmpeg -framerate 14 -f image2pipe -i - -c:v libx264 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" -r 30 -pix_fmt yuv420p "$outputfilename"   ; else killprocess ; fi

## framframe rates still abitt much

## to do add a messege for recording finnished.  
