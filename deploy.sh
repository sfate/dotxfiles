function set_progress() {
  bar_symbols=""
  tput sc
  tput cuf 2; echo -n "[*] Copying:  [....................................................................................................] 0%";
  tput rc
  count=$([[ $1 -gt 100 ]] && echo 100 || echo $1)
  for i in $(seq 1 $count); do
    bar_symbols+="#"
  done
  tput sc
  tput cuf 17; echo -n $bar_symbols
  tput rc; tput sc
  tput cuf 119; echo -n "$count%   "
  tput rc
  [[ $1 =~ 100 ]] && echo
}

echo
echo "Start dotfiles deploy:"
cd $HOME
(git clone https://github.com/sfate/dotZ.git dotZ --quiet) > /dev/null 2>&1
FILES=($HOME/dotZ/dots/*)
length=$((100/${#FILES[@]}))
iter=0
for f in ${FILES[@]}; do
  cp -r "$f" "$HOME/.$(basename $f)"

  iter=$(($iter + 1))
  set_progress $(echo $(($iter * $length)))
  sleep 0.1
done
rm -rf dotZ
set_progress 100
echo "All done. Exiting.."
echo
exit 0
