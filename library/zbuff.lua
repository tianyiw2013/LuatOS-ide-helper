---@meta

--- LuatOS IDE Helper for module: zbuff
--- ```yaml
--- Summary: c内存数据操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_zbuff.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/zbuff
--- Video: https://www.bilibili.com/video/BV1gr4y1V7HN
--- Tag: LUAT_USE_ZBUFF
--- ```
zbuff = {}
buff = {}

--- 以头为基点 (number)
zbuff.SEEK_SET = 0

--- 以当前位置为基点 (number)
zbuff.SEEK_CUR = 0

--- 以末尾为基点 (number)
zbuff.SEEK_END = 0

--- 自动申请(如存在psram则在psram进行申请,如不存在或失败则在sram进行申请) (number)
zbuff.HEAP_AUTO = 0

--- 在sram申请 (number)
zbuff.HEAP_SRAM = 0

--- 在psram申请 (number)
zbuff.HEAP_PSRAM = 0

--- 创建zbuff
---@param length number 字节数
---@param data any 可选参数，number时为填充数据，string时为填充字符串
---@param type number 可选参数，内存类型默认自动选择
---@return object #1 zbuff对象，如果创建失败会返回nil
--- ```lua
--- 创建zbuff
--- local buff = zbuff.create(1024) -- 空白的
--- local buff = zbuff.create(1024, 0x33) --创建一个初值全为0x33的内存区域
--- local buff = zbuff.create(1024, "123321456654") -- 创建，并填充一个已有字符串的内容
--- 创建framebuff用的zbuff
--- zbuff.create({width,height,bit},data,type)
--- table 宽度、高度、色位深度
--- @int 可选参数，填充数据
--- @number 可选参数，内存类型
--- @return object zbuff对象，如果创建失败会返回nil
--- @usage
--- 创建zbuff
--- local buff = zbuff.create({128,160,16})--创建一个128*160的framebuff
--- local buff = zbuff.create({128,160,16},0xf800)--创建一个128*160的framebuff，初始状态红色
--- ```
function zbuff.create(length, data, type) end

--- zbuff写数据（从当前指针位置开始；执行后指针会向后移动）
---@param para any 写入buff的数据，string时为一个参数，number时可为多个参数
---@return number #1 数据成功写入的长度
--- ```lua
--- 类file的读写操作
--- local len = buff:write("123") -- 写入数据, 指针相应地往后移动，返回写入的数据长度
--- local len = buff:write(0x1a,0x30,0x31,0x32,0x00,0x01)  -- 按数值写入多个字节数据
--- ```
function buff:write(para) end

--- zbuff读数据（从当前指针位置开始；执行后指针会向后移动）
---@param length number 读取buff中的字节数
---@return string #1 读取结果
--- ```lua
--- 类file的读写操作
--- local str = buff:read(3)
--- ```
function buff:read(length) end

--- zbuff清空数据（与当前指针位置无关；执行后指针位置不变）
---@param num number 可选，默认为0。要设置为的值，不会改变buff指针位置
--- ```lua
--- 全部初始化为0
--- buff:clear(0)
--- ```
function buff:clear(num) end

--- zbuff设置光标位置（可能与当前指针位置有关；执行后指针会被设置到指定位置）
---@param offset number 偏移长度
---@param base number where, 基点，默认zbuff.SEEK_SET。zbuff.SEEK_SET: 基点为 0 （文件开头），zbuff.SEEK_CUR: 基点为当前位置，zbuff.SEEK_END: 基点为文件尾
---@return number #1 设置光标后从buff开头计算起的光标的位置
--- ```lua
--- buff:seek(0) -- 把光标设置到指定位置
--- buff:seek(5,zbuff.SEEK_CUR)
--- buff:seek(-3,zbuff.SEEK_END)
--- ```
function buff:seek(offset, base) end

