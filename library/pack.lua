---@meta

--- LuatOS IDE Helper for module: pack
--- ```yaml
--- Summary: 打包和解包格式串
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_pack.c
--- Demo: 
--- Video: https://www.bilibili.com/video/BV1Sr4y1n7bP
--- Tag: LUAT_USE_PACK
--- ```
--- ```lua
--- [[
---  '<' 设为小端编码 
---  '>' 设为大端编码 
---  '=' 大小端遵循本地设置 
---  'z' 空字符串,0字节
---  'a' size_t字符串,前4字节表达长度,然后接着是N字节的数据
---  'A' 指定长度字符串, 例如A8, 代表8字节的数据
---  'f' float, 4字节
---  'd' double , 8字节
---  'n' Lua number , 32bit固件4字节, 64bit固件8字节
---  'c' char , 1字节
---  'b' byte = unsigned char  , 1字节
---  'h' short  , 2字节
---  'H' unsigned short  , 2字节
---  'i' int  , 4字节
---  'I' unsigned int , 4字节
---  'l' long , 8字节, 仅64bit固件能正确获取
---  'L' unsigned long , 8字节, 仅64bit固件能正确获取
--- ]]
--- 详细用法请查看demo
--- ```
pack = {}

--- 解包字符串
---@param string string 需解包的字符串
---@param format string 格式化符号
---@param init number 默认值为1，标记解包开始的位置
---@return number #1 字符串标记的位置
---@return any #2 第一个解包的值, 根据format值,可能有N个返回值
--- ```lua
--- local _,a = pack.unpack(x,">h") --解包成short (2字节)
--- ```
function pack.unpack(string, format, init) end

--- 打包字符串的值
---@param format string format 格式化符号
---@param val1 any 第一个需打包的值
---@param val2 any 第二个需打包的值
---@param val3 any 第二个需打包的值
---@param valn any 第n个需打包的值
---@return string #1 一个包含所有格式化变量的字符串
--- ```lua
--- local data = pack.pack('<h', crypto.crc16("MODBUS", val))
--- log.info("data", data, data:toHex())
--- ```
function pack.pack(format, val1, val2, val3, valn) end
