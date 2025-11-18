require("codecompanion").setup({
    strategies = {
        chat = {
            adapter = "codex",
        },
        inline = {
            adapter = "devstral",
        },
        cmd = {
            adapter = "gemma3",
        }
    },
    opts = {
        log_level = "DEBUG",
    },
    adapters = {
        http = {
            xai = function()
                return require("codecompanion.adapters").extend("xai", {
                    env = {
                        api_key = "cmd:yad --title='Enter Password' --entry --hide-text|keepassxc-cli show -q -a xai  ~/Sync/kasyaar.kdbx llm_api_keys"
                    },
                    schema = {
                        model = {
                            default = "grok-3-mini",
                        },
                    },
                })
            end,
            openai = function()
                return require("codecompanion.adapters").extend("openai", {
                    env = {
                        api_key =  "cmd:yad --title='Enter Password' --entry --hide-text|keepassxc-cli show -q -a openai  ~/Sync/kasyaar.kdbx llm_api_keys",
                    },
                    schema = {
                        model = {
                            default = "gpt-4.1-nano",
                        },
                    },
                })
            end,
            devstral = function()
                return require("codecompanion.adapters").extend("ollama", {
                    name = "devstral",
                    env = {
                        url = "http://192.168.5.175:11434",
                    },
                    opts = {
                        stream = true,
                    },
                    schema = {
                        model = {
                            default = "devstral:latest",
                        },
                    },
                })
            end,
            qwen25_coder = function()
                return require("codecompanion.adapters").extend("ollama", {
                    name = "qwen-coder",
                    env = {
                        url = "http://192.168.5.175:11434",
                    },
                    opts = {
                        stream = true,
                    },
                    schema = {
                        model = {
                            default = "qwen2.5-coder:latest",
                        },
                    },
                })
            end,
            gemma3 = function()
                return require("codecompanion.adapters").extend("ollama", {
                    name = "gemma3",
                    env = {
                        url = "http://192.168.5.175:11434",
                    },
                    opts = {
                        stream = true,
                    },
                    schema = {
                        model = {
                            default = "gemma3:12b",
                        },
                    },
                })
            end,
            gemini = function()
                return require("codecompanion.adapters").extend("gemini", {
                    name = "Gemini 2.5 Flash Lite",
                    env = {
                        api_key =  "cmd:yad --title='Enter Password' --entry --hide-text|keepassxc-cli show -q -a geminiwrk  ~/Sync/kasyaar.kdbx llm_api_keys",
                    },
                    schema = {
                        model = {
                            default = "gemini-2.5-flash-lite",
                        },
                    },
                })
            end,
        },
        acp = {
            codex = function()
                return require("codecompanion.adapters").extend("codex", {
                    defaults = {
                        auth_method = "openai-api-key", -- "openai-api-key"|"codex-api-key"|"chatgpt"
                    },
                    env = {
                        OPENAI_API_KEY = "cmd:yad --title='Enter Password' --entry --hide-text|keepassxc-cli show -q -a openai  ~/Sync/kasyaar.kdbx llm_api_keys",
                    },
                })
            end,
            gemini_cli = function()
                return require("codecompanion.adapters").extend("gemini_cli", {
                    defaults = {
                        auth_method = "gemini-api-key", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
                    },
                    env = {
                        GEMINI_API_KEY = "cmd:yad --title='Enter Password' --entry --hide-text|keepassxc-cli show -q -a geminiwrk  ~/Sync/kasyaar.kdbx llm_api_keys",
                    },
                })
            end,
        },
    },
})