--- 将一系列数据按照格式字符转化，并写入（从当前指针位置开始；执行后指针会向后移动）
---@param format string 后面数据的格式（符号含义见下面的例子）
---@param val1 val 传入的数据，可以为多个数据
---@param val2 any 
---@return number #1 成功写入的数据长度
--- ```lua
--- buff:pack(">IIHA", 0x1234, 0x4567, 0x12,"abcdefg") -- 按格式写入几个数据
--- A string
--- f float
--- d double
--- n Lua number
--- c char
--- b byte / unsignen char
--- h short
--- H unsigned short
--- i int
--- I unsigned int
--- l long
--- L unsigned long
--- < 小端
--- > 大端
--- = 默认大小端
--- 例子
--- buff:pack(
--- ">IIHA", -- 格式字符串：大端序，依次为[4字节无符号整型, 4字节无符号整型, 2字节无符号短整型, 字符串]
--- 0x1234, -- 参数1：整数值，写入为4字节（大端：00 00 12 34）
--- 0x4567, -- 参数2：整数值，写入为4字节（大端：00 00 45 67）
--- 0x12, -- 参数3：整数值，写入为2字节（大端：00 12）
--- "abcdefg" -- 参数4：字符串，写入7字节ASCII码（61 62 63 64 65 66 67）
--- )
--- ```
function buff:pack(format, val1, val2) end

--- 将一系列数据按照格式字符读取出来（从当前指针位置开始；执行后指针会向后移动）
---@param format string 数据的格式（符号含义见上面pack接口的例子）
---@return number #1 成功读取的数据字节长度
---@return any #2 按格式读出来的数据
--- ```lua
--- local cnt,a,b,c,s = buff:unpack(">IIHA10") -- 按格式读取几个数据
--- 如果全部成功读取，cnt就是4+4+2+10=20
--- ```
function buff:unpack(format) end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readI8() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readU8() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readI16() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readU16() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readI32() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readU32() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readI64() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readU64() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readF32() end

--- 读取一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 读取的数据，如果越界则为nil
--- ```lua
--- local data = buff:readI8()
--- local data = buff:readU32()
--- ```
function buff:readF64() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeI8() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeU8() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeI16() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeU16() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeI32() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeU32() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeI64() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeU64() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeF32() end

--- 写入一个指定类型的数据（从当前指针位置开始；执行后指针会向后移动）
---@return number #1 成功写入的长度
--- ```lua
--- local len = buff:writeI8(10)
--- local len = buff:writeU32(1024)
--- ```
function buff:writeF64() end

--- 按起始位置和长度取出数据（与当前指针位置无关；执行后指针位置不变）
---@param offset number 数据的起始位置（起始位置为0）,默认值也是0
---@param length number 数据的长度,默认是全部数据
---@return string #1 读出来的数据
--- ```lua
--- local s = buff:toStr(0,5)--读取开头的五个字节数据
--- local s = buff:toStr() -- 取出整个zbuff的数据
--- local s = buff:toStr(0, buff:used()) -- 取出已使用的部分, 与buff:query()一样
--- ```
function buff:toStr(offset, length) end

--- 获取zbuff对象的长度（与当前指针位置无关；执行后指针位置不变）
---@return number #1 zbuff对象的长度
--- ```lua
--- len = buff:len()
--- len = #buff
--- ```
function buff:len() end

--- 设置buff对象的FrameBuffer属性（与当前指针位置无关；执行后指针位置不变）
---@param width number FrameBuffer的宽度
---@param height number FrameBuffer的高度
---@param bit number FrameBuffer的色位深度
---@param color number FrameBuffer的初始颜色
---@return boolean #1 设置成功会返回true
--- ```lua
--- result = buff:setFrameBuffer(320,240,16,0xffff)
--- ```
function buff:setFrameBuffer(width, height, bit, color) end

--- 设置或获取FrameBuffer某个像素点的颜色（与当前指针位置无关；执行后指针位置不变）
---@param x number 与最左边的距离，范围是0~宽度-1
---@param y number 与最上边的距离，范围是0~高度-1
---@param color number 颜色，如果留空则表示获取该位置的颜色
---@return any #1 设置颜色时，设置成功会返回true；读取颜色时，返回颜色的值，读取失败返回nil
--- ```lua
--- rerult = buff:pixel(0,3,0)
--- color = buff:pixel(0,3)
--- ```
function buff:pixel(x, y, color) end

