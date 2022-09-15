# this unexpectadly errors , however despite that does what is intended of it, which  is, when run, add a var to an array and rewrites 
datearray=(hmm 2022-09-15T19:40:43+01:00 ) ;
startblock () 
{ 
    echo '#' 'this unexpectadly errors , however despite that does what is intended of it, which  is, when run, add a var to an array and rewrites ';
    datearray+=($( date -I'seconds' ));
    echo 'datearray=''('"${datearray[@]}" ') ;';
    declare -f startblock;
    echo 'startblock > Diary1.sh'
}
startblock > Diary1.sh
