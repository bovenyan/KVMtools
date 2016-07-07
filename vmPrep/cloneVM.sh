# usage:
# ./run.sh $src $

IMG_DIR=/var/lib/libvirt/images
IMG_NAME=$2

sudo mkdir $IMG_DIR/$IMG_NAME
sudo chown bovenyan:bovenyan $IMG_DIR/$IMG_NAME
virt-clone --connect=qemu:///system -o $1 -n $IMG_NAME -f /var/lib/libvirt/images/$IMG_NAME/$IMG_NAME".gcow2"
