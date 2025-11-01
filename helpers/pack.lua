pack = {}

--pack.unpack( string, format, init) - 解包字符串
--传入值：
--string 需解包的字符串
--string 格式化符号
--int 默认值为1，标记解包开始的位置
--返回值：
--int 字符串标记的位置
--any 第一个解包的值, 根据format值,可能有N个返回值
--例子：
--local _,a = pack.unpack(x,">h") --解包成short (2字节)
function pack.unpack(string,format,init) end

--pack.pack( format, val1, val2, val3, valn ) - 打包字符串的值
--传入值：
--string format 格式化符号
--any 第一个需打包的值
--any 第二个需打包的值
--any 第二个需打包的值
--any 第n个需打包的值
--返回值：
--string 一个包含所有格式化变量的字符串
--例子：
--local data = pack.pack('<h', crypto.crc16("MODBUS", val))
--log.info("data", data, data:toHex())
function pack.pack(format,val1,val2,val3,valn) end