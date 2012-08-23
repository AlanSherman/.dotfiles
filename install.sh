#!/bin/zsh

cd files
filedir=`pwd`
for files (.*); do
  if [[ $files == '.ssh' ]]; then
    filename=".ssh/config"
  else
    filename=$files
  fi
  if [[ -f ~/$filename || -d ~/$filename ]]; then
    if [[ ! -d ~/olddotfiles ]]; then
      mkdir ~/olddotfiles
    fi
    mv ~/$filename ~/olddotfiles
  fi
  if [[ -h ~/$filename ]]; then
    rm ~/$filename
  fi
  ln -s $filedir/$filename ~/$filename
done
