-- JDTLS (Java LSP) configuration
local home = vim.env.HOME
local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name

local system_os = ""
if vim.fn.has("mac") == 1 then
    system_os = "mac"
elseif vim.fn.has("unix") == 1 then
    system_os = "linux"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    system_os = "win"
else
    print("OS not found, defaulting to 'linux'")
    system_os = "linux"
end

-- Needed for debugging
local bundles = {
    vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

-- Add more bundles for unit testing if needed
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
        "-Xmx4g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
        "-configuration",
        home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
        "-data",
        workspace_dir,
    },

    root_dir = require('jdtls.setup').find_root({ 'pom.xml', '.git' }),

    settings = {
        java = {
            home = "/usr/lib/jvm/java-24-openjdk",
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "/usr/lib/jvm/java-21-openjdk",
                    },
                    {
                        name = "JavaSE-24",
                        path = "/usr/lib/jvm/java-24-openjdk",
                    },
                },
            },
            maven = {
                downloadSources = true,
            },
            format = {
                enabled = true,
                settings = {
                    -- Configurare stil cu 4 spații
                    indentation = {
                        spaces = 4,  -- 4 spații pentru indentare
                    },
                },
            },
        },
    },

    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    flags = {
        allow_incremental_sync = true,
    },
    init_options = {
        bundles = bundles,
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
    },
}

-- Autocompletare și formatare la salvare
config["on_attach"] = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider or client.name == "jdtls" then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end

    -- Debugging setup
    jdtls.setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
end

jdtls.start_or_attach(config)

