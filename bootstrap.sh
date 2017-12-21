#! /bin/sh

echo "################"
echo "# bootstrap.sh #"
echo "################"
echo

#Variables
dir=~/dotfiles              # dotfiles directory
olddir=~/.dotfiles_old      # old dotfiles backup directory
conf=~/.config              # config files in OS
timestamp=$(date +%d-%m-%Y_%H-%M) # timestamp for the backup
##########

#Choose which dotfiles you do want to use
index=(
0   #  bash
1   #  zsh
2   #  urxvt
#3   #  termite
4   #  vim
5   #  vim
#6   #  tmux
7   #  git
#8   #  ranger
#9   #  ranger
#10  #  ranger
11  #  i3
12  #  i3status
)

files=(
"bash/bashrc"
"zsh/zshrc"
"urxvt/Xresources"
"termite/config"
"vim/vimrc"
"vim/vim_folder"
"tmux/conf"
"git/config"
"ranger/rc.conf"
"ranger/scope.sh"
"ranger/commands.py"
"i3/config"
"i3status/config"
)

target=(
"$HOME/.bashrc"
"$HOME/.zshrc"
"$HOME/.Xresources"
"$conf/termite/config"
"$HOME/.vimrc"
"$HOME/.vim"
"$HOME/.tmux.conf"
"$HOME/.gitconfig"
"$conf/ranger/rc.conf"
"$conf/ranger/scope.sh"
"$conf/ranger/commands.py"
"$conf/i3/config"
"$conf/i3status/config"
)

# create dotfiles_old in homedir
cd $HOME
echo "Creating $olddir for backup of any existing dotfiles"
mkdir -p $olddir
mkdir -p $olddir/tmp
mkdir -p $olddir/tmp/bash
mkdir -p $olddir/tmp/zsh
mkdir -p $olddir/tmp/termite
mkdir -p $olddir/tmp/vim
mkdir -p $olddir/tmp/tmux
mkdir -p $olddir/tmp/git
mkdir -p $olddir/tmp/ranger
mkdir -p $olddir/tmp/i3
mkdir -p $olddir/tmp/i3status
mkdir -p $olddir/tmp/urxvt
echo "...done"
echo

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
echo

# make backup and link files
echo "Moving existing dotfiles to $olddir:"
echo
for i in ${index[@]}; do

    echo "moving ${target[$i]} to $olddir/tmp/${files[$i]}..."
    mv ${target[$i]} $olddir/tmp/${files[$i]}
    echo "...done"

done

# save backup with timestamp
echo "tar'ing up files of $olddir/tmp into $olddir/$timestamp.tar.gz"
tar czf $olddir/$timestamp.tar.gz $olddir/tmp
rm -rf $olddir/tmp
echo "...done"

rm -rf $HOME/vim # dont let recursive symlinks be done in vim folder

echo "Making links:"
echo
for i in ${index[@]}; do
    echo "linking $dir/${files[$i]} to ${target[$i]}"
    ln -s "$dir/${files[$i]}" ${target[$i]}
    echo "...done"
done
echo
echo "all links done"
