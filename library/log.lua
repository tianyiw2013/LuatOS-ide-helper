---@meta

--- LuatOS IDE Helper for module: log
--- ```yaml
--- Summary: 日志库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_log.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_GPIO
--- ```
log = {}

--- 无日志模式 (number)
log.LOG_SILENT = 0

--- debug日志模式 (number)
log.LOG_DEBUG = 0

--- info日志模式 (number)
log.LOG_INFO = 0

--- warning日志模式 (number)
log.LOG_WARN = 0

--- error日志模式 (number)
log.LOG_ERROR = 0

--- 设置日志级别
---@param level string level 日志级别,可用字符串或数值, 字符串为(SILENT,DEBUG,INFO,WARN,ERROR,FATAL), 数值为(0,1,2,3,4,5)
---@return nil #1 无返回值
--- ```lua
--- 设置日志级别为INFO
--- log.setLevel("INFO")
--- ```
function log.setLevel(level) end

--- 设置日志风格
---@param val number 日志风格,默认为0, 不传就是获取当前值
---@return number #1 当前的日志风格
--- ```lua
--- 以 log.info("ABC", "DEF", 123) 为例, 假设该代码位于main.lua的12行
--- 默认日志0
--- I/user.ABC DEF 123
--- 调试风格1, 添加额外的调试信息
--- I/main.lua:12 ABC DEF 123
--- 调试风格2, 添加额外的调试信息, 位置有所区别
--- I/user.ABC main.lua:12 DEF 123
--- log.style(0) -- 默认风格0
--- log.style(1) -- 调试风格1
--- log.style(2) -- 调试风格2
--- ```
function log.style(val) end

--- 获取日志级别
---@return number #1 日志级别对应0,1,2,3,4,5
--- ```lua
--- 得到日志级别
--- log.getLevel()
--- ```
function log.getLevel() end

--- 输出日志,级别debug
---@param tag string tag         日志标识,必须是字符串
---@param val ... 需打印的参数
---@param val2 any 
---@param val3 any 
---@return nil #1 无返回值
--- ```lua
--- 日志输出 D/onenet connect ok
--- log.debug("onenet", "connect ok")
--- ```
function log.debug(tag, val, val2, val3) end

--- 输出日志,级别info
---@param tag string tag         日志标识,必须是字符串
---@param val ... 需打印的参数
---@param val2 any 
---@param val3 any 
---@return nil #1 无返回值
--- ```lua
--- 日志输出 I/onenet connect ok
--- log.info("onenet", "connect ok")
--- ```
function log.info(tag, val, val2, val3) end

--- 输出日志,级别warn
---@param tag string tag         日志标识,必须是字符串
---@param val ... 需打印的参数
---@param val2 any 
---@param val3 any 
---@return nil #1 无返回值
--- ```lua
--- 日志输出 W/onenet connect ok
--- log.warn("onenet", "connect ok")
--- ```
function log.warn(tag, val, val2, val3) end

--- 输出日志,级别error
---@param tag string tag         日志标识,必须是字符串
---@param val ... 需打印的参数
---@param val2 any 
---@param val3 any 
---@return nil #1 无返回值
--- ```lua
--- 日志输出 E/onenet connect ok
--- log.error("onenet", "connect ok")
--- ```
function log.error(tag, val, val2, val3) end
