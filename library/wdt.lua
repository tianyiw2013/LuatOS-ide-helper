---@meta

--- LuatOS IDE Helper for module: wdt
--- ```yaml
--- Summary: watchdog操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_wdt.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/wdt
--- Video: 
--- Tag: LUAT_USE_WDT
--- ```
wdt = {}

--- 初始化watchdog并马上启用.大部分设备的watchdog一旦启用就无法关闭.
---@param timeout number 超时时长,单位为毫秒
---@return boolean #1 成功返回true,否则返回false(例如底层不支持)
--- ```lua
--- wdt.init(9000)
--- sys.timerLoopStart(wdt.feed, 3000)
--- ```
function wdt.init(timeout) end

--- 部分设备支持重新设置watchdog超时时长
---@param timeout number 超时时长,单位为毫秒
---@return boolean #1 成功返回true,否则返回false(例如底层不支持)
--- ```lua
--- wdt.init(10000)
--- sys.timerLoopStart(wdt.feed, 3000)
--- sys.wait(5000)
--- sys.setTimeout(5000)
--- ```
function wdt.setTimeout(timeout) end

--- 喂狗,使得超时计时复位,重新计时
---@return boolean #1 成功返回true,否则返回false(例如底层不支持)
--- ```lua
--- wdt.init(10000)
--- 定时喂狗,或者根据业务按需喂狗
--- sys.timerLoopStart(wdt.feed, 3000)
--- ```
function wdt.feed() end

--- 关闭watchdog,通常不被支持
---@return boolean #1 成功返回true,否则返回false(例如底层不支持)
--- ```lua
--- wdt.init(10000)
--- sys.wait(9000)
--- wdt.close()
--- ```
function wdt.close() end
