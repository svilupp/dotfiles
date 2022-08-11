local keymap = vim.keymap

-- Go to the begining and end of current line in insert mode quickly
keymap.set('i', '<C-A>', '<HOME>')
keymap.set('i', '<C-E>', '<END>')

-- Delete the character to the right of the cursor
keymap.set('i', '<C-D>', '<DEL>')


-- Additional mapping
local nmap = function(key, effect)
vim.keymap.set('n', key, effect, {silent = true, noremap = true})
end

local vmap = function(key, effect)
vim.keymap.set('v', key, effect, {silent = true, noremap = true})
end

local imap = function(key, effect)
vim.keymap.set('i', key, effect, {silent = true, noremap = true})
end

-- send code with ctrl+Enter
-- just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
-- nmap('<c-cr>', '<Plug>SlimeSendCell')
-- nmap('<s-cr>', '<Plug>SlimeSendCell')
-- imap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
-- imap('<s-cr>', '<esc><Plug>SlimeSendCell<cr>i')

-- send code with Enter and leader Enter
-- vmap('<cr>', '<Plug>SlimeRegionSend')
-- nmap('<leader><cr>', '<Plug>SlimeSendCell')


-- configure code sending, change where to send
-- speak: leader-code-configure
-- nmap('<leader>cc', '<Plug>SlimeConfig')
