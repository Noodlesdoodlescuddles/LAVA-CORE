-- 🔥 LAVA-CORE public loader
-- v5.2

local URL = "https://raw.githubusercontent.com/Noodlesdoodlescuddles/LAVA-CORE/main/src/core.dat"

local ok, core = pcall(function()
    return game:HttpGet(URL)
end)

if not ok then
    warn("[LAVACORE] Failed to download v5.2 core: " .. tostring(core))
    return
end

if type(core) ~= "string" or #core == 0 then
    warn("[LAVACORE] Downloaded core is empty or invalid.")
    return
end

local chunk, compileError = loadstring(core)

if not chunk then
    warn("[LAVACORE] v5.2 core compile failed: " .. tostring(compileError))
    return
end

local runOk, runtimeError = pcall(chunk)

if not runOk then
    warn("[LAVACORE] v5.2 core runtime failed: " .. tostring(runtimeError))
    return
end

print("[LAVACORE] v5.2 loaded successfully. 🥔📈")
