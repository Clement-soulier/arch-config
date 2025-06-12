return {
    {
        -- detect tabstop and shiftwidth automatically
        'tpope/vim-sleuth',
    },
    {
        -- git integration
        'tpope/vim-fugitive',
    },
    {
        -- github integration
        'tpope/vim-rhubarb',
    },
    {
        --hint keybinds
        'folke/which-key.nvim',
    },
    {
        -- autoclose parentheses, brackets, quotes, ect...
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        opts = {},
    },
    {
        --Highlight todo, notes in comments
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim'},
        opts = { signs = false },
    },
    {
        -- color Highlighter
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require('colorizer').setup()
        end
    }
}
