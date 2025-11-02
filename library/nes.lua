---@meta

--- LuatOS IDE Helper for module: nes
--- ```yaml
--- Summary: nes模拟器
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/nes/luat_lib_nes.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_NES
--- ```
nes = {}

--- nes模拟器初始化
---@param file_path string file_path 文件路径
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- nes.init("/luadb/super_mario.nes")
--- ```
function nes.init(file_path) end

--- nes模拟器初始化
---@param key number key 按键
---@param val number val 状态 1按下 0抬起
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- nes.init("/luadb/super_mario.nes")
--- ```
function nes.key(key, val) end
