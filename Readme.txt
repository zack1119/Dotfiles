To install these bash files on ubuntu run these commands:

git clone https://Github.com/zack1119/Dotfiles.git
cd ~/Dotfiles
bash installer.sh

This installer setup symlinks for all the .files in the Dotfiles folder, that it just cloned from the Github repository.

I did not write all of these files I cloned a repository a few years ago that I have modified heavily for my own use.
I never planned on putting them on Github. If anyone recognizes the code please let me know so I can link to the original repository.
These dotfiles include the atlantic-dark theme for vim and .vimrc configuration file to enable some useful features. I did not write
the shell prompt but I know that shell prompt is based on the Solarized Dark theme that is Heavily inspired by @necolas’s
prompt: https://Github.com/necolas/dotfiles.

I put all my credentials and computer specific aliases in .localdf file. When running the installer if this file does not exsist
in the home folder then, it will copy the example .localdf file from the Dotfiles folder to your home folder. So don't forget to
configure your .localdf file because it will not be overwritten when updating the Dotfiles with the update_dfiles function.
