---@meta

--- LuatOS IDE Helper for module: max30102
--- ```yaml
--- Summary: 心率模块(MAX30102)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/max30102/luat_lib_max30102.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_MAX30102
--- ```
max30102 = {}

--- 初始化MAX30102传感器
---@param i2c_id number 传感器所在的i2c总线id,默认为0
---@param int number int引脚
---@return boolean #1 成功返回true, 否则返回nil或者false
--- ```lua
--- if max30102.init(0,25) then
---     log.info("max30102", "init ok")
--- else
---     log.info("max30102", "init fail")
--- end
--- ```
function max30102.init(i2c_id, int) end

--- 获取心率血氧(大概需要10s时间测量)
---@return boolean #1 成功返回true, 否则返回nil或者false
---@return number #2 心率
---@return number #3 血氧
function max30102.get() end

--- 关闭max30102
function max30102.shutdown() end
