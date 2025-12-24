---@meta

--- LuatOS IDE Helper for module: statem
--- ```yaml
--- Summary: SM状态机
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/statem/luat_lib_statem.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/statem
--- Video: 
--- Tag: LUAT_USE_STATEM
--- ```
statem = {}

--- 创建一个新的状态机.
---@param count number 指令条数,默认32条
---@param repeats number 重复执行的次数, 0 代表不重复, 正整数代表具体重复执行的次数. 暂不支持永续执行
---@return some #1 若成功,返回状态机指针,否则返回nil
--- ```lua
--- gpio.setup(7, 0, gpio.PULLUP)
--- gpio.setup(12, 0, gpio.PULLUP)
--- gpio.setup(13, 0, gpio.PULLUP)
--- gpio.setup(14, 0, gpio.PULLUP)
--- local sm =  statem.create()
---             :gpio_set(7, 0) -- gpio设置为低电平
---             :usleep(10)     -- 休眠10us
---             :gpio_set(7, 1) -- gpio设置为高电平
---             :usleep(40)     -- 休眠40us
---             :gpio_set(12, 1) -- gpio设置为高电平
---             :gpio_set(13, 1) -- gpio设置为高电平
---             :gpio_set(14, 1) -- gpio设置为高电平
---             :usleep(40)      -- 休眠40us
---             :gpio_set(7, 0) -- gpio设置为低电平
---             :finish()
--- 执行之,后续会支持后台执行
--- sm:exec()
--- ```
function statem.create(count, repeats) end
