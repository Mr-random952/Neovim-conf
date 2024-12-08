-- Bootstraps lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = " "

require('lazy').setup({
  -- Plugins
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'voldikss/vim-floaterm' },
  { 'stevearc/oil.nvim' }, -- Added oil.nvim
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'onsails/lspkind.nvim' },
  { 'hrsh7th/vim-vsnip' },
  { 'windwp/nvim-autopairs' },
  { 'EdenEast/nightfox.nvim' },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'hoob3rt/lualine.nvim' },
  { 'MunifTanjim/nui.nvim' },
  { 'nvim-tree/nvim-web-devicons' },

  -- Alpha.nvim
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.startify")

      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
      }

      alpha.setup(dashboard.opts)
    end,
  },

  -- Noice.nvim
  {
    "folke/noice.nvim",
    dependencies = { 'nvim-lua/plenary.nvim', 'rcarriga/nvim-notify' },
    config = function()
      require("noice").setup({
        lsp = {
          progress = { enabled = true },
          hover = { enabled = true },
        },
        messages = {
          view = "notify",
          timeout = 3000,
        },
      })
    end,
  },

  -- Tagbar (alternative to nvim-navbuddy)
  {
    "preservim/tagbar",
    cmd = "TagbarToggle",
    config = function()
      vim.g.tagbar_width = 30
      vim.g.tagbar_autoclose = 1
      vim.g.tagbar_sort = 0
    end,
  },
})

-- General Settings
vim.cmd("colorscheme nightfox") -- Set Nightfox theme
vim.o.showmode = false
vim.wo.number = true

-- Oil.nvim Setup (replaces NeoTree)
require('oil').setup({
  use_default_keymaps = true, -- Enable default keymaps
  keymaps = {
    ["<C-n>"] = ":OilToggle<CR>", -- Toggle Oil file explorer with <C-n>
  },
  view = {
    width = 40,
  },
})

-- Mason Setup
require('mason').setup()
require('mason-lspconfig').setup({ ensure_installed = { 'pyright', 'ts_ls' } })
require('lspconfig').pyright.setup{}

-- Treesitter Setup
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'python', 'lua', 'javascript', 'typescript', 'html', 'css' },
  highlight = { enable = true },
  indent = { enable = true },
})

-- Autopairs
require('nvim-autopairs').setup({ check_ts = true })

-- Lualine
require('lualine').setup({
  options = {
    theme = 'carbonfox',
    section_separators = { '', '' },
    component_separators = { '', '' },
  },
})

-- Telescope
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-f>"] = require('telescope.builtin').find_files,
        ["<C-u>"] = require('telescope.builtin').live_grep,
      },
    },
  },
})

-- Keymaps
vim.api.nvim_set_keymap('n', '<C-n>', ':Oil<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-\\>', ':FloatermToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>m', ':Telescope commands<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tb', ':TagbarToggle<CR>', { noremap = true, silent = true })

-- Custom commands
require("commands.make_file").setup()
require("commands.setup_venv").setup_venv()

