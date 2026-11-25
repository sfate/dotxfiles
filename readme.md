# dotxfiles

Personal macOS shell, terminal, and command-line configuration. This repository is applied by linking files from `dots/` into your home directory; it does not need a deployment script.

## Tools in use

- **Shells:** Zsh with Oh My Zsh and Powerlevel10k; Bash with Starship. `asdf` manages language runtimes.
- **Terminal:** tmux, Alacritty, and iTerm2.
- **Editing and search:** Neovim ([configuration](https://github.com/sfate/dotnvim)), fzf, ripgrep, fd, bat, and eza.
- **Git workflow:** Git, tig, and lazygit.
- **Other development tools:** AWS CLI, htop, mkcert, pgcli, Docker, and DBeaver.
- **macOS integrations:** Alfred workflows, iTerm2 color schemes, and menu bar utilities.

The `Brewfile` records Homebrew package choices. Review it for the machine you are setting up before installing its entries. Runtime versions and `wtree` project settings are machine-specific and are managed locally.

## Link the configuration

Clone this repository to a stable location. From the repository root, create the destination directories and run the link commands below. `ln -sf` replaces an existing file or symlink at that path; links are made one file at a time, so unrelated files in `~/.config` remain untouched.

```bash
mkdir -p "$HOME/.config/alacritty/themes" "$HOME/.zsh-themes" "$HOME/.local/bin" "$HOME/.osx"

ln -sf "$PWD/dots/ackrc" "$HOME/.ackrc"
ln -sf "$PWD/dots/bash_completion" "$HOME/.bash_completion"
ln -sf "$PWD/dots/bash_profile" "$HOME/.bash_profile"
ln -sf "$PWD/dots/bashrc" "$HOME/.bashrc"
ln -sf "$PWD/dots/dircolors" "$HOME/.dircolors"
ln -sf "$PWD/dots/gitconfig" "$HOME/.gitconfig"
ln -sf "$PWD/dots/gitignore_global" "$HOME/.gitignore_global"
ln -sf "$PWD/dots/p10k.zsh" "$HOME/.p10k.zsh"
ln -sf "$PWD/dots/profile" "$HOME/.profile"
ln -sf "$PWD/dots/screenrc" "$HOME/.screenrc"
ln -sf "$PWD/dots/starship.toml" "$HOME/.config/starship.toml"
ln -sf "$PWD/dots/tigrc" "$HOME/.tigrc"
ln -sf "$PWD/dots/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$PWD/dots/tmux.conf.local" "$HOME/.tmux.conf.local"
ln -sf "$PWD/dots/zshrc" "$HOME/.zshrc"

ln -sf "$PWD/dots/config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -sf "$PWD/dots/config/alacritty/themes/gruvbox_dark.toml" "$HOME/.config/alacritty/themes/gruvbox_dark.toml"
ln -sf "$PWD/dots/config/alacritty/themes/gruvbox_light.toml" "$HOME/.config/alacritty/themes/gruvbox_light.toml"

ln -sf "$PWD/dots/zsh-themes/gruvbox-material-dark.zsh" "$HOME/.zsh-themes/gruvbox-material-dark.zsh"
ln -sf "$PWD/dots/zsh-themes/gruvbox-material-light.zsh" "$HOME/.zsh-themes/gruvbox-material-light.zsh"
ln -sf "$PWD/dots/zsh-themes/gruvbox-material-mix.zsh" "$HOME/.zsh-themes/gruvbox-material-mix.zsh"

ln -sf "$PWD/bin/tmux-go-scratch" "$HOME/.local/bin/tmux-go-scratch"
ln -sf "$PWD/bin/toggle_appearance.sh" "$HOME/.local/bin/toggle_appearance.sh"

ln -sf "$PWD/osx/Coffee Coffee.alfredworkflow" "$HOME/.osx/Coffee Coffee.alfredworkflow"
ln -sf "$PWD/osx/Dark Mode.alfredworkflow" "$HOME/.osx/Dark Mode.alfredworkflow"
ln -sf "$PWD/osx/Emoji Wine.alfredworkflow" "$HOME/.osx/Emoji Wine.alfredworkflow"
ln -sf "$PWD/osx/Gruvbox Dark.itermcolors" "$HOME/.osx/Gruvbox Dark.itermcolors"
ln -sf "$PWD/osx/Gruvbox Light.itermcolors" "$HOME/.osx/Gruvbox Light.itermcolors"
ln -sf "$PWD/osx/Network.alfredworkflow" "$HOME/.osx/Network.alfredworkflow"
ln -sf "$PWD/osx/iterm-unomadbro.json" "$HOME/.osx/iterm-unomadbro.json"
```

Import Alfred workflows and load iTerm2 profiles or color schemes from `~/.osx` in their respective applications. Restart the affected application or reload its configuration after linking.

## Repository layout

- `dots/` — shell and application configuration.
- `bin/` — helper scripts for the shell and tmux.
- `osx/` — Alfred workflows, iTerm2 profiles, and color schemes.
- `Brewfile` — Homebrew package declarations.
- `setup-bash.md`, `setup-zsh.md` — additional shell setup notes.
