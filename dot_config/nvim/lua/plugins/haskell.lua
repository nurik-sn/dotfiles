return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        hls = {
          mason = false,
          enabled = false,
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "haskell-language-server"
      end, opts.ensure_installed or {})
    end,
  },
}
