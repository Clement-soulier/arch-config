require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup{
    require 'plugins.neotree',
    require 'plugins.colortheme',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
    --require 'plugins.autoformating',
    require 'plugins.gitsigns',
    require 'plugins.alpha',
    require 'plugins.indent-blankline',
    require 'plugins.misc'
}

-- Auto-compile LaTeX on save with pdflatex
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    local file = vim.fn.expand("%:p")
    local pdf_file = vim.fn.expand("%:r") .. ".pdf"

    -- Compilation
    vim.fn.jobstart({ "pdflatex", "-interaction=nonstopmode", file }, {
      on_exit = function(_, exit_code, _)
        if exit_code == 0 then
          print("✅ Compilation réussie : " .. pdf_file)
          -- Supprimer les fichiers auxiliaires
          local aux_files = {".aux", ".log", ".out", ".toc", ".lof", ".lot"}
          for _, ext in ipairs(aux_files) do
            local aux_file = vim.fn.expand("%:r") .. ext
            if vim.fn.filereadable(aux_file) == 1 then
              os.remove(aux_file)
            end
          end
        end
      end
    })
  end,
})

--vim.o.background = "dark"

-- Default options:
require("neofusion").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = true,
})
vim.cmd([[ colorscheme neofusion ]])
