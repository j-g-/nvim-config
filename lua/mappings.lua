--- Nvim Tree toogle
--vim.keymap.set('','<F2>', '<cmd>:NvimTreeToggle<cr>')
vim.keymap.set('v','<Enter>', '<Plug>(EasyAlign)')
vim.keymap.set('n','ga', '<Plug>(EasyAlign)')
vim.keymap.set('n','<>', '<Plug>(EasyAlign)')
vim.keymap.set('n', '<leader>tp', '<cmd>:tabprevious')
vim.keymap.set('n', '<leader>tn', '<cmd>:tabnext')
vim.keymap.set('n', '<leader>ta', '<cmd>:tabnew')
vim.keymap.set({'n', 'i', 'v'}, '<F2>', ':Neotree toggle<cr>', {})

-- Map <leader>t + n to switch to the next tab in all modes
vim.api.nvim_set_keymap('', '<leader>tn', ':tabnext<CR>', { noremap = true, silent = true })

-- Map <leader>t + p to switch to the previous tab in all modes
vim.api.nvim_set_keymap('', '<leader>tp', ':tabprevious<CR>', { noremap = true, silent = true })

-- Map <leader>ta to add a new tab in all modes
vim.api.nvim_set_keymap('', '<leader>ta', ':tabnew<CR>', { noremap = true, silent = true })

-- Map <leader>tc to close the current tab in all modes
vim.api.nvim_set_keymap('', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })


--local status, telescope = pcall( require , 'telescope')
local builtin = require( 'telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
