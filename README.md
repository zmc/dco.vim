# vim-dco
Adds a Developer Certificate of Origin to the current buffer.

Because I occasionally forget to pass `-s` to `git commit`, I wrote this small plugin to save me from having to stash a long commit message and restart the editor. It's intended to be run from within a `git commit`-initiated vim session, and will insert a line like:

`Signed-off-by: Zack Cerza <zack@cerza.org>`

It will try to put the line in the right place - i.e. below all text content, but above any commented content.

## Installation

### vim-plug
Add the following to your `~/.vimrc`:

`Plug 'zmc/dco.vim'`

### Vundle
Add the following to your `~/.vimrc`:

`Plugin 'zmc/dco.vim'`

### Pathogen
`git clone --recursive https://github.com/zmc/dco.vim.git ~/.vim/bundle/dco.vim`

## Usage
You'll want to bind a key to invoke the plugin. I use `<leader>s`. To do this, add the following to your `~/.vimrc`:

`map <leader>s :call dco#AddDCO()<CR>`

Once you've done that and are inside a `git commit` editor session, simply press `<leader>s`!
