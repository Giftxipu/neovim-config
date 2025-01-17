return {
  {
      "mfussenegger/nvim-lint",
      event = { "BufReadPost", "BufNewFile", "BufWritePre" },
      opts = {
          -- Event to trigger linters
          events = { "BufWritePost", "BufReadPost", "InsertLeave" },
          linters_by_ft = {
              fish = { "fish" },
              python = { "ruff" },
              javascript = { "eslint" },
              typescript = { "eslint" },
              json = { "jsonlint" },
              yaml = { "yamllint" },
              markdown = { "markdownlint" },
              -- Add more filetypes and their linters here
          },
          -- LazyVim extension to easily override linter options
          -- or add custom linters.
          linters = {
              -- Example custom linter configuration
              -- selene = {
              --   condition = function(ctx)
              --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
              --   end,
              -- },
          },
      },
      config = function(_, opts)
          local lint = require("lint")
          
          -- Configure linters from opts
          lint.linters_by_ft = opts.linters_by_ft

          -- Update linter configurations
          for name, linter in pairs(opts.linters) do
              if type(linter) == "table" and type(lint.linters[name]) == "table" then
                  lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
              else
                  lint.linters[name] = linter
              end
          end

          -- Create debounced lint function
          local function debounce(ms, fn)
              local timer = vim.uv.new_timer()
              return function(...)
                  local argv = { ... }
                  timer:start(ms, 0, function()
                      timer:stop()
                      vim.schedule_wrap(fn)(unpack(argv))
                  end)
              end
          end

          -- Lint function
          local function do_lint()
              local names = lint._resolve_linter_by_ft(vim.bo.filetype)

              -- Add global linters
              if opts.linters_by_ft["*"] then
                  vim.list_extend(names, opts.linters_by_ft["*"])
              end

              -- Add fallback linters
              if #names == 0 and opts.linters_by_ft["_"] then
                  vim.list_extend(names, opts.linters_by_ft["_"])
              end

              -- Filter out non-existent linters
              names = vim.tbl_filter(function(name)
                  return lint.linters[name] ~= nil
              end, names)

              if #names > 0 then
                  lint.try_lint(names)
              end
          end

          -- Setup autocommands for linting
          vim.api.nvim_create_autocmd(opts.events, {
              group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
              callback = debounce(100, do_lint),
          })
      end,
  },
}