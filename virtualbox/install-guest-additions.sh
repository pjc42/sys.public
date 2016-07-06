script_filename="${BASH_SOURCE[0]}"
version="01.00"

# it is difficult to get this script into the vm without guest additions
# already being installed. one way is to use wget from github
# 
#   wget https://raw.githubusercontent.com/pjc42/system-virtualbox/master/install-guest-additions.sh
#
# or bitbucket, get the url from `raw` url in source view
#
#  wget https://bitbucket.org/pjcrosbie/sys.public/raw/f7be6c2cc32e48679ed486605cd8592d49db9ad5/virtualbox/install-guest-additions.sh
# 
# and then run the file
#   $ bash ./install-guest-additions.sh
#

echo "$sep2"
echo "START:"
echo "  Running: $script_filename"
echo "$sep2"

echo "installing guest-additions for ubuntu based system"
echo
echo "  (1) check the following prerequisites:"
echo "      install prerequisites"
echo "       - build-essential"
echo "       - module-assistant"
echo "       - dkms"
echo
echo "sudo apt-get update"
sudo apt-get update
echo "sudo apt-get install build-essential"
sudo apt-get install build-essential
echo "sudo apt-get install module-assistant"
sudo apt-get install module-assistant
echo "sudo apt-get install dkms"
sudo apt-get install dkms
echo
echo "  (2) prepare system for compiling from source"
echo "      this prepares the system to install kernel modules from source"
echo "      the following commands download the kernel C header files for the distro"
echo "      and updates module-assistant list of modules"
echo
echo "sudo m-a prepare"
sudo m-a prepare
echo "sudo m-a update"
sudo m-a update
echo
echo

echo "  (3) install the guest-additions in the prepared system"
echo "      (a) add guest-additions cdrom via VirtualBox gui"
echo
echo "            Devices -> Insert guest additions CD image"
echo
echo "         this will usually mount the cdrom also, if it doesn't see below"
echo "         this will also often run the installer automatically"
echo "         if the system asks for root password then it is running and"
echo " "
echo
echo "      **********************************************************************"
echo "      if this installed the guest-additions then you are done... skip to (4)"
echo "      steps (b) and (c) are only necessary if the cdrom did not mount and/or"
echo "      the VBoxLinuxAdditions.run installer did not run automatically"
echo "      **********************************************************************"
echo
read -p "Press [Enter] key to continue script after you have inserted guest-additions..."
echo
echo "      (b) if the CDROM does not mount then follow these instructions"
# this will show guest-additions if installed
echo "$ sudo blkid # to show dev for cdrom, something like sr0"
sudo blkid
echo
echo
echo "          noting the name from blkid output above, e.g.: /dev/sr0"
echo "          run something like this, subtituting the appropriate blkid output"
echo "            $ cd ~ ; mkdir cdrom"
echo "            $ sudo mount /dev/sr0 ~/cdrom"
echo 
echo "      (c) if the installer did not run automatically then cd into"
echo "          the mounted folder ~/cdrom for the guest-additions and run"
echo "          the installer:"
echo "             $ cd ~/cdrom"
echo "             $ sudo sh ./VBoxLinuxAdditions.run"
echo
echo
echo "If you need to do either 3(b) or 3(c) then launch another terminal and do the work"
echo "there so you can see the instructions in this window and then complete the installation"
echo "checks when you have the guest-additions installed." 
read -p "Press [Enter] key to continue script after you have installed guest-additions..."
echo
echo "  (3) finally check the installation"
echo "      (a) check that vboxguest is one of the loaded modules"
echo "          the following command should return: vboxguest"
echo "          if it is blank or null then there is an error, check output above"
echo "          for error messages from the installations, including prerequisites"
echo "lsmod | grep -io vboxguest"
lsmod | grep -io vboxguest
echo
echo "      (b) check the vboxguest module details"
echo "          the following command should return several lines of detail similar to this: "
echo
echo "            filename:       /lib/modules/4.2.0-38-generic/updates/dkms/vboxguest.ko"
echo "            version:        5.0.22 r108108"
echo "            license:        GPL"
echo "            description:    Oracle VM VirtualBox Guest Additions for Linux Module"
echo "            author:         Oracle Corporation"
echo "            srcversion:     D1611BEE78091C7935FB685"
echo "            alias:          pci:v000080EEd0000CAFEsv00000000sd00000000bc*sc*i*"
echo "            depends:        "
echo "            vermagic:       4.2.0-38-generic SMP mod_unload modversions"
echo
echo "modinfo vboxguest"
modinfo vboxguest