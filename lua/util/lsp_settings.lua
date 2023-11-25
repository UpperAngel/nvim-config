local M = {}

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

M.on_attach = function(_, bufnr)
	opts.buffer = bufnr

	opts.desc = 'Show LSP references'
	keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)

	opts.desc = 'Go to declaration'
	keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

	opts.desc = 'Show LSP definitions'
	keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)

	opts.desc = 'Show LSP implementations'
	keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)

	opts.desc = 'Show LSP type definitions'
	keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)

	opts.desc = 'See available code actions'
	keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

	opts.desc = 'Smart rename'
	keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

	opts.desc = 'Show buffer diagnostics'
	keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)

	opts.desc = 'Show line diagnostics'
	keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

	opts.desc = 'Go to previous diagnostic'
	keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

	opts.desc = 'Go to next diagnostic'
	keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

	opts.desc = 'Show documentation for what is under cursor'
	keymap.set('n', 'K', vim.lsp.buf.hover, opts)

	opts.desc = 'Restart LSP'
	keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(M.capabilities)

return M
