 require("noice").setup({
            messages = {
                view = false,
                view_error = false,
                view_warn = false,
            },
            popupmenu = {
                backend = "cmp",
            },
            notify = {
                enabled = false,
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = false,
                command_palette = false,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        })
