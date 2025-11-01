touchkey = {}

--touchkey.setup(id, scan_period, window, threshold) - 配置触摸按键
--传入值：
--int 传感器id,请查阅硬件文档, 例如air101/air103支持 1~15, 例如PA7对应touch id=1
--int 扫描间隔,范围1 ~ 0x3F, 单位16ms,可选
--int 扫描窗口,范围2-7, 可选
--int 阀值, 范围0-127, 可选
--返回值：
--bool 成功返回true, 失败返回false
--例子：
--touchkey.setup(1)
--sys.subscribe("TOUCHKEY_INC", function(id, count)
--    -- 传感器id
--    -- 计数器,触摸次数统计
--    log.info("touchkey", id, count)
--end)
function touchkey.setup(id,scan_period,window,threshold) end

--touchkey.close(id) - 关闭初始触摸按键
--传入值：
--int 传感器id,请查阅硬件文档
--返回值：
--nil 无返回值
--例子：
---- 不太可能需要关掉的样子
--touchkey.close(1)
function touchkey.close(id) end