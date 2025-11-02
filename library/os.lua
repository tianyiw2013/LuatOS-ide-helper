---@meta

--- LuatOS IDE Helper for module: os
--- ```yaml
--- Summary: os操作
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../lua/src/loslib.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/os_date_time
--- Video: 
--- Tag: LUAT_USE_GPIO
--- ```
--- ```lua
--- os模块是lua原生模块, 这份文档是为了方便阐述实际使用中的常见问题
--- ```
os = {}

--- 移除文件
---@param path string 待移除的文件完整路径
---@return boolean #1 成功返回true,其他情况返回nil
---@return string #2 失败时返回原因字符串
--- ```lua
--- 删除根目录下的某个文件
--- os.remove("/1.txt")
--- 注意, 线刷时的文件, 一般在 /luadb 目录, 这个目录下的文件是只读的
--- 也就是无法执行 os.remove("/luadb/xxx.bin")
--- ```
function os.remove(path) end

--- 文件重命名
---@param old_path string 源文件完整路径
---@param new_path string 目标文件完整路径
---@return boolean #1 成功返回true,其他情况返回nil
---@return string #2 失败时返回原因字符串
--- ```lua
--- 注意, 只有在相同文件系统下的文件可以重命名
--- 例如:
--- os.rename("/1.txt", "/2.txt")
--- 不同文件系统, 或者源文件系统是只读的, 则无法执行
--- os.rename("/luadb/1.txt", "/luadb/2.txt")
--- os.rename("/luadb/1.txt", "/2.txt")
--- ```
function os.rename(old_path, new_path) end

--- 日期函数
---@param fmt string 格式化字符串,可以是nil
---@param time table 日期时间的table
---@return table|string #1 根据fmt的不同,返回值不同
--- ```lua
--- 值得注意的几点:
--- 1. 若需要UTC时间, fmt的第一个字符写"!"
--- 2. fmt的格式化遵循 C 函数 strftime, 可以查阅 https://developer.aliyun.com/article/320480
--- 获取本地时间字符串
--- log.info("本地时间字符串", os.date())
--- 获取UTC时间字符串
--- log.info("UTC时间字符串", os.date("!%c"))
--- 格式化本地时间字符串
--- log.info("本地时间字符串", os.date("%Y-%m-%d %H:%M:%S"))
--- 格式化UTC时间字符串
--- log.info("UTC时间字符串", os.date("!%Y-%m-%d %H:%M:%S"))
--- 格式化时间字符串
--- log.info("自定义时间的字符串", os.date("!%Y-%m-%d %H:%M:%S", os.time({year=2000, mon=1, day=1, hour=0, min=0, sec=0})))
--- 获取本地时间的table
--- log.info("本地时间字符串", json.encode(os.date("*t")))
--- 获取UTC时间的table
--- log.info("UTC时间字符串",  json.encode(os.date("!*t")))
--- ```
function os.date(fmt, time) end

--- 时间戳函数
---@param mytime table 日期时间的table
---@return number #1 时间戳
--- ```lua
--- 注意注意, 这个函数返回的是UTC时间戳
--- 时间戳, 但lua下的精度只能到秒
--- log.info("UTC时间戳", os.time())
--- log.info("自定义时间戳", os.time({year=2000, mon=1, day=1, hour=0, min=0, sec=0}))
--- ```
function os.time(mytime) end

--- 时间差值
---@param timeA number 时间A,数值类型
---@param timeB number 时间B,数值类型
---@return number #1 时间差值
function os.difftime(timeA, timeB) end
