vim.g.mapleader = " "

local keymap = vim.keymap  -- for conciseness

-- general keymaps

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v")  -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")  -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")  -- make split windows equal
keymap.set("n", "<leader>sx", ":close<CR>")  -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>")  -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- close current ab
keymap.set("n", "<leader>tn", ":tabn<CR>")  -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")  -- go to previous tab

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") 
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") 
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") 
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") 
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") 

-- markdown preview
keymap.set("n", "<leader>ms", ":MarkdownPreview<CR>")
keymap.set("n", "<leader>mx", ":MarkdownPreviewStop<CR>")

-- zathura keybind
keymap.set("n", "<leader>q", ":!zathura <C-r>= expand('%:r')<cr>.pdf &<cr>")
