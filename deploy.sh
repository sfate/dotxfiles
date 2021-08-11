# Maintainer: https://github.com/sfate
# Source: https://github.com/sfate/dotxfiles
# Last Edit: 15/Jan/2020
#
# How_to_Install_or_Update:
#    !NOTE: This will override your existing setup
#    $ curl -Lo- https://git.io/dotxfiles-deploy.sh | bash
set -e

start_time=$(date +%s)
release_name=$(date +"%Y%m%d%H%M%S")
name='dotxfiles'
config_dir=$HOME/.$dotxfiles
releases_dir=$config_dir/releases
backup_dir=$config_dir/backup
current_release_dir=$releases_dir/$release_name
current_backup_dir=$backup_dir/$release_name

echo "[*] Downloaded deploy script for: https://github.com/sfate/$name"
echo "[*] Start deploy of $name configuration"

echo "[*] Clone $name repo"
(git clone https://github.com/sfate/$name.git $current_release_dir --quiet) &> /dev/null
FILES=($current_release_dir/dots/*)

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

for f in ${FILES[@]}; do
  home_dot_file="$HOME/.$(basename $f)"
  
  if []; then
    mv home_dot_file "$current_backup_dir/$(basename $f)"
  else
    echo "  > No '$home_dot_file' folder found. Skipping..."
  fi
done

echo "[*] Link folders"
(ln -s $current_release_dir/bin $HOME/.bin)
(ln -s $current_release_dir/osx $HOME/.osx)

echo "[*] Place new configuration files"
for f in ${FILES[@]}; do
  cp -r "$f" "$HOME/.$(basename $f)"
done

echo "[*] Clean up"
old_releases=$(ls -td $releases_dir/* | tail -n +6)
old_backups=$(ls -td $backup_dir/* | tail -n +6)
[ -n "$old_releases" ] && rm -rf $old_releases
[ -n "$old_backups" ] && rm -rf $old_backups

echo "[*] Deployed successfully. Time spent: $(($(date +%s)-$start_time))s"

exit 0
