return {
    "Olical/conjure",
    ft = { "clojure", "fennel", "racket", "scheme", "lisp", "janet" },
    config = function()
        vim.g["conjure#mapping#doc_word"] = "K"
        vim.g["conjure#log#hud#width"] = 1
        vim.g["conjure#log#hud#enabled"] = false
    end,
}
