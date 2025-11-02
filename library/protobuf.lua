---@meta

--- LuatOS IDE Helper for module: protobuf
--- ```yaml
--- Summary: ProtoBuffs编解码
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/serialization/protobuf/luat_lib_protobuf.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/protobuf
--- Video: 
--- Tag: LUAT_USE_PROTOBUF
--- ```
--- ```lua
--- 加载 pb 文件, 这个是从pbtxt 转换得到的
--- 转换命令: protoc.exe -operson.pb --cpp_out=cpp person.pbtxt
--- protoc.exe 下载地址: https://github.com/protocolbuffers/protobuf/releases
--- protobuf.load(io.readFile("/luadb/person.pb"))
--- local tb = {
---     name = "wendal",
---     id = 123,
---     email = "abc@qq.com"
--- }
--- 用 protobuf 编码数据
--- local data = protobuf.encode("Person", tb)
--- if data then
--- 打印数据长度. 编码后的数据含不可见字符, toHex是方便显示
---     log.info("protobuf", #data, (data:toHex()))
--- end
--- ```
protobuf = {}

--- 加载pb二进制定义数据
---@param pbdata string 通过protoc.exe程序转换得到的数据,通常从文件读取得到
---@return boolean #1 成功与否
---@return number #2 读取了多长, 调试用
--- ```lua
--- 注意, 同一个文件只需要加载一次, 除非调用过protobuf.clear()
--- protobuf.load(io.readFile("/luadb/person.pb"))
--- ```
function protobuf.load(pbdata) end

--- 清除已加载的二进制定义数据
---@return nil #1 无返回值, 总是成功
--- ```lua
--- 清除所有已加载的定义数据
--- protobuf.clear()
--- ```
function protobuf.clear() end

--- 编码protobuffs数据包
---@param tpname string 数据类型名称, 定义在pb文件中, 由protobuf.load加载
---@param data table 待编码数据, 必须是table, 内容符合pb文件里的定义
---@return string #1 编码后的数据,若失败会返回nil
--- ```lua
--- 数据编码
--- local tb = {
---     name = "wendal"
--- }
--- local pbdata = protobuf.encode("Person", tb)
--- if pbdata then
--- 注意, 编码后的数据通常带不可见字符
---     log.info("protobuf", #pbdata, pbdata:toHex())
--- end
--- ```
function protobuf.encode(tpname, data) end

--- 解码protobuffs数据包
---@param tpname string 数据类型名称, 定义在pb文件中, 由protobuf.load加载
---@param data string 待编码数据
---@return table #1 解码后的数据
--- ```lua
--- 数据编码
--- local tb = {
---     name = "wendal"
--- }
--- local pbdata = protobuf.encode("Person", tb)
--- if pbdata then
--- 注意, 编码后的数据通常带不可见字符
---     log.info("protobuf", #pbdata, pbdata:toHex())
--- end
--- ```
function protobuf.decode(tpname, data) end
