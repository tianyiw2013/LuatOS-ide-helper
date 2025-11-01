hmeta = {}

--hmeta.model() - 获取模组名称
--返回值：
--string 若能识别到,返回模组类型, 否则会是nil
--例子：
--sys.taskInit(function()
--    while 1 do
--        sys.wait(3000)
--        -- hmeta识别底层模组类型的
--        -- 不同的模组可以使用相同的bsp,但根据封装的不同,根据内部数据仍可识别出具体模块
--        log.info("hmeta", hmeta.model())
--        log.info("bsp",   rtos.bsp())
--    end
--end)
function hmeta.model() end

--hmeta.hwver() - 获取模组的硬件版本号
--返回值：
--string 若能识别到,返回模组类型, 否则会是nil
--例子：
--sys.taskInit(function()
--    while 1 do
--        sys.wait(3000)
--        -- hmeta识别底层模组类型的
--        -- 不同的模组可以使用相同的bsp,但根据封装的不同,根据内部数据仍可识别出具体模块
--        log.info("hmeta", hmeta.model(), hmeta.hwver())
--        log.info("bsp",   rtos.bsp())
--    end
--end)
function hmeta.hwver() end

--hmeta.chip() - 获取原始芯片型号
--返回值：
--string 若能识别到,返回芯片类型, 否则会是nil
--例子：
---- 若底层正确实现, 这个函数总会返回值
---- 本函数于 2024.12.5 新增
function hmeta.chip() end