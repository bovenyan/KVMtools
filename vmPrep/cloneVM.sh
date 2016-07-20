# usage:
# ./run.sh $src $

function print_help {
    echo "Usage ./cloneVM.sh [Options]"
    echo "  -h, --help      print this help msg"
    echo "  -o, --origin    specify the orgin template"
    echo "  -n, --name      specify the name of the cloned machine"
    exit
}

if [[ $# == 1 ]]; then
    if [ $1 == "-h" ] || [ $1 == "--help" ]; then
        print_help
        exit
    fi  

    echo "Unknown Option: "$1
    print_help
    exit
fi

while [[ $# -gt 1 ]]
do
    key="$1"

    case $key in
        -h|--help)
            print_help
            exit
            ;;
    
        -o|--origin)
            ORIGIN=$2
            shift
            shift
            ;;
        -n|--name)
            NAME=$2
            shift
            shift
            ;;
        *)
            echo "Unkown Option:"$key
            print_help
    esac
done

if [[ -z $ORIGIN ]]; then
    echo "Enter the name of the template"
    read ORIGIN
fi

if [[ -z $NAME ]]; then
    echo "Enter the name of the cloned machine"
    read NAME
fi 


IMG_DIR=/var/lib/libvirt/images

sudo mkdir -p $IMG_DIR/$NAME
sudo chown $USER:$USER $IMG_DIR/$NAME
virt-clone --connect=qemu:///system -o $ORIGIN -n $NAME -f /var/lib/libvirt/images/$NAME/$NAME".gcow2"

echo "Custom the VM? (Y/n)"
read choice
if [ $choice == "n" ] || [ $choice == "N" ]; then
    exit
else
    virsh edit $NAME
fi
