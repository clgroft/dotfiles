# dotfiles (WIP)
Example setup for macOS, zsh, Doom Emacs

## Manual installs

* [iTerm2](https://iterm2.com/)
* [Homebrew](https://brew.sh/)
* [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Doom Emacs](https://github.com/hlissner/doom-emacs)
* [Starship prompt](https://starship.rs/)
* Fonts: [Fira Code](https://fonts.google.com/specimen/Fira+Code), [Noto Serif](https://fonts.google.com/noto/specimen/Noto+Serif), and [Overpass](https://fonts.google.com/noto/specimen/Noto+Serif)

Then:
```
cd
git clone git@github.com:clgroft/dotfiles.git
cd dotfiles
brew bundle
stow base
```
Also map capslock to Escape in System Preferences (because Doom Emacs).
