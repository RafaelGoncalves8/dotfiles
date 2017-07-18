#! /bin/zsh

#Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files=("$dir/zsh/zshrc" "$dir/vim/vimrc" "$dir/vim/vim" "$dir/tmux/conf" "$dir/git/config" "$dir/i3" "$dir/i3status" "$dir/ranger" "$dir/termite")       # list of files/folders to symlink in homedir
target=("$HOME/.zshrc" "$HOME/.vimrc" "$HOME/.vim" "$HOME/.tmux.conf" "$HOME/.gitconfig" "$HOME/.config/" "$HOME/.config/" "$HOME/.config/" "$HOME/.config/")  # target conf locations
##########

# create dotfiles_old in homedir
cd $HOME
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
echo "Moving any existing dotfiles from ~ to $olddir"
mv $HOME/.config $olddir/config
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for ((i=0; i <= ${#files[@]}; i++)); do
    mv ${target[i]} $olddir
    echo "Creating symlink to ${files[i]} in home directory."
    ln -s ${files[i]} ${target[i]}
done

source ~/.zshrc
