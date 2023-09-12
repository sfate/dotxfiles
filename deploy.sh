# Maintainer: https://github.com/sfate
# Source: https://github.com/sfate/dotxfiles
#
# How_to_Install_or_Update:
#    !NOTE: This will override your existing setup
#    $ curl -Lo- https://git.io/dotxfiles-deploy.sh | bash
set -e

start_time=$(date +%s)
release_name=$(date +"%Y%m%d%H%M%S")
name='dotxfiles'
config_dir=$HOME/.xfiles
releases_dir=$config_dir/releases
backup_dir=$config_dir/backup
current_release_dir=$releases_dir/$release_name
current_backup_dir=$backup_dir/$release_name

echo "[*] Downloaded deploy script for: https://github.com/sfate/$name"
echo "[*] Start deploy of $name configuration"

echo "[*] Set bash as default"
chsh -s /bin/bash

echo "[*] Update build tools"
xcode-select --install

echo "[*] Install rosetta instructions"
echo '  > More info: https://developer.apple.com/documentation/apple-silicon/about-the-rosetta-translation-environment'
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo "[*] Install brew"
$BREW_DIR="$HOME/.brew"
git clone --depth=1 https://github.com/Homebrew/brew $BREW_DIR --quiet

echo "[*] Verify brew is correctly installed"
brew doctor

echo "[*] Clone $name repo"
(git clone https://github.com/sfate/$name.git $current_release_dir --quiet) &> /dev/null

echo "[*] Brew install deps"
brew bundle install

echo "[*] Install patched fonts"
git clone https://github.com/powerline/fonts
.fonts/install.sh

echo "[*] Old configuration backup"
(mkdir -p $config_dir/{backup,releases}/$release_name)
(mkdir -p $current_backup_dir/dots)

if [ -e "$HOME/.bin" ]; then
  (mv $HOME/.bin $current_backup_dir)
else
  echo '  > No ".bin" folder found. Skipping...'
fi

if [ -e "$HOME/.osx" ]; then
  (mv $HOME/.osx $current_backup_dir)
else
  echo '  > No ".osx" folder found. Skipping...'
fi

FILES=($current_release_dir/dots/*)
for f in ${FILES[@]}; do
  file_basename="$(basename $f)"
  home_dot_file="$HOME/.$file_basename"
  if [ "$file_basename" -eq "starship.toml" ]; then
    home_dot_file="$HOME/.config/$file_basename"
  fi

  if [ -e "$home_dot_file" ]; then
    mv "$home_dot_file" "$current_backup_dir/$file_basename"
  else
    echo "  > No '$home_dot_file' found. Skipping..."
  fi
done

echo "[*] Place new configuration files"
for f in ${FILES[@]}; do
  file_basename="$(basename $f)"
  home_dot_file="$HOME/.$file_basename"
  if [ "$file_basename" -eq "starship.toml" ]; then
    home_dot_file="$HOME/.config/$file_basename"
  fi
  cp -r "$f" $home_dot_file
done

echo "[*] Link folders"
(ln -s $current_release_dir/bin $HOME/.bin)
(ln -s $current_release_dir/osx $HOME/.osx)


echo "[*] Clean up"
old_releases=$(ls -td $releases_dir/* | tail -n +6)
old_backups=$(ls -td $backup_dir/* | tail -n +6)
[ -n "$old_releases" ] && rm -rf $old_releases
[ -n "$old_backups" ] && rm -rf $old_backups

echo "[*] Hosts should be updated separately"
echo '  > Source: https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts'
echo "[*] Deployed successfully. Time spent: $(($(date +%s)-$start_time))s"

exit 0
