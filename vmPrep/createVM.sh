# usage:
# ./run.sh $src $

IMG_DIR=/var/lib/libvirt/images
IMG_NAME=$1

sudo mkdir $IMG_DIR/$IMG_NAME
sudo chown bovenyan:bovenyan $IMG_DIR/$IMG_NAME
virt-install -n $1 -r 2048 --disk path=$IMG_DIR/$IMG_NAME/$1,bus=virtio,size=50,format=qcow2 \
    -c $2 --connect=qemu:///system --hvm --video=vmvga --os-type=linux
