-- neovim-lsp configuration
-- https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
-- https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
local nvim_lsp = require("lspconfig")

local format_async = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then return end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command("noautocmd :update")
        end
    end
end

vim.lsp.handlers["textDocument/formatting"] = format_async
_G.lsp_organize_imports = function()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

-- small workaround to prevent nvim to display react/index.d.ts 
-- every time on each jumpToDefinition ...
-- https://github.com/typescript-language-server/typescript-language-server/issues/216
vim.lsp.handlers["textDocument/definition"] = function(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
     local _ = vim.lsp.log.info() and vim.lsp.log.info(method, 'No location found')
     return nil
  end

  if vim.tbl_islist(result) then
     vim.lsp.util.jump_to_location(result[1])
     if #result > 1 then
        local isReactDTs = false
        for key, value in pairs(result) do
           if string.match(value.uri, "react/index.d.ts") then
              isReactDTs = true
              break
           end
        end
        if not isReactDTs then
           vim.lsp.util.set_qflist(util.locations_to_items(result))
           vim.api.nvim_command("copen")
           vim.api.api.nvim_command("wincmd p")
        end
     end
  else
     vim.lsp.util.jump_to_location(result)
  end
end


-- https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
local on_attach = function(client, bufnr)
    local buf_map = vim.api.nvim_buf_set_keymap
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspOrganize lua lsp_organize_imports()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    vim.cmd(
        "command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

    buf_map(bufnr, "n", "gd", ":LspDef<CR>", {silent = true})
    --buf_map(bufnr, "n", "gr", ":LspRename<CR>", {silent = true})
    --buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>", {silent = true})
    --buf_map(bufnr, "n", "gh", ":LspHover<CR>", {silent = true})
    --buf_map(bufnr, "n", "gs", ":LspOrganize<CR>", {silent = true})
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
    --buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
    --buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>",
              {silent = true})


    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()  
         augroup END
         ]], true)
    end
end

nvim_lsp.tsserver.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
}

local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
    html = "eslint",
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    }
}

local formatters = {
    prettier = {command = "eslint_d", args = {"--fix-to-stdout", "--stdin", "--stdin-filename", "%filepath"}},
    prettierSimple = {command = "prettier", asrgs = {"--stdin-filepath", '%filepath'}}
}

local formatFiletypes = {
    typescript = "prettier",
    typescriptreact = "prettier",
    html = "prettierSimple"
}

-- https://www.reddit.com/r/neovim/comments/j2tn38/help_with_integrate_nvimlsp_with_eslint/
nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = vim.tbl_keys(filetypes),
    init_options = {
        filetypes = filetypes,
        linters = linters,
        formatters = formatters,
        formatFiletypes = formatFiletypes
    }
}

-- do
--   local method = "textDocument/publishDiagnostics"
--   local default_handler = vim.lsp.handlers[method]
--   vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
--     default_handler(err, method, result, client_id, bufnr, config)
--     local diagnostics = vim.lsp.diagnostic.get_all()
--     local qflist = {}
--     for bufnr, diagnostic in pairs(diagnostics) do
--       for _, d in ipairs(diagnostic) do
--         d.bufnr = bufnr
--         d.lnum = d.range.start.line + 1
--         d.col = d.range.start.character + 1
--         d.text = d.message
--         table.insert(qflist, d)
--       end
--     end
--     vim.lsp.util.set_qflist(qflist)
--   end
-- end


-- function! g:diagnostic_toggle_virtual_text()
--   local virtual_text = vim.b.lsp_virtual_text_enabled
--   virtual_text = not virtual_text
--   vim.b.lsp_virtual_text_enabled = virtual_text
--   vim.lsp.diagnostic.display(vim.lsp.diagnostic.get(0, 1), 0, 1, {virtual_text = virtual_text})
-- end

-- nmap <Leader>g <cmd>call M.diagnostic_toggle_virtual_text()<cr>
