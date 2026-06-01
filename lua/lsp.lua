vim.lsp.enable("lua_ls")

local caps = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", { capabilities = caps })
