sgdisk -o /dev/sda
sgdisk -n 1:0:+500M -t 1:ef00 -c 1:"EFI"   /dev/sda
sgdisk -n 2:0:0     -t 2:8300 -c 2:"CRYPT" /dev/sda

mkfs.vfat -F 32 -n BOOT /dev/sda1
mkfs.btrfs -L ROOT /dev/sda2

mount /dev/sda2 /mnt
btrfs su cr /mnt/@root
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
btrfs su cr /mnt/@opt
btrfs su cr /mnt/@swap
btrfs su cr /mnt/@.snapshots
umount /mnt

mount -o subvol=@root,ssd,compress=zstd,noatime /dev/sda2 /mnt
mkdir /mnt/{boot,home,var,opt,swap,.snapshots}

mount -o ssd,compress=zstd:1,noatime,subvol=@home /dev/sda2 /mnt/home
mount -o ssd,compress=zstd:1,noatime,subvol=@opt /dev/sda2 /mnt/opt
mount -o ssd,compress=zstd:1,noatime,subvol=@.snapshots /dev/sda2 /mnt/.snapshots

mount -o ssd,nodatacow,subvol=@swap /dev/sda2 /mnt/swap
mount -o ssd,nodatacow,subvol=@var /dev/sda2 /mnt/var

mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux efibootmgr sudo vim networkmanager btrfs-progs

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
