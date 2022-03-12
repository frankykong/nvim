if !exists('g:loaded_telescope') | finish | endif

nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap  <silent> ;b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap  <silent> ;c <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap  <silent> ;m <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap  <silent> ;h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap  <silent> ;q <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap  <silent> ;s <cmd>lua require('telescope.builtin').spell_suggest()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').lsp_reference()<cr>
nnoremap  <silent> ;t <cmd>lua require('telescope.builtin').colorscheme()<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF


