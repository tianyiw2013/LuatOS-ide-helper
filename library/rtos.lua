---@meta

--- LuatOS IDE Helper for module: rtos
--- ```yaml
--- Summary: RTOS底层操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_rtos.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_GPIO
--- ```
rtos = {}

--- 接受并处理底层消息队列.
---@param timeout number 超时时长,通常是-1,永久等待
---@return msgid #1 如果是定时器消息,会返回定时器消息id及附加信息, 其他消息由底层决定,不向lua层进行任何保证.
function rtos.receive(timeout) end

--- 启动一个定时器
---@param id number 定时器id
---@param timeout number 超时时长,单位毫秒
---@param _repeat number 重复次数,默认是0
---@return id #1 如果是定时器消息,会返回定时器消息id及附加信息, 其他消息由底层决定,不向lua层进行任何保证.
--- ```lua
--- 用户代码请使用 sys.timerStart
--- 启动一个3秒的循环定时器
--- rtos.timer_start(10000, 3000, -1)
--- ```
function rtos.timer_start(id, timeout, _repeat) end

--- 关闭并释放一个定时器
---@param id number 定时器id
---@return nil #1 无返回值
--- ```lua
--- 用户代码请使用sys.timerStop
--- rtos.timer_stop(id)
--- ```
function rtos.timer_stop(id) end

--- 设备重启
---@return nil #1 无返回值
function rtos.reboot() end

--- 获取固件编译日期
---@return string #1 固件编译日期
--- ```lua
--- 获取编译日期
--- local d = rtos.buildDate()
--- ```
function rtos.buildDate() end

--- 获取硬件bsp型号
---@return string #1 硬件bsp型号
--- ```lua
--- 获取硬件bsp型号
--- local bsp = rtos.bsp()
--- ```
function rtos.bsp() end

--- 获取固件版本号
---@param more number more 可选参数,默认不传. 传入true时,会额外返回数字版本号
---@return string #1 固件版本号,例如"V0001"
--- ```lua
--- 读取版本号
--- local luatos_version = rtos.version()
--- 读取版本号及数字版本号, 2025.11.1之后的固件支持
--- 如果不是数字固件,luatos_version_num 会是0
--- 如果是不支持的固件, luatos_version_num 会是nil
--- local luatos_version, luatos_version_num = rtos.version(true)
--- 读取底层位数, 32或者64, 2025.12.23 新增
--- local luatos_version, luatos_version_num, luatos_bits = rtos.version(true)
--- ```
function rtos.version(more) end

--- 进入待机模式, 仅部分设备可用, 本API已废弃, 推荐使用pm库
---@param timeout number 休眠时长,单位毫秒
---@return nil #1 无返回值
--- ```lua
--- 进入待机模式
--- rtos.standby(5000)
--- ```
function rtos.standy(timeout) end

--- 获取内存信息
---@param type type "sys"系统内存, "lua"虚拟机内存,"psram"psram内存, 默认为lua虚拟机内存
---@return number #1 总内存大小,单位字节
---@return number #2 当前已使用的内存大小,单位字节
---@return number #3 历史最高已使用的内存大小,单位字节
--- ```lua
--- 打印内存占用
--- log.info("mem.lua", rtos.meminfo())
--- log.info("mem.sys", rtos.meminfo("sys"))
--- ```
function rtos.meminfo(type) end

--- 返回底层描述信息,格式为 LuatOS_$VERSION_$BSP,可用于OTA升级判断底层信息
---@return string #1 底层描述信息
--- ```lua
--- 打印底层描述信息
--- log.info("firmware", rtos.firmware())
--- ```
function rtos.firmware() end

--- 设置自定义lua脚本搜索路径,优先级高于内置路径
---@param pathA string 路径A, 例如 "/sdcard/%s.luac",若不传值,将默认为"",另外,最大长度不能超过23字节
---@param pathB string 路径B, 例如 "/sdcard/%s.lua"
---@param pathC string 路径C, 例如 "/lfs2/%s.luac"
---@param pathD string 路径D, 例如 "/lfs2/%s.lua"
--- ```lua
--- 挂载sd卡或者spiflash后
--- rtos.setPaths("/sdcard/user/%s.luac", "/sdcard/user/%s.lua")
--- require("sd_user_main") -- 将搜索并加载 /sdcard/user/sd_user_main.luac 和 /sdcard/user/sd_user_main.lua
--- ```
function rtos.setPaths(pathA, pathB, pathC, pathD) end

--- 空函数,什么都不做
---@return nil #1 无返回值
--- ```lua
--- 这个函数单纯就是 lua -> c -> lua 走一遍
--- 没有参数,没有返回值,没有逻辑处理
--- 在绝大多数情况下,不会遇到这个函数的调用
--- 它通常只会出现在性能测试的代码里, 因为它什么都不干.
--- rtos.nop()
--- ```
function rtos.nop() end

--- 内存自动收集配置，是lua本身收集机制的一种补充，不是必要的，而且只在luavm空闲时触发
---@param period number 自动收集的周期，等同于receive调用次数，0~60000。如果是0，则关闭自动收集功能，默认是100
---@param warning_level number 内存使用警戒水位线，是总luavm内存量的百分比，50~95，内存达到(>=)警戒线时才会开始判断是否要收集。默认是80
---@param force_level number 内存使用强制收集水位线，是总luavm内存量的百分比，50~95，内存达到(>=)强制收集线时会强制收集。默认是90，必须比警戒水位线大
---@return nil #1 无返回值
--- ```lua
--- rtos.autoCollectMem(100, 80, 90)
--- ```
function rtos.autoCollectMem(period, warning_level, force_level) end
