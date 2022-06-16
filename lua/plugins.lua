return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colorschemes
    use {
        'dracula/vim',
        as = 'dracula'
    }
    
    -- common deps
    use "nvim-lua/plenary.nvim" -- lua functions required by many packages
    use "nvim-lua/popup.nvim" -- popup api, also used by many packages

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-git"
    use "hrsh7th/cmp-nvim-lsp"
    
    -- snippets
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- lsp
    use {
        "williamboman/nvim-lsp-installer",
        config = function ()
            require("nvim-lsp-installer").setup {}
        end
    }
    require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
    use "neovim/nvim-lspconfig"
end)

