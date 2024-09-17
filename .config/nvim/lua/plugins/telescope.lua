return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {"<leader>ff", require("telescope.builtin").find_files},
        {"<C-p>", require("telescope.builtin").git_files},
        -- requires ripgrep installed
        {"<leader>fs", require("telescope.builtin").live_grep},
    }
}
