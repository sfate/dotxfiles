### Set default shell

```sh
chsh -s $(which bash)
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
brew install coreutils curl git bash-completion reattach-to-user-namespace
```

### Install asdf

```sh
brew install asdf
echo -e "\n. \"$(brew --prefix asdf)/libexec/asdf.sh\"" >> ~/.bashrc
echo -e "\n. \"$(brew --prefix asdf)/etc/bash_completion.d/asdf.bash\"" >> ~/.bashrc
```

##### Install go and node

```sh
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.20.12

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 18.19.0
```

##### Upd asdf go env

```sh
# add to .bashrc
# Update asdf go env
go_path="$(asdf where golang)"
if [[ -n "${go_path}" ]]; then
  export GOPATH=$(asdf where golang)/packages
  export GOROOT=$(asdf where golang)/go
  export PATH="${PATH}:$(go env GOPATH)/bin"
fi
```

#### Upd custom bash preloads

```sh
# add to .bashrc
# add brew
export PATH="$HOME/.brew/bin/:$PATH"

# Custom conf
alias tmux="tmux -2"
export LC_ALL=en_US.UTF-8

# Init starship
eval "$(starship init bash)"

# Init dircolors
# export LSCOLORS="Gxfxcxdxbxegedabagacad
alias ls='ls -F -G'
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

#### Install nerd-fonts

```sh
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

#### Install starship (prompt for bash)

```sh
brew install starship
```

#### Install others

```sh
brew install tig bat entr mkcert ripgrep the_silver_searcher nss
mkcert -install
```


