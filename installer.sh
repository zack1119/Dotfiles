#!/usr/bin/env bash

#clone's repo
#git clone https://github.com/zack1119/Dotfiles.git

DFiles="aliases bash_profile bash_prompt bashrc functions profile vimrc"
vimPath="$HOME/.vim/colors"

#backup original dotfiles into OriginalDotFiles and creates symlink to the new dotfiles
for file in $DFiles; do
  if [ -e $HOME/.$file ]; then
    if [ -d $HOME/OriginalDotFiles ]; then
      sudo mv -f $HOME/.$file $HOME/OriginalDotFiles/.$file && echo "Relocated $file to OriginalDotFiles."
    else
      sudo mkdir $HOME/OriginalDotFiles
      sudo mv -f $HOME/.$file $HOME/OriginalDotFiles/.$file && echo "Relocated $file to OriginalDotFiles."
    fi
  fi
  ln -sv $HOME/Dotfiles/.$file $HOME
done

if [ -d $vimPath ]; then
  if [ ! -e $vimPath/atlantic-dark.vim ]; then
    ln -sv $HOME/Dotfiles/atlantic-dark.vim $vimPath
  fi
else
  mkdir -p $vimPath
  ln -sv $HOME/Dotfiles/.vim/colors/atlantic-dark.vim $vimPath
fi

#if .localdf already exsits it will not overwrite it.
if [ ! -e $HOME/.localdf ]; then
  cp $HOME/Dotfiles/.localdf $HOME/.localdf
fi

#checks for defualt ssh .config if not there then copys sample from Dotfiles
if [ -e $HOME/.ssh ]; then
  if [ ! -e $HOME/.ssh/.config ]; then
    cp $HOME/Dotfiles/.ssh/.config $HOME/.ssh/.config
  fi
else
  mkdir $HOME/.ssh
  cp $HOME/Dotfiles/.ssh/.config $HOME/.ssh/.config
fi
