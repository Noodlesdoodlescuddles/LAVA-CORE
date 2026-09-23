-- LAVA-CORE public loader
-- v5.1

local URL = "https://raw.githubusercontent.com/Noodlesdoodlescuddles/LAVA-CORE/main/src/core.dat"

local function decodeBase64(data)
    local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    data = data:gsub("[^" .. alphabet .. "=]", "")
    local out = {}
    local buffer, bits = 0, 0

    for i = 1, #data do
        local c = data:sub(i, i)

        if c ~= "=" then
            local value = alphabet:find(c, 1, true) - 1
            buffer = buffer * 64 + value
            bits = bits + 6

            if bits >= 8 then
                bits = bits - 8
                local byte = math.floor(buffer / 2^bits) % 256
                out[#out + 1] = string.char(byte)
            end
        end
    end

    return table.concat(out)
end

local ok, encoded = pcall(function()
    return game:HttpGet(URL)
end)

if not ok then
    warn("[LAVACORE] Failed to download core.")
    return
end

local source = decodeBase64(encoded)
local chunk, compileError = loadstring(source)

if not chunk then
    warn("[LAVACORE] Core compile failed: " .. tostring(compileError))
    return
end

local runOk, runtimeError = pcall(chunk)

if not runOk then
    warn("[LAVACORE] Core runtime failed: " .. tostring(runtimeError))
end
