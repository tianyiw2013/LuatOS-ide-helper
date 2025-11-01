sfd = {}

--sfd.init(type, spi_id, spi_cs) - 初始化spi flash
--传入值：
--string 类型, 可以是"spi", 也可以是"zbuff", 或者"onchip"
--int SPI总线的id, 或者 zbuff实例
--int SPI FLASH的片选脚对应的GPIO, 当类型是spi时才需要传
--返回值：
--userdata 成功返回一个数据结构,否则返回nil
--例子：
--local drv = sfd.init("spi", 0, 17)
--if drv then
--    log.info("sfd", "chip id", sfd.id(drv):toHex())
--end
---- 2023.01.15之后的固件支持onchip类型, 支持直接读写片上flash的一小块区域,一般是64k
---- 这块区域通常是fdb/fskv库所在的区域, 所以不要混着用
--local onchip = sfd.init("onchip")
--local data = sfd.read(onchip, 0x100, 256)
--sfd.erase(onchip, 0x100)
--sfd.write(onchip, 0x100, data or "Hi")
function sfd.init(type,spi_id,spi_cs) end

--sfd.status(drv) - 检查spi flash状态
--传入值：
--userdata sfd.init返回的数据结构
--返回值：
--int 状态值, 0 未初始化成功,1初始化成功且空闲,2正忙
--例子：
--local drv = sfd.init("spi", 0, 17)
--if drv then
--    log.info("sfd", "status", sfd.status(drv))
--end
function sfd.status(drv) end

--sfd.read(drv, offset, len) - 读取数据
--传入值：
--userdata sfd.init返回的数据结构
--int 起始偏移量
--int 读取长度,当前限制在256以内
--返回值：
--string 数据
--例子：
--local drv = sfd.init("spi", 0, 17)
--if drv then
--    log.info("sfd", "read", sfd.read(drv, 0x100, 256))
--end
function sfd.read(drv,offset,len) end

--sfd.write(drv, offset, data) - 写入数据
--传入值：
--userdata sfd.init返回的数据结构
--int 起始偏移量
--string 需要写入的数据,当前支持256字节及以下
--返回值：
--boolean 成功返回true,失败返回false
--例子：
--local drv = sfd.init("spi", 0, 17)
--if drv then
--    log.info("sfd", "write", sfd.write(drv, 0x100, "hi,luatos"))
--end
function sfd.write(drv,offset,data) end

--sfd.erase(drv, offset) - 擦除数据
--传入值：
--userdata sfd.init返回的数据结构
--int 起始偏移量
--返回值：
--boolean 成功返回true,失败返回false
--例子：
--local drv = sfd.init("spi", 0, 17)
--if drv then
--    log.info("sfd", "write", sfd.erase(drv, 0x100))
--end
function sfd.erase(drv,offset) end

--sfd.id(drv) - 芯片唯一id
--传入值：
--userdata sfd.init返回的数据结构
--返回值：
--string 8字节(64bit)的芯片id
--例子：
--local drv = sfd.init("spi", 0, 17)
--if drv then
--    log.info("sfd", "chip id", sfd.id(drv))
--end
function sfd.id(drv) end