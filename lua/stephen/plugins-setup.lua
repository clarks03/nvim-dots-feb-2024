-- autoinstall packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data")
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()  -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    -- colourscheme
    use {'nyoom-engineering/oxocarbon.nvim'} 
    -- use('dylanaraps/wal.vim')
    use {"rose-pine/neovim", as = "rose-pine"}

    -- tmux & split window navigation
    use("christoomey/vim-tmux-navigator")

    -- fullscreen current window
    use("szw/vim-maximizer")  
    
    -- essential plugins
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    -- commenting with gc
    use("numToStr/Comment.nvim")

    -- file explorer
    use("nvim-tree/nvim-tree.lua")

    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- fuzzy finding
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })  -- dependency
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")  -- recommends text from buffer
    use("hrsh7th/cmp-path")    -- recommends files in path

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use ("rafamadriz/friendly-snippets")

    -- managing & installing lsp servers
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- configuring lsp servers
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    -- auto closing
    use("windwp/nvim-autopairs")
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

    -- markdown visualizer
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- latex
    use({"lervag/vimtex"})

    -- git signs plugin
    use("lewis6991/gitsigns.nvim")

    -- copilot????
    use("github/copilot.vim")

    -- needs to be last line
    if packer_bootstrap then
        require("packer").sync()
    end
end)
