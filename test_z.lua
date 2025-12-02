local function dispMat(mat)
    -- local mat=qr("当左/右/下(软降)被按下并且那个方向顶住了墙，会在旋转时添加一个额外偏移（三个键朝各自方向加1格），和基础踢墙表叠加（额外偏移和叠加偏移的水平方向不能相反，且叠加偏移的位移大小不能超过√5）。如果失败，会取消向左右的偏移然后重试，还不行就取消向下的偏移\nBiRS相比XRS只使用一个踢墙表更容易记忆，并且保留了SRS翻越地形的功能")
    local size = #mat
    print(string.rep("##", size + 2))
    for y = 1, #mat do
        local line = "##"
        for x = 1, #mat do
            if mat[x][y] == -2 then
                line = line .. "##"
            elseif mat[x][y] == -1 then
                line = line .. "#X"
            elseif mat[x][y] == 1 then
                line = line .. " ."
            elseif mat[x][y] == 2 then
                line = line .. "  "
            else
                line = line .. "??"
            end
        end
        print(line .. "##")
    end
    print(string.rep("##", size + 2), "Size:" .. size)
end

-- dispMat(select(2,require"qrencode".qrcode("TESTSTRING",3)))
-- dispMat(require"qr"("TESTSTRING",3))
-- dispMat(require("qr")("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"))
-- do return end

local encodeOld = require "qrencode".qrcode
local encodeNew = require "qr"
local function checkMatEqual(a, b)
    for y = 1, #a do for x = 1, #a[y] do if a[y][x] ~= b[y][x] then return end end end
    return true
end

local N = 10
local tests = {
    "你好再见天气不错",
    "lua.org",
    "0123456789",
    "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ",
}
math.randomseed(os.time())
for l = 10, 40, 10 do
    local buffer = ""
    for _ = 1, l do buffer = buffer .. math.random(1e10, 1e11 - 1) end
    table.insert(tests, buffer)
end
for l = 100, 300, 100 do
    local buffer = ""
    for _ = 1, l do
        buffer = buffer ..
            string.char(math.random(48, 57)) ..
            string.char(math.random(65, 90)) ..
            string.char(math.random(97, 122))
    end
    table.insert(tests, buffer)
end

local oldTotalTime, newTotalTime = 0, 0
for i = 1, #tests do
    local testStr = tests[i]
    print(testStr)
    for ec = 1, 4 do
        local _, matOld = encodeOld(testStr, ec)
        local matNew = encodeNew(testStr, ec)
        if not checkMatEqual(matOld, matNew) then
            dispMat(matOld)
            dispMat(matNew)
            print("QRcode mismatch! " .. testStr .. " EC=" .. ec)
            os.exit()
        end
        local size = #matNew

        local t = os.clock()
        collectgarbage()
        for _ = 1, N do encodeOld(testStr, ec) end
        local dtOld = os.clock() - t
        t = os.clock()
        collectgarbage()
        for _ = 1, N do encodeNew(testStr, ec) end
        local dtNew = os.clock() - t
        oldTotalTime = oldTotalTime + dtOld
        newTotalTime = newTotalTime + dtNew
        print(string.format("EC %d: %.3fs -> %.3fs, %.2fx Speed, size=%d", ec, dtOld, dtNew, dtOld / dtNew, size))
    end
end
print(string.format("Total: %.2fs -> %.2fs, %.3fx Speed", oldTotalTime, newTotalTime, oldTotalTime / newTotalTime))
