# TinyMD.nvim

Tiny Markdown plugin I am using to provide:

- Provide indent (e.g. when writing `wiki` tags with `:`)
- Configure comments
- Configure format options
- Have `+` and `-` increase and decrease header level

It is `nvim` specific because it relies on `treesitter` for syntax, folding,
etc.

You can also use `treesitter` textobjects to move around:

```lua
require'nvim-treesitter.configs'.setup {
    --. ..
    textobjects = {
        select = {
            enable = true,

            keymaps = {
              -- Fenced code blocks
                ["a`"] = "@block.outer",
                ["i`"] = "@block.inner",
            }
        },
        move = {
            enable = true,
            goto_next_start = {
                -- Headers
                ["]]"] = "@class.outer",
                ["]`"] = "@block.outer",
            },
            -- ...
            goto_previous_start = {
                ["[["] = "@class.outer",
                ["[`"] = "@block.outer",
            },
        }
    }
}

```
