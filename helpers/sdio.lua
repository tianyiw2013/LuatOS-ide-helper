sdio = {}

--sdio.init(id) - 初始化sdio
--传入值：
--int 通道id,与具体设备有关,通常从0开始,默认0
--返回值：
--boolean 打开结果
function sdio.init(id) end

--sdio.sd_read(id, offset, len) - 直接读写sd卡上的数据
--传入值：
--int sdio总线id
--int 偏移量,必须是512的倍数
--int 长度,必须是512的倍数
--返回值：
--string 若读取成功,返回字符串,否则返回nil
--例子：
---- 初始化sdio并直接读取sd卡数据
--sdio.init(0)
--local t = sdio.sd_read(0, 0, 1024)
--if t then
--    --- xxx
--end
function sdio.sd_read(id,offset,len) end

--sdio.sd_write(id, data, offset) - 直接写sd卡
--传入值：
--int sdio总线id
--string 待写入的数据,长度必须是512的倍数
--int 偏移量,必须是512的倍数
--返回值：
--bool 若读取成功,返回true,否则返回false
--例子：
---- 初始化sdio并直接读取sd卡数据
--sdio.init(0)
--local t = sdio.sd_write(0, data, 0)
--if t then
--    --- xxx
--end
function sdio.sd_write(id,data,offset) end