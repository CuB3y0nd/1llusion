# How to use my dotfiles

## Installation

### Neovim (>=0.9.0)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
sudo mv nvim /usr/local/bin/nvim
```

### pynvim, npm and cargo

```bash
python3 -m pip install --user --upgrade pynvim
sudo apt install -y nodejs npm
sudo npm install -g neovim

curl https://sh.rustup.rs -sSf | sh
```

### Nerd Fonts

```bash
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh JetBrainsMono
```

### Import dotfiles

- Use `stow` to manage configuration files

```bash
sudo apt install -y stow
```

```bash
git clone https://github.com/CuB3y0nd/1llusion.git
cd 1llusion/.dotfiles
stow 1llusion -t ~
```

It will put all the files in the `1llusion` directory into the home directory `~`. Which is equivalent to creating `~/.config/nvim`
