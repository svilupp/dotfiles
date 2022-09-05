-- Some utility stuff
require 'utils'

-- plugin installation
require 'plugins'

-- load quarto delayed
vim.defer_fn(function() require('config.quarto-nvim') end, 2000)


-- this will become future config.lua
-- required for spellcheck
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }
