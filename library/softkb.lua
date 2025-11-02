---@meta

--- LuatOS IDE Helper for module: softkb
--- ```yaml
--- Summary: 软件键盘矩阵
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/soft_keyboard/luat_lib_softkeyboard.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_SOFTKB
--- ```
softkb = {}

--- 初始化软件键盘矩阵
---@param port number 预留, 当前填0
---@param key_in table 矩阵输入按键表
---@param key_out table 矩阵输出按键表
--- ```lua
--- key_in = {pin.PD10,pin.PE00,pin.PE01,pin.PE02}
---     key_out = {pin.PD12,pin.PD13,pin.PD14,pin.PD15}
---     softkb.init(0,key_in,key_out)
--- sys.subscribe("SOFT_KB_INC", function(port, data, state)
--- port 当前固定为0, 可以无视
--- data, 需要配合init的map进行解析
--- state, 1 为按下, 0 为 释放
--- TODO 详细介绍
--- end)
--- ```
function softkb.init(port, key_in, key_out) end

--- 删除软件键盘矩阵
---@param port number 预留, 当前填0
--- ```lua
--- softkb.deinit(0)
--- ```
function softkb.deinit(port) end
