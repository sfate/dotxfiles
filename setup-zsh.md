### Set default shell

```sh
chsh -s $(which zsh)
```

### Set hostname

```sh
sudo scutil --set HostName "jesuscradle"
```

### Install Xcode Command Line Tools

```sh
xcode-select --install
```

### Install brew

```sh
git clone --depth=1 https://github.com/Homebrew/brew ~/.brew
export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"
```

### Install deps

```sh
brew install coreutils curl git reattach-to-user-namespace asdf tmux bat neovim fd
```

#### Install terminal fonts

```sh
brew install --cask font-terminess-ttf-nerd-font font-hack-nerd-font
```

#### Install others

```sh
brew install tig bat entr mkcert ripgrep the_silver_searcher nss eza tmux
mkcert -install
```

#### Setup new ssh key

```sh
ssh-keygen -t ed25519 -C "alexey.bobyrev@gmail.com"
```

Follow steps to tie GH profile with new ssh key:
https://docs.github.com/en/authentication/connecting-to-github-with-ssh

#### Configure tmux

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Press `prefix + I` (capital i, as in Install) to fetch the plugin.
```

### Install OhMyZsh!

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install powerlevel10k

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

##### Manage language runtimes

```sh
asdf plugin add rust
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin update --all
```

Choose runtime versions per machine. The local `upgrade-deps.sh` command reference shows the update flow: install and select user-level versions with `asdf install` and `asdf set -u`, set project versions with `asdf set`, then run `asdf reshim` and refresh project dependencies. It also records Ruby's Rust/YJIT and PostgreSQL/MySQL prerequisites. That file exits before its command section, so use it as a reference rather than running it.

#### Link dotfiles

Use the manual symlink commands in [readme.md](readme.md). The linked `.zshrc` adds `~/.local/bin` to `PATH`.

#### Neovim configuration

Neovim configuration is maintained separately in [sfate/dotnvim](https://github.com/sfate/dotnvim).

#### Set fast keyrepeats

```sh
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write NSGlobalDomain KeyRepeat -int 1
```

#### Other configuration

Profile (Preferences -> Profiles -> select relevant profile) and then turning off the display of marks (Terminal -> under "Shell Integration", turn off "Show mark indicators."
