-- 🔥 LAVA-CORE public loader
-- FINAL obfuscated core loader

local URL = "https://raw.githubusercontent.com/Noodlesdoodlescuddles/LAVA-CORE/main/src/core.dat"

local ok, core = pcall(function()
    return game:HttpGet(URL)
end)

if not ok then
    warn("[LAVACORE] Failed to download core: " .. tostring(core))
    return
end

if type(core) ~= "string" or #core == 0 then
    warn("[LAVACORE] Downloaded core is empty or invalid.")
    return
end

local chunk, compileError = loadstring(core)

if not chunk then
    warn("[LAVACORE] Core compile failed: " .. tostring(compileError))
    return
end

local runOk, runtimeError = pcall(chunk)

if not runOk then
    warn("[LAVACORE] Core runtime failed: " .. tostring(runtimeError))
    return
end

print("[LAVACORE] FINAL core loaded successfully. 🔥🥔📈")