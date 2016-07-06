# sys public #

## overview ##

this repo is maintained to support wget and curl of setup files for bare systems prior to install of git

we maintain two remotes (both are public):

1. [orgin: bitbucket](https://bitbucket.org/pjcrosbie/sys.public)

	bitbucket is maintained as origin to keep consistent with other repos
 
2. [github](https://github.com/pjc42/sys.public)


	github has better wget url for files and so is preferred for use in practice

## usage ##

### github ###

this is the preferred method

you simply open the file and grab url from browser. for example, install-guest-additions.sh

	wget https://github.com/pjc42/sys.public/blob/master/virtualbox/install-guest-additions.sh


### bitbucket ###

bitbucket is ugly because url includes commit signature. for example, isntall-guest-additions.sh requires the following (you get the actual url for the file by opening it in bitbucket and clicking on the RAW button)

	wget https://bitbucket.org/pjcrosbie/sys.public/raw/79f518896f368b3ca6d9abe39f45b81414a4603d/virtualbox/install-guest-additions.sh

## windows notes ##

recall powershell has its wget so switch to msys2 to use usual nix wget