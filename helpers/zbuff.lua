zbuff = {}

--zbuff.create(length,data,type) - 创建zbuff
--传入值：
--int 字节数
--any 可选参数，number时为填充数据，string时为填充字符串
--number 可选参数，内存类型，可选：zbuff.HEAP_SRAM(内部sram,默认) zbuff.HEAP_PSRAM(外部psram) zbuff.HEAP_AUTO(自动申请,如存在psram则在psram进行申请,如不存在或失败则在sram进行申请) 注意:此项与硬件支持有关
--返回值：
--object zbuff对象，如果创建失败会返回nil
--例子：
---- 创建zbuff
--local buff = zbuff.create(1024) -- 空白的
--local buff = zbuff.create(1024, 0x33) --创建一个初值全为0x33的内存区域
--local buff = zbuff.create(1024, "123321456654") -- 创建，并填充一个已有字符串的内容
--
---- 创建framebuff用的zbuff
---- zbuff.create({width,height,bit},data,type)
---- table 宽度、高度、色位深度
--@int 可选参数，填充数据
--@number 可选参数，内存类型，可选：zbuff.HEAP_SRAM(内部sram,默认) zbuff.HEAP_PSRAM(外部psram) zbuff.HEAP_AUTO(自动申请,如存在psram则在psram进行申请,如不存在或失败则在sram进行申请) 注意:此项与硬件支持有关
--@return object zbuff对象，如果创建失败会返回nil
--@usage
---- 创建zbuff
--local buff = zbuff.create({128,160,16})--创建一个128*160的framebuff
--local buff = zbuff.create({128,160,16},0xf800)--创建一个128*160的framebuff，初始状态红色
function zbuff.create(length,data,type) end