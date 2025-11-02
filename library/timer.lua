---@meta

--- LuatOS IDE Helper for module: timer
--- ```yaml
--- Summary: 操作底层定时器
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_timer.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_TIMER
--- ```
--- ```lua
--- 本库通常不需要使用, 除非你很清楚会发生什么
--- ```
timer = {}

--- 硬阻塞指定时长
---@param timeout number 阻塞时长,单位ms, 最高1024ms, 实际使用强烈建议不要超过200ms
---@return nil #1 无返回值
--- ```lua
--- 期间没有任何luat代码会执行,包括底层消息处理机制
--- 本方法通常不会使用,除非你很清楚会发生什么
--- timer.mdelay(10)
--- ```
function timer.mdelay(timeout) end

--- 硬阻塞指定时长但us级别,不会很精准
---@param timeout number 阻塞时长,单位us, 最大3000us
---@return nil #1 无返回值
--- ```lua
--- 本方法通常不会使用,除非你很清楚会发生什么
--- 本API在 2023.05.18 添加
--- timer.udelay(10)
--- 实际阻塞时长是有波动的
--- ```
function timer.udelay(timeout) end
