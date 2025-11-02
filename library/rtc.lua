---@meta

--- LuatOS IDE Helper for module: rtc
--- ```yaml
--- Summary: 实时时钟
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_rtc.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/rtc
--- Video: 
--- Tag: LUAT_USE_RTC
--- ```
rtc = {}

--- 设置时钟
---@param val table|number 时钟参数,见示例
---@return boolean #1 成功返回true,否则返回nil或false
--- ```lua
--- rtc.set({year=2021,mon=8,day=31,hour=17,min=8,sec=43})
--- rtc.set(1652230554)
--- ```
function rtc.set(val) end

--- 获取时钟
---@return table #1 时钟参数,见示例
--- ```lua
--- local t = rtc.get()
--- {year=2021,mon=8,day=31,hour=17,min=8,sec=43}
--- log.info("rtc", json.encode(t))
--- ```
function rtc.get() end

--- 设置RTC唤醒时间
---@param id number 时钟id,通常只支持0
---@param tab table 时钟参数,见示例
---@return boolean #1 成功返回true,否则返回nil或false
--- ```lua
--- 目前该接口不适用于移芯模块780E/700E/780EP系列，需要定时唤醒可使用pm.dtimerStart()
--- 使用前建议先rtc.set设置为正确的时间
--- rtc.timerStart(0, {year=2021,mon=9,day=1,hour=17,min=8,sec=43})
--- ```
function rtc.timerStart(id, tab) end

--- 取消RTC唤醒时间
---@param id number 时钟id,通常只支持0
---@return boolean #1 成功返回true,否则返回nil或false
--- ```lua
--- rtc.timerStop(0)
--- ```
function rtc.timerStop(id) end

--- 读取或设置时区
---@param tz number 时区值,注意单位是1/4时区.例如东八区是 32,而非8. 可以不传
---@return number #1 当前/设置后的时区值
--- ```lua
--- 设置为东8区
--- rtc.timezone(32)
--- 设置为东3区
--- rtc.timezone(12)
--- 设置为西4区
--- rtc.timezone(-16)
--- 注意: 无论设置时区是多少, rtc.get/set总是UTC时间
--- 时区影响的是 os.date/os.time 函数
--- 只有部分模块支持设置时区, 且默认值一般为32, 即东八区
--- ```
function rtc.timezone(tz) end
