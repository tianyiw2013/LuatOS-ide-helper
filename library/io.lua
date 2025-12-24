---@meta

--- LuatOS IDE Helper for module: io
--- ```yaml
--- Summary: io操作(扩展)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../lua/src/liolib.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/fs
--- Video: 
--- Tag: LUAT_USE_GPIO
--- ```
--- ```lua
--- io模块是lua原生模块,LuatOS增加了一些API
--- 请配合os模块一起使用
--- 只读模式, 打开文件
--- local fd = io.open("/xxx.txt", "rb")
--- 读写默认,打开文件
--- local fd = io.open("/xxx.txt", "wb")
--- 写入文件,且截断为0字节
--- local fd = io.open("/xxx.txt", "w+b")
--- 追加模式
--- local fd = io.open("/xxx.txt", "a")
--- 若文件打开成功, fd不为nil,否则就是失败了
--- 注意, 刷机时所添加的文件, 均在 /luadb 目录下, 只读
--- if fd then
--- 读取指定字节数,如果数据不足,就只返回实际长度的数据
---   local data = fd:read(12)
--- 按行读取
---   local line = fd:read("*l")
--- 全部读取
---   local line = fd:read("*a")
--- 数据写入, 仅w或a模式可调用
--- 数据需要是字符串, lua的字符串是带长度的,可以包含任何二进制数据
---   fd:write("xxxx") 
--- 以下是写入0x12, 0x13
---   fd:write(string.char(0x12, 0x13))
--- 移动句柄,绝对坐标
---   fd:seek("set", 1024)
--- 移动句柄,相对坐标
---   fd:seek("cur", 1024)
--- 移动句柄,反向绝对坐标,从文件结尾往文件头部算
---   fd:seek("end", 124)
--- 执行完操作后,一定要关掉文件
---   fd:close()
--- 2025.9.30 新增file:write支持zbuff参数
---   local zbuff = zbuff.create(1024)
---   zbuff:write("hello zbuff")
---   local f = io.open("/test_zbuff.bin", "wb+")
---   f:write(zbuff)
---   f:close()
--- 读出数据
---   local f = io.open("/test_zbuff.bin", "rb")
---   local data = f:read("*a")
---   f:close()
---   log.info("data", data)
--- end
--- ```
io = {}
file = {}

--- 关闭文件句柄
---@return nil #1 无返回值
function file:close() end

--- 打开文件,返回句柄
---@param path string 文件路径
---@param mode string 打开模式
---@return userdata #1 文件句柄,失败返回nil
--- ```lua
--- 只读模式, 打开文件
--- local fd = io.open("/xxx.txt", "rb")
--- 读写默认,打开文件
--- local fd = io.open("/xxx.txt", "wb")
--- 写入文件,且截断为0字节
--- local fd = io.open("/xxx.txt", "wb+")
--- 追加模式
--- local fd = io.open("/xxx.txt", "a")
--- 若文件打开成功, fd不为nil,否则就是失败了
--- if fd then
--- 读取指定字节数,如果数据不足,就只返回实际长度的数据
---   local data = fd:read(12)
--- 数据写入, 仅w或a模式可调用
--- 数据需要是字符串, lua的字符串是带长度的,可以包含任何二进制数据
---   fd:write("xxxx") 
--- 以下是写入0x12, 0x13
---   fd:write(string.char(0x12, 0x13))
--- 移动句柄,绝对坐标
---   fd:seek("set", 1024)
--- 移动句柄,相对坐标
---   fd:seek("cur", 1024)
--- 移动句柄,反向绝对坐标,从文件结尾往文件头部算
---   fd:seek("end", 124)
--- 执行完操作后,一定要关掉文件
---   fd:close()
--- end
--- ```
function io.open(path, mode) end

--- 将数据写入文件
---@param data string|zbuff 数据
---@return boolean #1 成功返回true,否则返回nil和错误信息
--- ```lua
--- local fd = io.open("/xxx.txt", "wb+")
--- if fd then
--- 数据需要是字符串, lua的字符串是带长度的,可以包含任何二进制数据
---   local ret, err = fd:write("xxxx") 
---   if not ret then
---     log.error("io", "write error", err)
---   end
--- 2025.9.30 新增file:write支持zbuff参数
---   local zbuff = zbuff.create(1024)
---   zbuff:write("hello zbuff")
---   local ret, err = fd:write(zbuff)
---   if not ret then
---     log.error("io", "write error", err)
---   end
---   fd:close()
--- end
--- ```
function file:write(data) end

--- 移动文件指针
---@param whence string whence 定位方式, 可选值有 "set", "cur", "end", 默认 "cur"
---@param offset number offset 偏移值, 默认0
---@return number #1 成功返回当前文件指针位置,否则返回nil和错误信息
--- ```lua
--- local fd = io.open("/xxx.txt", "rb")
--- if fd then
---   local pos = fd:seek("set", 0)
---   if not pos then
---     log.error("io", "seek error", err)
---   end
---   fd:close()
--- end
--- ```
function file:seek(whence, offset) end

