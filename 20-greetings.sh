#!bin/bash
NAME=""
WISHES=""

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo "-n, Specify the name (Mandatory)"
    echo "-w, Specify the wishes (example: Good Morning)"
    echo "-h, Display the Help and Exit"
    
}
while getopts ":n:w:h" opt; do
      case $opt in 
        n) NAME="$OPTARG" ;;
        w) WISHES="$OPTARG" ;;
        h|*) USAGE; exit;;
     esac 
done