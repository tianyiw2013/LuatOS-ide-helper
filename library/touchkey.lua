---@meta

--- LuatOS IDE Helper for module: touchkey
--- ```yaml
--- Summary: 触摸按键
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_touchkey.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_TOUCHKEY
--- ```
touchkey = {}

--- 配置触摸按键
---@param id number 传感器id,请查阅硬件文档, 例如air101/air103支持 1~15, 例如PA7对应touch id=1
---@param scan_period number 扫描间隔,范围1 ~ 0x3F, 单位16ms,可选
---@param window number 扫描窗口,范围2-7, 可选
---@param threshold number 阀值, 范围0-127, 可选
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- touchkey.setup(1)
--- sys.subscribe("TOUCHKEY_INC", function(id, count)
--- 传感器id
--- 计数器,触摸次数统计
---     log.info("touchkey", id, count)
--- end)
--- ```
function touchkey.setup(id, scan_period, window, threshold) end

--- 关闭初始触摸按键
---@param id number 传感器id,请查阅硬件文档
---@return nil #1 无返回值
--- ```lua
--- 不太可能需要关掉的样子
--- touchkey.close(1)
--- ```
function touchkey.close(id) end
