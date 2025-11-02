---@meta

--- LuatOS IDE Helper for module: zlib
--- ```yaml
--- Summary: zlib压缩/解压缩(已废弃)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/zlib/luat_lib_zlib.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_ZLIB
--- ```
--- ```lua
--- 这个库已经废弃了, 请使用miniz或者fastlz库
--- ```
zlib = {}

--- zlib压缩(需要大约270k内存，大部分mcu不支持)
---@param input_file string input_file  输入文件
---@param output_file string output_file 输出文件
---@return boolean #1 正常返回 ture  失败返回 false
--- ```lua
--- zlib.c("/sd/1.txt","/sd/zlib")
--- ```
function zlib.c(input_file, output_file) end

--- zlib解压缩(需要大约18k内存，大部分mcu都支持)
---@param input_file string input_file  输入文件
---@param output_file string output_file 输出文件
---@return boolean #1 正常返回 ture  失败返回 false
--- ```lua
--- zlib.d("/sd/zlib","/sd/1.txt")
--- ```
function zlib.d(input_file, output_file) end
