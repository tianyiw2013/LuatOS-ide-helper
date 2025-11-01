protobuf = {}

--protobuf.load(pbdata) - 加载pb二进制定义数据
--传入值：
--string 通过protoc.exe程序转换得到的数据,通常从文件读取得到
--返回值：
--bool 成功与否
--int 读取了多长, 调试用
--例子：
---- 注意, 同一个文件只需要加载一次, 除非调用过protobuf.clear()
--protobuf.load(io.readFile("/luadb/person.pb"))
function protobuf.load(pbdata) end

--protobuf.clear() - 清除已加载的二进制定义数据
--返回值：
--nil 无返回值, 总是成功
--例子：
---- 清除所有已加载的定义数据
--protobuf.clear()
function protobuf.clear() end

--protobuf.encode(tpname, data) - 编码protobuffs数据包
--传入值：
--string 数据类型名称, 定义在pb文件中, 由protobuf.load加载
--table 待编码数据, 必须是table, 内容符合pb文件里的定义
--返回值：
--string 编码后的数据,若失败会返回nil
--例子：
---- 数据编码
--local tb = {
--    name = "wendal"
--}
--local pbdata = protobuf.encode("Person", tb)
--if pbdata then
--    -- 注意, 编码后的数据通常带不可见字符
--    log.info("protobuf", #pbdata, pbdata:toHex())
--end
function protobuf.encode(tpname,data) end

--protobuf.decode(tpname, data) - 解码protobuffs数据包
--传入值：
--string 数据类型名称, 定义在pb文件中, 由protobuf.load加载
--string 待编码数据
--返回值：
--table 解码后的数据
--例子：
---- 数据编码
--local tb = {
--    name = "wendal"
--}
--local pbdata = protobuf.encode("Person", tb)
--if pbdata then
--    -- 注意, 编码后的数据通常带不可见字符
--    log.info("protobuf", #pbdata, pbdata:toHex())
--end
function protobuf.decode(tpname,data) end