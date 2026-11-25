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
```

The linked `dots/bashrc` initializes asdf and its Bash completion.

##### Manage language runtimes

```sh
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add rust
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin update --all
```

Choose runtime versions per machine. The local `upgrade-deps.sh` command reference shows the update flow: install and select user-level versions with `asdf install` and `asdf set -u`, set project versions with `asdf set`, then run `asdf reshim` and refresh project dependencies. It also records Ruby's Rust/YJIT and PostgreSQL/MySQL prerequisites. That file exits before its command section, so use it as a reference rather than running it.

##### Configure the Go environment

The linked `dots/bashrc` sets `GOPATH`, `GOROOT`, and the Go binary path when an asdf Go version is available.

#### Bash settings

The linked `dots/bashrc` contains the Bash aliases, Starship prompt, and other custom settings. Avoid appending duplicate settings to `.bashrc`.

#### Link dotfiles

Use the manual symlink commands in [readme.md](readme.md). The linked Bash profile adds `~/.local/bin` to `PATH` and loads `.bashrc`.

#### Neovim configuration

Neovim configuration is maintained separately in [sfate/dotnvim](https://github.com/sfate/dotnvim).

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


