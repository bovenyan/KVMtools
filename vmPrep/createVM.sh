# usage:
# ./run.sh $src $

IMG_DIR=/var/lib/libvirt/images
IMG_NAME=$1

sudo ubuntu-vm-builder kvm trusty \
                  --domain $1 \
                  --destdir $IMG_DIR/$IMG_NAME \
                  --arch amd64 \
                  --hostname vmf1 \
                  --cpus 2 \
                  --mem 1024 \
                  --user bovenyan \
                  --pass By900209 \
                  --components main,universe \
                  --addpkg acpid \
                  --addpkg linux-image-generic \
                  --addpkg vim \
                  --addpkg openssh-server \
                  --addpkg avahi-daemon \
                  --libvirt qemu:///system ;
