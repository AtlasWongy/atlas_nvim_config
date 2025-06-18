local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "<F3>",
    function()
        vim.cmd.RustLsp('renderDiagnostic')
    end,
    { silent = true, buffer=bufnr }
)
