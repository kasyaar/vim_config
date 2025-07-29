require("gen").setup({
    --model = "mistral",
    model = "qwen2.5-coder",
    quit_map = "q",
    retry_map = "<c-r>",
    accept_map = "<c-cr>",
    host = "msi",
    port = "11434",
    --display_mode = "float",
    display_mode = "horizontal-split",
    show_prompt = true,
    show_model = true,
    no_auto_close = true,
    file = false,
    hidden = false,
    init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
    command = function(options)
        local body = {model = options.model, stream = true}
        return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
    debug = false
})
