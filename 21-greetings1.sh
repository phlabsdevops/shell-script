#!bin/bash
NAME=""
WISHES="Good Morning"

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo "-n, Specify the name (Mandatory)"
    echo "-w, Specify the wishes (Optional) (Default is: Good Morning)"
    echo "-h, Display the Help and Exit"
    
}
while getopts ":n:w:h" opt; do
      case $opt in 
        n) NAME="$OPTARG" ;;
        w) WISHES="$OPTARG" ;;
        \?) echo "Imvalid Options: "$OPTARG"" >&2; USAGE; exit;;
        :) USAGE; exit;;
        h) USAGE; exit;;
     esac 
done
#if [ -z "$NAME" ] || [ -z "$WISHES" ]; then
if [ -z "$NAME" ]; then # wishes is optional
#echo "ERROR: Both -n and -w are mandatory options"
echo "ERROR: -n is mandatory option"
USAGE
exit 1
fi

echo "Hello $NAME. $WISHES, I have been learning shell scripting"