--- 判断文件是否存在
---@param path string 文件路径
---@return boolean #1 存在返回true,否则返回false
--- ```lua
--- log.info("io", "file exists", io.exists("/boottime"))
--- ```
function io.exists(path) end

--- 获取文件大小
---@param path string 文件路径
---@return number #1 文件数据,若文件不存在会返回nil
--- ```lua
--- local fsize = io.fileSize("/bootime")
--- if fsize and fsize > 1024 then
---   log.info("io", "file size", fsize)
--- end
--- ```
function io.fileSize(path) end

--- 读取整个文件,请注意内存消耗
---@param path string 文件路径
---@param mode string 读取模式, 默认 "rb"
---@param offset number 起始位置,默认0
---@param len number 读取长度,默认整个文件
---@return string #1 文件数据,若文件不存在会返回nil
--- ```lua
--- local data = io.readFile("/bootime")
--- 注意: offset和len参数是 2023.6.6添加的
--- 读取abc.txt, 先跳过128字节, 然后读取512字节数据
--- local data = io.readFile("/abc.txt", "rb", 128, 512)
--- ```
function io.readFile(path, mode, offset, len) end

--- 将数据写入文件
---@param path string 文件路径
---@param data string 数据
---@param mode string 写入模式, 默认 "wb+"
---@return boolean #1 成功返回true, 否则返回false
--- ```lua
--- 将数据写入到文件, 默认是"wb+"模式, 即完全覆写,原有文件数据全部删除, 文件不存在就新建
--- io.writeFile("/bootime", "1")
--- 以"ab+"模式打开文件, 追加数据到文件末尾
--- io.writeFile("/bootime", "2", "ab+")
--- ```
function io.writeFile(path, data, mode) end

--- 读取文件并填充到zbuff内,但不移动指针位置
---@param buff userdata zbuff实体
---@param offset number 写入的位置,默认是0
---@param len number 写入的长度,默认是zbuff的len减去offset
---@return boolean #1 成功返回true,否则返回false
---@return number #2 返回实际读取到的长度，如果小于0也说明是读取失败了
--- ```lua
--- local buff = zbuff.create(1024)
--- local f = io.open("/sd/test.txt")
--- if f then
---   f:fill(buff)
--- end
--- ```
function io.fill(buff, offset, len) end

--- 获取文件系统信息
---@param path string 路径,默认"/",可选
---@return boolean #1 获取成功返回true,否则返回false
---@return number #2 总的block数量
---@return number #3 已使用的block数量
---@return number #4 block的大小,单位字节
---@return string #5 文件系统类型,例如lfs代表littlefs
--- ```lua
--- 打印根分区的信息
--- log.info("fsstat", io.fsstat("/"))
--- ```
function io.fsstat(path) end

--- 判断目录是否存在
---@param path string 目录路径
---@return boolean #1 存在返回true,否则返回false
--- ```lua
--- 本函数于2025.8.12新增
--- log.info("io", "dir存在吗?", io.dexist("/sd/myf"))
--- ```
function io.dexist(path) end

--- 格式化文件系统,需指定挂载点
---@param path string 挂载点
---@return boolean #1 成功与否
---@return number #2 底层返回值
--- ```lua
--- local ret, errio = io.mkfs("/sd")
--- log.info("fs", "mkfs", ret, errio)
--- ```
function io.mkfs(path) end

--- 创建文件夹
---@param path string 需要建立的目录路径
---@return boolean #1 成功与否
---@return number #2 底层返回值
--- ```lua
--- local ret, errio = io.mkdir("/data/")
--- log.info("fs", "mkdir", ret, errio)
--- ```
function io.mkdir(path) end

--- 删除文件夹
---@param path string 需要移除的目录路径
---@return boolean #1 成功与否
---@return number #2 底层返回值
--- ```lua
--- local ret, errio = io.rmdir("/data/")
--- log.info("fs", "rmdir", ret, errio)
--- ```
function io.rmdir(path) end

--- 列出目录下的文件
---@param path string 需要枚举的目录路径
---@param len number 最大长度, 默认10, 最高50
---@param offset number 偏移量, 默认0, 当目录文件很多时分页查询用
---@return boolean #1 成功与否
---@return number #2 底层返回值
--- ```lua
--- local ret, data = io.lsdir("/data/", 10, 0)
--- if ret then
---   log.info("fs", "lsdir", json.encode(data))
--- else
---   log.info("fs", "lsdir", "fail", ret, data)
--- end
--- ```
function io.lsdir(path, len, offset) end

--- 列出所有挂载点
---@return table #1 挂载点列表
--- ```lua
--- local data = io.lsmount()
--- log.info("fs", "lsmount", json.encode(data))
--- ```
function io.lsmount() end
