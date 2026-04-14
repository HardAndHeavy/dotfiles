return {
  {
    config = function()
      local ZK_ROOT = "/projects/zettelkasten"

      local function zk_autosync(bufnr)
        local filepath = vim.api.nvim_buf_get_name(bufnr)
        if not filepath:find("^" .. ZK_ROOT) then return end
        local filename = vim.fn.fnamemodify(filepath, ":t")
        vim.system({
          "sh", "-c",
          string.format(
            "cd %s && git add %s && git commit -m 'Vim-save: %s' && git push > /dev/null 2>&1 &",
            vim.fn.shellescape(ZK_ROOT),
            vim.fn.shellescape(filepath),
            filename
          )
        })

        vim.notify("🔄 ZK synced: " .. filename, "info", { title = "Zettelkasten" })
      end

      local zk_augroup = vim.api.nvim_create_augroup("ZettelkastenAutoSync", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = zk_augroup,
        pattern = "*",
        callback = function(args)
          zk_autosync(args.buf)
        end,
        desc = "Auto commit+push for Zettelkasten on save",
      })
    end,
  },
}
