---@meta

--- LuatOS IDE Helper for module: hmeta
--- ```yaml
--- Summary: 硬件元数据
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/hmeta/luat_lib_hmeta.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/hmeta
--- Video: 
--- Tag: LUAT_USE_HMETA
--- ```
--- ```lua
--- 本库开发中
--- [[
---     这个库的作用是展示当前硬件的能力, 例如:
--- 1. 有多少GPIO, 各GPIO默认模式是什么, 是否支持上拉/下拉
--- 2. 有多少I2C,支持哪些速率
--- 3. 有多少SPI,支持哪些速率和模式
--- 4. 扩展属性, 例如区分Air780E和Air600E
--- ]]
--- ```
hmeta = {}

--- 获取模组名称
---@return string #1 若能识别到,返回模组类型, 否则会是nil
--- ```lua
--- sys.taskInit(function()
---     while 1 do
---         sys.wait(3000)
--- hmeta识别底层模组类型的
--- 不同的模组可以使用相同的bsp,但根据封装的不同,根据内部数据仍可识别出具体模块
---         log.info("hmeta", hmeta.model())
---         log.info("bsp",   rtos.bsp())
---     end
--- end)
--- ```
function hmeta.model() end

--- 获取模组的硬件版本号
---@return string #1 若能识别到,返回模组类型, 否则会是nil
--- ```lua
--- sys.taskInit(function()
---     while 1 do
---         sys.wait(3000)
--- hmeta识别底层模组类型的
--- 不同的模组可以使用相同的bsp,但根据封装的不同,根据内部数据仍可识别出具体模块
---         log.info("hmeta", hmeta.model(), hmeta.hwver())
---         log.info("bsp",   rtos.bsp())
---     end
--- end)
--- ```
function hmeta.hwver() end

--- 获取原始芯片型号
---@return string #1 若能识别到,返回芯片类型, 否则会是nil
--- ```lua
--- 若底层正确实现, 这个函数总会返回值
--- 本函数于 2024.12.5 新增
--- ```
function hmeta.chip() end
