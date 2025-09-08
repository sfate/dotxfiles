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
brew install coreutils curl git reattach-to-user-namespace asdf tmux bat nvim
```

### Install OhMyZsh!

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install powerlevel10k

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

##### Install go, node and ruby

```sh
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.20.12

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.19.0

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.3.0
```


#### Add dotfiles conf

```sh
curl -sLo- https://git.io/dotxfiles-deploy.sh | bash
```

#### Add vim conf

```sh
curl -sLo- https://git.io/dotvimmy-deploy.sh | bash
```

#### Setup new ssh key

```sh
ssh-keygen -t ed25519 -C "alexey.bobyrev@gmail.com"
```

Follow steps to tie GH profile with new ssh key:
https://docs.github.com/en/authentication/connecting-to-github-with-ssh


#### Set fast keyrepeats

```sh
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
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

#### Configure tmux

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Press `prefix + I` (capital i, as in Install) to fetch the plugin.
```

#### Other configuration

Profile (Preferences -> Profiles -> select relevant profile) and then turning off the display of marks (Terminal -> under "Shell Integration", turn off "Show mark indicators."
