# dotfiles (WIP)
Example setup for macOS, zsh, VimR

## Manual installs (incomplete)

* [Homebrew](https://brew.sh/)
     - then everything (?) in all_brews
* [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [fzf](https://github.com/junegunn/fzf): `brew install fzf && $(brew --prefix)/opt/fzf/install`
* [Neovim](https://neovim.io/) and [VimR](http://vimr.org/):
  `brew install neovim && brew cask install vimr`
* [minpac](https://github.com/k-takata/minpac)
  (leverages Vim 8/Neovim's packages features)
* [Fura Code Powerline](https://nerdfonts.com/) (Retina, 10 pt)
  via [Homebrew install](https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts):
  `brew tap caskroom/fonts && brew cask install font-firacode-nerd-font`
* [GNU Stow](https://www.gnu.org/software/stow/): `brew install stow`

Then:
```
cd
git clone git@github.com:clgroft/dotfiles.git
cd dotfiles
stow base
```
Within `nvim`/VimR (don't worry about "can't find theme" the first time):
```
:call minpac#update()
```
and restart the editor.

Also map capslock to ^ (Control) in System Preferences.
