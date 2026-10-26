---@brief
---
--- https://github.com/astral-sh/ruff
---
--- ruff's built-in language server, used for lint diagnostics and code actions.
--- Formatting stays with conform.nvim (see lua/plugins/functions.lua).
---
--- Prefers the project's own ruff (poetry/uv venv) so diagnostics match CI,
--- falling back to whatever `ruff` is on PATH (mason installs one).

local function project_ruff(root)
  for _, candidate in ipairs({ root .. "/.venv/bin/ruff", root .. "/venv/bin/ruff" }) do
    if vim.fn.executable(candidate) == 1 then
      return candidate
    end
  end
  return "ruff"
end

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local root = config.root_dir or vim.fn.getcwd()
    return vim.lsp.rpc.start({ project_ruff(root), "server" }, dispatchers, { cwd = root })
  end,
  filetypes = { "python" },
  root_markers = { "ruff.toml", ".ruff.toml", "pyproject.toml", ".git" },
  -- pyright owns hover; ruff's is noisy alongside it
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
  settings = {},
}
