return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "saghen/blink.cmp" },
    { "j-hui/fidget.nvim", opts = {} },
    { "rust-lang/rust.vim" },
    { -- !WARN: requires rust-analyzer, if u r using rustup then add rust-analyzer component
      -- $ rustup component add rust-analyzer
      "mrcjkb/rustaceanvim",
      version = "^4", -- Recommended
      lazy = false, -- This plugin is already lazy
    },
  },
  _opts = {
    -- add custom server config
    -- check :h lspconfig-all
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            hint = {
              enable = true, -- necessary
            },
          },
        },
      },
      ts_ls = {
        settings = {
          tsserver = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
      bashls = {},
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
        settings = {
          clangd = {
            InlayHints = {
              Designators = true,
              Enabled = true,
              ParameterNames = true,
              DeducedTypes = true,
            },
            fallbackFlags = { "-std=c++20" },
          },
        },
      },
      pyright = {},
      pylsp = {},
      marksman = {},
      ["ltex-ls"] = {},
      eslint = {},
    },
    tools = {
      "stylua",
      "lua-language-server",
      "shellcheck",
      "luacheck",
      "misspell",
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspAttach_au", { clear = true }),
      callback = function(event)
        -- map keybinds helper function
        local map = function(keys, func, desc)
          vim.keymap.set(
            "n",
            keys,
            func,
            { buffer = event.buf, desc = "LSP: " .. desc }
          )
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map(
          "gd",
          require("telescope.builtin").lsp_definitions,
          "[G]oto [D]efinition"
        )

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- Find references for the word under your cursor.
        map(
          "gr",
          require("telescope.builtin").lsp_references,
          "[G]oto [R]eferences"
        )

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map(
          "gi",
          require("telescope.builtin").lsp_implementations,
          "[G]oto [I]mplementation"
        )

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map(
          "gt",
          require("telescope.builtin").lsp_type_definitions,
          "Type [D]efinition"
        )

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map(
          "gs",
          require("telescope.builtin").lsp_document_symbols,
          "[D]ocument [S]ymbols"
        )

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map(
          "gS",
          require("telescope.builtin").lsp_dynamic_workspace_symbols,
          "[W]orkspace [S]ymbols"
        )

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("gr", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("ga", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map("K", vim.lsp.buf.hover, "Hover Documentation")

        -- by default, enable lsp_inlay_hints
        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true)
        end

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup(
            "kickstart-lsp-highlight",
            { clear = false }
          )
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup(
              "kickstart-lsp-detach",
              { clear = true }
            ),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({
                group = "kickstart-lsp-highlight",
                buffer = event2.buf,
              })
            end,
          })
        end
      end,
    })
  end,
}
