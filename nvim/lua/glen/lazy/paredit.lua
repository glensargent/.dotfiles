return {
    "julienvincent/nvim-paredit",
    ft = { "clojure", "fennel", "racket", "scheme", "lisp", "janet" },
    config = function()
        require("nvim-paredit").setup()
    end,
}
