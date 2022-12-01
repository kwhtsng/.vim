UsePlugin 'vim-lsp'

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('$XDG_CONFIG_HOME/nvim/tmp/vim-lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:lsp_diagnostics_signs_enabled          = 1
let g:lsp_diagnostics_signs_error            = {'text': '💩'}
let g:lsp_diagnostics_signs_warning          = {'text': '⚠'}
let g:lsp_diagnostics_signs_information      = {'text': 'ℹ'}
let g:lsp_diagnostics_signs_hint             = {'text': '💡'}
let g:lsp_document_code_action_signs_enabled = 1

if executable('pyls')
    au User lsp_setup call lsp#register_server({
\       'name': 'pyls',
\       'cmd': {server_info->['pyls']},
\       'whitelist': ['python'],
\       'workspace_config': {
\           'pyls': {
\               'pylsp_mypy': {
\                   'enabled': 1,
\               },
\           },
\       }
\ })
endif
