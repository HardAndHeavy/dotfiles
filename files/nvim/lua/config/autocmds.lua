-- Автоматичкская отправка в git файлов цеттелькастен системы при их сохранении

local ZK_ROOT = "/data/projects/zettelkasten"
local sync_timer = nil
local DEBOUNCE_MS = 2000

local function do_sync(filepath)
  local filename = vim.fn.fnamemodify(filepath, ":t")

  vim.system(
    { "sh", "-c", string.format(
      'cd %s && '
      .. 'git add . && '
      .. 'git commit -m "update: %s" --no-gpg-sign -q && '
      .. 'git push',
      vim.fn.shellescape(ZK_ROOT),
      os.date("%Y-%m-%d %H:%M")
    )},
    {},
    function(result)
      vim.schedule(function()
        if result.code == 0 then
          vim.notify("✅ ZK synced: " .. filename, vim.log.levels.INFO)
        else
          vim.notify(
            "❌ ZK sync failed (code " .. result.code .. "): " .. (result.stderr or "unknown"),
            vim.log.levels.ERROR
          )
        end
      end)
    end
  )
end

local zk_group = vim.api.nvim_create_augroup("ZettelkastenAutoSync", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = zk_group,
  pattern = ZK_ROOT .. "/*",
  callback = function(args)
    local filepath = vim.api.nvim_buf_get_name(args.buf)
    if not vim.startswith(filepath, ZK_ROOT) then return end

    if sync_timer then
      sync_timer:stop()
    end
    sync_timer = vim.defer_fn(function()
      do_sync(filepath)
    end, DEBOUNCE_MS)
  end,
  desc = "Auto commit+push Zettelkasten on save",
})
