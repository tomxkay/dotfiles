# backup current nvim dir
mv ~/.config/nvim ~/.config/nvim.bak

# clean neovim dirs
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak


# clone AstroNvim repo
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# clone your custom AstroNvim user config repo
git clone https://github.com/tomxkay/astronvim_config.git ~/.config/nvim/lua/user

# initialize AstroNvim
nvim  --headless -c 'autocmd User PackerComplete quitall'
