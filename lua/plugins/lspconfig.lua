return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        emmet_ls = {
          -- filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "rust" },
          init_options = {
            html = {
              options = {
                ["jsx.enabled"] = true
              }
            }
          }
        },
        tailwindcss = {
          filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "rust" },
          init_options = {
            userLanguages = {
              html = "html",
              css = "css",
              javascript = "javascript",
              javascriptreact = "javascript",
              typescript = "typescript",
              typescriptreact = "typescript",
              rust = "html"
            }
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  -- For Leptos class! macro
                  'class!\\s\\(\\s"([^"])"\\s\\)',
                  'class!\\s\\(\\s\'([^\'])\'\\s\\)',
                },
              },
              validate = true,
            },
          },
        },
        rust_analyzer = {
          procMacro = {
            enable = true,
            enableLocal = true,
            enableInWorkspace = true,
            enableExternal = true,
            externalLinter = "clippy",
          }
        }
      }
    }
  }
}
