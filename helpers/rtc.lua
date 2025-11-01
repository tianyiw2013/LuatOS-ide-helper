rtc = {}

--rtc.set(tab) - 设置时钟
--传入值：
--table or int 时钟参数,见示例
--返回值：
--bool 成功返回true,否则返回nil或false
--例子：
--rtc.set({year=2021,mon=8,day=31,hour=17,min=8,sec=43})
--rtc.set(1652230554)
function rtc.set(tab) end

--rtc.get() - 获取时钟
--返回值：
--table 时钟参数,见示例
--例子：
--local t = rtc.get()
---- {year=2021,mon=8,day=31,hour=17,min=8,sec=43}
--log.info("rtc", json.encode(t))
function rtc.get() end

--rtc.timerStart(id, tab) - 设置RTC唤醒时间
--传入值：
--int 时钟id,通常只支持0
--table 时钟参数,见示例
--返回值：
--bool 成功返回true,否则返回nil或false
--例子：
---- 目前该接口不适用于移芯模块780E/700E/780EP系列，需要定时唤醒可使用pm.dtimerStart()
---- 使用前建议先rtc.set设置为正确的时间
--rtc.timerStart(0, {year=2021,mon=9,day=1,hour=17,min=8,sec=43})
function rtc.timerStart(id,tab) end

--rtc.timerStop(id) - 取消RTC唤醒时间
--传入值：
--int 时钟id,通常只支持0
--返回值：
--bool 成功返回true,否则返回nil或false
--例子：
--rtc.timerStop(0)
function rtc.timerStop(id) end

--rtc.setBaseYear(Base_year) - 设置RTC基准年,不推荐
--传入值：
--int 基准年Base_year,通常1900
--例子：
--rtc.setBaseYear(1900)
function rtc.setBaseYear(Base_year) end

--rtc.timezone(tz) - 读取或设置时区
--传入值：
--int 时区值,注意单位是1/4时区.例如东八区是 32,而非8. 可以不传
--return 当前/设置后的时区值
--例子：
---- 设置为东8区
--rtc.timezone(32)
---- 设置为东3区
--rtc.timezone(12)
---- 设置为西4区
--rtc.timezone(-16)
---- 注意: 无论设置时区是多少, rtc.get/set总是UTC时间
---- 时区影响的是 os.date/os.time 函数
---- 只有部分模块支持设置时区, 且默认值一般为32, 即东八区
function rtc.timezone(tz) end