--- 画一条线（与当前指针位置无关；执行后指针位置不变）
---@param x1 number 起始坐标点与最左边的距离，范围是0~宽度-1
---@param y1 number 起始坐标点与最上边的距离，范围是0~高度-1
---@param x2 number 结束坐标点与最左边的距离，范围是0~宽度-1
---@param y2 number 结束坐标点与最上边的距离，范围是0~高度-1
---@param color number 可选，颜色，默认为0
---@return boolean #1 画成功会返回true
--- ```lua
--- rerult = buff:drawLine(0,0,2,3,0xffff)
--- ```
function buff:drawLine(x1, y1, x2, y2, color) end

--- 画一个矩形（与当前指针位置无关；执行后指针位置不变）
---@param x1 number 起始坐标点与最左边的距离，范围是0~宽度-1
---@param y1 number 起始坐标点与最上边的距离，范围是0~高度-1
---@param x2 number 结束坐标点与最左边的距离，范围是0~宽度-1
---@param y2 number 结束坐标点与最上边的距离，范围是0~高度-1
---@param color number 可选，颜色，默认为0
---@param fill boolean 可选，是否在内部填充，默认nil
---@return boolean #1 画成功会返回true
--- ```lua
--- rerult = buff:drawRect(0,0,2,3,0xffff)
--- ```
function buff:drawRect(x1, y1, x2, y2, color, fill) end

--- 画一个圆形（与当前指针位置无关；执行后指针位置不变）
---@param x number **圆心**与最左边的距离，范围是0~宽度-1
---@param y number **圆心**与最上边的距离，范围是0~高度-1
---@param r number 圆的半径
---@param color number 可选，圆的颜色，默认为0
---@param fill boolean 可选，是否在内部填充，默认nil
---@return boolean #1 画成功会返回true
--- ```lua
--- rerult = buff:drawCircle(15,5,3,0xC)
--- rerult = buff:drawCircle(15,5,3,0xC,true)
--- ```
function buff:drawCircle(x, y, r, color, fill) end

--- 释放zbuff所申请内存 注意：gc时会自动释放zbuff以及zbuff所申请内存，所以通常无需调用此函数，调用前请确认您已清楚此函数用处！调用此函数并不会释放掉zbuff，仅会释放掉zbuff所申请的内存，zbuff需等gc时自动释放！！！
--- ```lua
--- buff:free()
--- ```
function buff:free() end

--- 调整zbuff实际分配空间的大小，类似于realloc的效果，new = realloc(old, n)，可以扩大或者缩小（如果缩小后len小于了used，那么used=新len）
---@param n number 新空间大小
--- ```lua
--- buff:resize(20)
--- ```
function buff:resize(n) end

--- zbuff动态写数据，类似于memcpy效果，当原有空间不足时动态扩大空间
---@param start number 写入buff的起始位置，如果不为数字，则为buff的used，如果小于0，则从used往前数，-1 = used - 1
---@param para any 写入buff的数据，string或zbuff者时为一个参数，number时可为多个参数
---@return number #1 数据成功写入的长度
--- ```lua
--- local len = buff:copy(nil, "123") -- 类似于memcpy(&buff[used], "123", 3) used+= 3 从buff开始写入数据,指针相应地往后移动
--- local len = buff:copy(0, "123") -- 类似于memcpy(&buff[0], "123", 3) if (used < 3) used = 3 从位置0写入数据,指针有可能会移动
--- local len = buff:copy(2, 0x1a,0x30,0x31,0x32,0x00,0x01)  -- 类似于memcpy(&buff[2], [0x1a,0x30,0x31,0x32,0x00,0x01], 6) if (used < (2+6)) used = (2+6)从位置2开始，按数值写入多个字节数据
--- local len = buff:copy(9, buff2)  -- 类似于memcpy(&buff[9], &buff2[0], buff2的used) if (used < (9+buff2的used)) used = (9+buff2的used) 从位置9开始，合并入buff2里0~used的内容
--- local len = buff:copy(5, buff2, 10, 1024)  -- 类似于memcpy(&buff[5], &buff2[10], 1024) if (used < (5+1024)) used = (5+1024)
--- ```
function buff:copy(start, para) end

