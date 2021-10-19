-- telescope configuration => using fzy-native
-- https://github.com/elianiva/dotfiles/blob/master/nvim/.config/nvim/lua/plugins/_telescope.lua#L58-L63
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {'node_modules', '%.png', '%.ttf', '%.jpg'},
        file_sorter = require('telescope.sorters').get_fzy_sorter,
         vimgrep_arguments = {
             'rg',
             '--color=never',
             '--no-heading',
             '--with-filename',
             '--line-number',
             '--column',
             '--smart-case'
         },

        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qlist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.send_to_loclist + actions.open_loclist,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

