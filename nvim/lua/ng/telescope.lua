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
                ["<C-h>"] = function(prompt_bufnr)
                    require("telescope").extensions.hop.hop(prompt_bufnr)
                end,
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
        },
        hop = {
          -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
          -- shown keys here are only subset of defaults!
          keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "A", "S", "D", "F", "G", "H", "J", "K", "L", ":"}, -- ... and more

          -- Highlight groups to link to signs and lines; the below configuration refers to demo
          -- sign_hl typically only defines foreground to possibly be combined with line_hl
          sign_hl = { "WarningMsg", "Title" },
          -- optional, typically a table of two highlight groups that are alternated between
          line_hl = { "CursorLine", "Normal" },
          -- options specific to `hop_loop`
          -- true temporarily disables Telescope selection highlighting
          clear_selection_hl = false,
          -- highlight hopped to entry with telescope selection highlight
          -- note: mutually exclusive with `clear_selection_hl`
          trace_entry = true,
          -- jump to entry where hoop loop was started from
          reset_selection = true,
        },
    }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('hop')
