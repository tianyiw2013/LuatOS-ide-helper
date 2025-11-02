---@meta

--- LuatOS IDE Helper for module: sfd
--- ```yaml
--- Summary: SPI FLASH操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/sfd/luat_lib_sfd.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_SFD
--- ```
sfd = {}

--- 初始化spi flash
---@param type string 类型, 可以是"spi", 也可以是"zbuff", 或者"onchip"
---@param spi_id number SPI总线的id, 或者 zbuff实例
---@param spi_cs number SPI FLASH的片选脚对应的GPIO, 当类型是spi时才需要传
---@return userdata #1 成功返回一个数据结构,否则返回nil
--- ```lua
--- local drv = sfd.init("spi", 0, 17)
--- if drv then
---     log.info("sfd", "chip id", sfd.id(drv):toHex())
--- end
--- 2023.01.15之后的固件支持onchip类型, 支持直接读写片上flash的一小块区域,一般是64k
--- 这块区域通常是fdb/fskv库所在的区域, 所以不要混着用
--- local onchip = sfd.init("onchip")
--- local data = sfd.read(onchip, 0x100, 256)
--- sfd.erase(onchip, 0x100)
--- sfd.write(onchip, 0x100, data or "Hi")
--- ```
function sfd.init(type, spi_id, spi_cs) end

--- 检查spi flash状态
---@param drv userdata sfd.init返回的数据结构
---@return number #1 状态值, 0 未初始化成功,1初始化成功且空闲,2正忙
--- ```lua
--- local drv = sfd.init("spi", 0, 17)
--- if drv then
---     log.info("sfd", "status", sfd.status(drv))
--- end
--- ```
function sfd.status(drv) end

--- 读取数据
---@param drv userdata sfd.init返回的数据结构
---@param offset number 起始偏移量
---@param len number 读取长度,当前限制在256以内
---@return string #1 数据
--- ```lua
--- local drv = sfd.init("spi", 0, 17)
--- if drv then
---     log.info("sfd", "read", sfd.read(drv, 0x100, 256))
--- end
--- ```
function sfd.read(drv, offset, len) end

--- 写入数据
---@param drv userdata sfd.init返回的数据结构
---@param offset number 起始偏移量
---@param data string 需要写入的数据,当前支持256字节及以下
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- local drv = sfd.init("spi", 0, 17)
--- if drv then
---     log.info("sfd", "write", sfd.write(drv, 0x100, "hi,luatos"))
--- end
--- ```
function sfd.write(drv, offset, data) end

--- 擦除数据
---@param drv userdata sfd.init返回的数据结构
---@param offset number 起始偏移量
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- local drv = sfd.init("spi", 0, 17)
--- if drv then
---     log.info("sfd", "write", sfd.erase(drv, 0x100))
--- end
--- ```
function sfd.erase(drv, offset) end

--- 芯片唯一id
---@param drv userdata sfd.init返回的数据结构
---@return string #1 8字节(64bit)的芯片id
--- ```lua
--- local drv = sfd.init("spi", 0, 17)
--- if drv then
---     log.info("sfd", "chip id", sfd.id(drv))
--- end
--- ```
function sfd.id(drv) end
