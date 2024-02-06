local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    return
end

treesitter.setup({
    highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = { "latex", "markdown" },
    },
    indent = { enable = true },
    autotag = { enable = true },
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "c",
        "java",
        "html",
        "python",
        "markdown_inline",
        "sql",
        "gitignore"
    },
    auto_install = true,
})

