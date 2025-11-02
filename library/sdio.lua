---@meta

--- LuatOS IDE Helper for module: sdio
--- ```yaml
--- Summary: sdio
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_sdio.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_SDIO
--- ```
--- ```lua
--- 本sdio库挂载tf卡到文件系统功能已经被fatfs的sdio模式取代
--- 本sdio库仅保留直接读写TF卡的函数
--- 例如 使用 sdio 0 挂载TF卡
--- fatfs.mount(fatfs.SDIO, "/sd", 0)
--- 挂载完成后, 使用 io 库的相关函数来操作就行
--- local f = io.open("/sd/abc.txt")
--- ```
sdio = {}

--- 初始化sdio
---@param id number 通道id,与具体设备有关,通常从0开始,默认0
---@return boolean #1 打开结果
function sdio.init(id) end

--- 直接读写sd卡上的数据
---@param id number sdio总线id
---@param offset number 偏移量,必须是512的倍数
---@param len number 长度,必须是512的倍数
---@return string #1 若读取成功,返回字符串,否则返回nil
--- ```lua
--- 初始化sdio并直接读取sd卡数据
--- sdio.init(0)
--- local t = sdio.sd_read(0, 0, 1024)
--- if t then
--- - xxx
--- end
--- ```
function sdio.sd_read(id, offset, len) end

--- 直接写sd卡
---@param id number sdio总线id
---@param data string 待写入的数据,长度必须是512的倍数
---@param offset number 偏移量,必须是512的倍数
---@return boolean #1 若读取成功,返回true,否则返回false
--- ```lua
--- 初始化sdio并直接读取sd卡数据
--- sdio.init(0)
--- local t = sdio.sd_write(0, data, 0)
--- if t then
--- - xxx
--- end
--- ```
function sdio.sd_write(id, data, offset) end
