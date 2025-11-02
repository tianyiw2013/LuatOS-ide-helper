---@meta

--- LuatOS IDE Helper for module: dac
--- ```yaml
--- Summary: 数模转换
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_dac.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/multimedia
--- Video: 
--- Tag: LUAT_USE_DAC
--- ```
dac = {}

--- 打开DAC通道,并配置参数
---@param ch number 通道编号,例如0
---@param freq number 输出频率,单位hz
---@param mode number 模式,默认为0,预留
---@return true #1 成功返回true,否则返回false
---@return number #2 底层返回值,调试用
--- ```lua
--- if dac.open(0, 44000) then
---     log.info("dac", "dac ch0 is opened")
--- end
--- ```
function dac.open(ch, freq, mode) end

--- 从指定DAC通道输出一段波形,或者单个值
---@param ch number 通道编号,例如0
---@param data string 若输出固定值,可以填数值, 若输出波形,填string
---@return true #1 成功返回true,否则返回false
---@return number #2 底层返回值,调试用
--- ```lua
--- if dac.open(0, 44000) then
---     log.info("dac", "dac ch0 is opened")
---     dac.write(0, string.fromHex("ABCDABCD"))
--- end
--- dac.close(0)
--- ```
function dac.write(ch, data) end

--- 关闭DAC通道
---@param ch number 通道编号,例如0
---@return true #1 成功返回true,否则返回false
---@return number #2 底层返回值,调试用
--- ```lua
--- if dac.open(0, 44000) then
---     log.info("dac", "dac ch0 is opened")
---     dac.write(0, string.fromHex("ABCDABCD"))
--- end
--- dac.close(0)
--- ```
function dac.close(ch) end
