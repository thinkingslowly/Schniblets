## This adds an time record to an existing array ; takes a user input converts it to hex adding the converted input to another array and rewrites the Script-file. 

datearray=(hmm 2022-12-09T00:00:37+00:00 2022-12-09T00:01:13+00:00 2022-12-09T00:11:36+00:00 ) ;
feelingsarray=("my left foot is cold" "I am surviving" "still got a cold left foot"  ) ;
echo "hello how are you" ;
startblock () 
{ 
    echo '##' ' This adds an time record to an existing array ; takes a user input converts it to hex adding the converted input to another array and rewrites the Script-file.';
    datearray+=($( date -I'seconds' ));
    echo 'datearray=''('"${datearray[@]}" ') ;';
    feelingsarray+=("$( read  "feelings" ; echo "${feelings[@]}" | xxd -p )");
    echo -n 'feelingsarray=''(';
    for i in "${feelingsarray[@]}";
    do
        printf \""$i"\"' ';
    done;
    echo ' ) ;';
    printf "echo \"hello how are you\" ;\n";
    declare -f startblock;
    echo 'startblock > Diary2.sh'
}
startblock > Diary2.sh
