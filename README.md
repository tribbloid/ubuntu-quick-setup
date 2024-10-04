# ubuntu-quick-setup

### btrfs File System

Remember to set the mounting option to enable:

- noatime

In `/etc/fstab`, e.g.

```
$ sudo cat /etc/fstab
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system>  <mount point>  <type>  <options>  <dump>  <pass>
UUID=e75d569a-400c-4076-8b9f-903a7a1f4f03  /home  btrfs  noatime  0  0
PARTUUID=2a5d336d-d995-415a-b1d5-bf84cd5eb4f5  /boot/efi  vfat  umask=0077  0  0
UUID=2dcbf08f-5dc8-4449-a4a7-145077dea94d  /  ext4  noatime,errors=remount-ro  0  0
/dev/mapper/cryptswap  none  swap  defaults  0  0
```