--- 设置/获取zbuff里最后一个数据位置指针到首地址的偏移量，来表示zbuff内已有有效数据量大小，注意这个不同于分配的空间大小，由于seek()会改变最后一个数据位置指针，因此也会影响到used()返回值。
---@return number #1 有效数据量大小
--- ```lua
--- buff:used()    --直接返回当前的有效数据量大小
--- buff:used(123) --设置当前的有效数据量为123字节，如果buff本身不到123字节，比如120字节，则会改成120，返回值是120
--- ```
function buff:used() end

--- 删除zbuff 0~used范围内的一段数据，注意只是改变了used的值，并不是真的在ram里去清除掉数据
---@param offset number 起始位置start, 默认0，如果<0则从used往前数，比如 -1 那么start= used - 1
---@param length number 长度del_len，默认为used，如果start + del_len数值大于used，会强制调整del_len = used - start
--- ```lua
--- buff:del(1,4)    --从位置1开始删除4个字节数据
--- buff:del(-1,4)    --从位置used-1开始删除4个字节数据，但是这肯定会超过used，所以del_len会调整为1，实际上就是删掉了最后一个字节
--- ```
function buff:del(offset, length) end

--- 按起始位置和长度0~used范围内取出数据，如果是1,2,4,8字节，且填写了isbigend参数，则根据isbigend,issigned,isfloat转换成浮点或者整形
---@param offset number 数据的起始位置（起始位置为0）
---@param length number 数据的长度
---@param isbigend boolean 是否是大端格式，如果为nil，则不会转换，直接字节流输出，false为小端格式，true为大端格式
---@param issigned boolean 是否是有符号的，默认为false
---@param isfloat boolean 是否是浮点型，默认为false
---@return string #1 读出来的数据，如果取出数据是1,2,4,8字节，且isbigend填写了true或者false，则输出浮点或者整形
--- ```lua
--- local s = buff:query(0,5)--读取开头的五个字节数据
--- ```
function buff:query(offset, length, isbigend, issigned, isfloat) end

--- zbuff的类似于memset操作，类似于memset(&buff[start], num, len)，当然有ram越界保护，会对len有一定的限制
---@param start number 可选，开始位置，默认为0,
---@param num number 可选，默认为0。要设置为的值
---@param len number 可选，长度，默认为全部空间，如果超出范围了，会自动截断
--- ```lua
--- 全部初始化为0
--- buff:set() --等同于 memset(buff, 0, sizeof(buff))
--- buff:set(8) --等同于 memset(&buff[8], 0, sizeof(buff) - 8)
--- buff:set(0, 0x55) --等同于 memset(buff, 0x55, sizeof(buff))
--- buff:set(4, 0xaa, 12) --等用于 memset(&buff[4], 0xaa, 12)
--- ```
function buff:set(start, num, len) end

--- zbuff的类似于memcmp操作，类似于memcmp(&buff[start], &buff2[start2], len)
---@param start number 可选，开始位置，默认为0,
---@param buff2 zbuff 比较的对象
---@param start2 number 可选，比较的对象的开始位置，默认为0
---@param len number 比较长度
---@return boolean #1 true相等，false不相等
---@return number #2 相等返回0，不相等返回第一个不相等位置的序号
--- ```lua
--- local result, offset = buff:isEqual(1, buff2, 2, 10) --等同于memcmp(&buff[1], &buff2[2], 10)
--- ```
function buff:isEqual(start, buff2, start2, len) end

--- 将当前zbuff数据转base64,输出到下一个zbuff中
---@param dst userdata zbuff指针
---@return number #1 转换后的实际长度
--- ```lua
--- dst:len必须大于buff:used() * 1.35 + 3, 确保有足够空间存放base64数据
--- buff:toBase64(dst)
--- ```
function buff:toBase64(dst) end
