-- LAVA-CORE public loader
-- v5.1

local URL = "https://raw.githubusercontent.com/Noodlesdoodlescuddles/LAVA-CORE/main/src/core.dat"

local function decodeBase64(data)
    local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    data = data:gsub("%s+", "")

    local out = {}

    for i = 1, #data, 4 do
        local a = data:sub(i, i)
        local b = data:sub(i + 1, i + 1)
        local c = data:sub(i + 2, i + 2)
        local d = data:sub(i + 3, i + 3)

        local av = alphabet:find(a, 1, true)
        local bv = alphabet:find(b, 1, true)

        if not av or not bv then
            error("Invalid Base64 data")
        end

        av = av - 1
        bv = bv - 1

        local cv = 0
        local dv = 0

        if c ~= "=" and c ~= "" then
            cv = alphabet:find(c, 1, true)
            if not cv then
                error("Invalid Base64 data")
            end
            cv = cv - 1
        end

        if d ~= "=" and d ~= "" then
            dv = alphabet:find(d, 1, true)
            if not dv then
                error("Invalid Base64 data")
            end
            dv = dv - 1
        end

        local byte1 = av * 4 + math.floor(bv / 16)
        out[#out + 1] = string.char(byte1)

        if c ~= "=" and c ~= "" then
            local byte2 = (bv % 16) * 16 + math.floor(cv / 4)
            out[#out + 1] = string.char(byte2)
        end

        if d ~= "=" and d ~= "" then
            local byte3 = (cv % 4) * 64 + dv
            out[#out + 1] = string.char(byte3)
        end
    end

    return table.concat(out)
end

local ok, encoded = pcall(function()
    return game:HttpGet(URL)
end)

if not ok then
    warn("[LAVACORE] Failed to download core: " .. tostring(encoded))
    return
end

local decodeOk, source = pcall(function()
    return decodeBase64(encoded)
end)

if not decodeOk then
    warn("[LAVACORE] Base64 decode failed: " .. tostring(source))
    return
end

local chunk, compileError = loadstring(source)

if not chunk then
    warn("[LAVACORE] Core compile failed: " .. tostring(compileError))
    return
end

local runOk, runtimeError = pcall(chunk)

if not runOk then
    warn("[LAVACORE] Core runtime failed: " .. tostring(runtimeError))
    return
end

print("[LAVACORE] v5.1 loaded successfully.")
