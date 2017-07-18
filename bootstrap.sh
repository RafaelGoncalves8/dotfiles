#! /bin/zsh

echo "################"
echo "# bootstrap.sh #"
echo "################"
echo

#Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
conf=~/.config                      # config files in OS
##########

files=(
"zsh/zshrc"
"termite/config"
"vim/vimrc"
"vim/vim"
"tmux/conf"
"git/config"
"ranger/rc.conf"
"ranger/scope.sh"
"ranger/commands.py"
"i3/config"
"i3status/config"
)

target=(
"$HOME/.zshrc"
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
mkdir -p $olddir/zsh
mkdir -p $olddir/termite
mkdir -p $olddir/vim
mkdir -p $olddir/tmux
mkdir -p $olddir/ranger
mkdir -p $olddir/i3
mkdir -p $olddir/i3status
echo "...done"
echo

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
echo

# make backup and link files
echo "Moving existing dotfiles to $olddir and making links:"
echo
for ((i=1; i <= ${#files[@]}; i++));do

    echo "moving ${target[i]} to $olddir/${files[i]}..."
    echo "linking $dir/${files[i]} to ${target[i]}"
    echo "...done"

done
echo
echo "all links done"

source ~/.zshrc
