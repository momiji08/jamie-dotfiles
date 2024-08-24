# Dotfiles

Repo contains the dotfiles for my linux/mac setup

## Requirements

Check for the following:

### Git

To ensure version control

For arch:

```
sudo pacman -S git
```

For debian:

```
sudo apt install git
```

### Stow

Allows us to have linked dotfiles in a single directory.
Stow will create a link between the files in this repo and
files in your system. Ensure the structure remains the same,
i.e. HOME/.config/nvim = dotfiles/.config/nvim.

For arch:

```
sudo pacman -S stow
```

For debian:

```
sudo apt install stow
```
