# Config for Neovim for Python and Node.js
Neovim config 

# Lazy (uses Lazy)
Lazy.nvim is a user friendly plugin manager for neovim, also known for its speeds 
due to lazy loading

# Mason for LSP's
An LSP is a Language Server Protocol, useful for checking errors in code while writng.
This uses Synaptic and pyright for the Python lsp and ts_ls for node js and ts.
If you want to install another LSP for lets say, lua
you can use the `:Mason` command and then naviagte to the LSP that you want to download
and click `i` to install it, but you will have to add it to your config after that
or, you can go use the `:MasonInstall <formatter/linter/LSP name>` command to directly install the 
LSP without navigation.

# Keybinds:
Ctrl + n == open oil.nvim |
Ctrl + \ == open floaterm |
Space + m == find custom commands using telescope |
Space + f == fuzzyly find files using telescope |
Space + g == Live grep through the files |
Space + tb == open tagbar.nvim |

# What each plugin does:

oil.nvim == file navigation
tagbar.nvim == symbols panel (kind of)
telescope.nvim == File search, command search, live grep
floaterm == Floating terminals

# How you can add your own modifications to this:

I myself cannot teach you how can you, because I do not know which plaugins you may prefer.
typecraft.dev has an amazing series called "Neovim for Newbs" where I learnt from.

# Suggesstions :

To give me suggesstions you can Dm me @mr.ultra69 (yes i know the name is an old meme) on discord.

# Deletions to be performed:
in the main directory you can find make_file.lua and setup_venv.lua
(not in lua/commands/ ) You can delete these files. (100% sure)

_if you've come along this much and found this repository you likely already know a lot about neovim and vim motions_
_But if you are still a beginner i highly recommend watching videos by the Primeagen and typecraft_
_the two people I learnt from_
..
