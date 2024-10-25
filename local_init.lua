vim.cmd([[
colorscheme monochrome
]])
--require('mason').setup()

--[[local llm = require('llm')
llm.setup({
    backend = "ollama",
    model = "starcoder2:3b",
    tokenizer = nil,
    url = "http://localhost:11434",
    fim = {
        enabled = true,
        prefix = "<fim_prefix>",
        middle = "<fim_middle>",
        suffix = "<fim_suffix>",
    },
    request_body = {
        options = {
            temperature = 0.2,
            top_p = 0.95,
        }
    },
    lsp = {
        bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls.cmd",
    
    }
})]]
