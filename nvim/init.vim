call plug#begin('~/.vim/plugged')
    " Vim telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " LSP and completion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip user.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    "Plug 'glepnir/lspsaga.nvim'
    Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }

    " Git
    Plug 'tpope/vim-fugitive' 

    " nvim-tree
    Plug 'kyazdani42/nvim-tree.lua'

    " syntax highligh
    " disabled because now using treesitter for highlighting
    Plug 'sheerun/vim-polyglot'

    " hex color code colorizer
    Plug 'norcalli/nvim-colorizer.lua'

    " colorscheme plugins
    Plug 'gruvbox-community/gruvbox'


    " text manipulation plugins
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-abolish'
    Plug 'windwp/nvim-autopairs'
    Plug 'neoclide/vim-jsx-improve'
    Plug 'alvan/vim-closetag'

    " miscs wiki + web browser integration
    Plug 'vimwiki/vimwiki'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    " easyMotion / hop for fast movement
    if exists('g:vscode')
        Plug 'Nico-Guyon/vim-vscode-easymotion'
    else
        Plug 'phaazon/hop.nvim'
    endif

    " treesitter 
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'nvim-treesitter/playground'
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'

    " graphql
    Plug 'jparise/vim-graphql'

    " projectionist
    Plug 'tpope/vim-projectionist'

    " matching commands
    Plug 'tpope/vim-unimpaired'
    
    " better matchit plugin for % key
    Plug 'andymass/vim-matchup'

    " terminal
    Plug 'norcalli/nvim-terminal.lua'

call plug#end()

lua require("ng")
