---@meta

--- LuatOS IDE Helper for module: bit64
--- ```yaml
--- Summary: 32位系统上对64位数据的基本算术运算和逻辑运算
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_bit64.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/bit64
--- Video: 
--- Tag: LUAT_USE_BIT64
--- ```
bit64 = {}

--- 64bit数据转成32bit输出
---@param data64bit string 9字节数据
---@return any #1 根据64bit数据输出int或者number
function bit64.to32(data64bit) end

--- 32bit数据转成64bit数据
---@param data32bit number 32bit数据
---@return string #1 9字节数据
function bit64.to64(data32bit) end

--- 64bit数据格式化打印成字符串，用于显示值
---@param a string 需要打印的64bit数据
---@param type number 进制，10=10进制，16=16进制，默认10，只支持10或者16
---@param flag boolean 整形是否按照无符号方式打印，true是，false不是，默认false，浮点忽略
---@return string #1 可以打印的值
function bit64.show(a, type, flag) end

--- 64bit数据加,a+b,a和b中有一个为浮点，则按照浮点运算
---@param a string a
---@param b string|number b
---@param flag1 boolean 整形运算时是否按照无符号方式，true是，false不是，默认false，浮点运算忽略
---@param flag2 boolean 浮点运算结果是否要强制转成整数，true是，false不是，默认false，整形运算忽略
---@return string #1 9字节数据
function bit64.plus(a, b, flag1, flag2) end

--- 64bit数据减,a-b,a和b中有一个为浮点，则按照浮点运算
---@param a string a
---@param b string|number b
---@param flag1 boolean 整形运算时是否按照无符号方式，true是，false不是，默认false，浮点运算忽略
---@param flag2 boolean 浮点运算结果是否要强制转成整数，true是，false不是，默认false，整形运算忽略
---@return string #1 9字节数据
function bit64.minus(a, b, flag1, flag2) end

--- 64bit数据乘,a*b,a和b中有一个为浮点，则按照浮点运算
---@param a string a
---@param b string|number b
---@param flag1 boolean 整形运算时是否按照无符号方式，true是，false不是，默认false，浮点运算忽略
---@param flag2 boolean 浮点运算结果是否要强制转成整数，true是，false不是，默认false，整形运算忽略
---@return string #1 9字节数据
function bit64.multi(a, b, flag1, flag2) end

--- 64bit数据除,a/b,a和b中有一个为浮点，则按照浮点运算
---@param a string a
---@param b string|number b
---@param flag1 boolean 整形运算时是否按照无符号方式，true是，false不是，默认false，浮点运算忽略
---@param flag2 boolean 浮点运算结果是否要强制转成整数，true是，false不是，默认false，整形运算忽略
---@return string #1 9字节数据
function bit64.pide(a, b, flag1, flag2) end

--- 64bit数据位移 a>>b 或者 a<<b
---@param a string a
---@param b number b
---@param flag boolean 位移方向，true左移<<，false右移>>，默认false
---@return string #1 9字节数据
function bit64.shift(a, b, flag) end

--- 将字符串转为LongLong数据
---@param data string 待转换的数据,必须存在
---@param base number 转换进制, 默认10, 可选16或8
---@return string #1 9字节数据
--- ```lua
--- 本API于 2023.10.27 添加
--- 提醒, 如果转换失败, 是返回9个字节的0x00
--- local data = bit64.strtoll("864040064024194", 10)
--- log.info("data", data:toHex())
--- log.info("data", bit64.show(data))
--- ```
function bit64.strtoll(data, base) end
