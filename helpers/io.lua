io = {}

--io.close ([file])
function io.close(...) end

--io.flush ()
function io.flush(...) end

--io.input ([file])
function io.input(...) end

--io.lines ([filename])
function io.lines(...) end

--io.open (filename [, mode])
function io.open(...) end

--io.output ([file])
function io.output(...) end

--io.popen (prog [, mode])
function io.popen(...) end

--io.read (...)
function io.read(...) end

--io.tmpfile ()
function io.tmpfile(...) end

--io.type (obj)
function io.type(...) end

--io.write (...)
function io.write(...) end

--io.exists(path) - 判断文件是否存在
--传入值：
--string 文件路径
--返回值：
--bool 存在返回true,否则返回false
--例子：
--log.info("io", "file exists", io.exists("/boottime"))
function io.exists(path) end

--io.fileSize(path) - 获取文件大小
--传入值：
--string 文件路径
--返回值：
--int 文件数据,若文件不存在会返回nil
--例子：
--local fsize = io.fileSize("/bootime")
--if fsize and fsize > 1024 then
--  log.info("io", "file size", fsize)
--end
function io.fileSize(path) end

--io.readFile(path, mode, offset, len) - 读取整个文件,请注意内存消耗
--传入值：
--string 文件路径
--string 读取模式, 默认 "rb"
--int 起始位置,默认0
--int 读取长度,默认整个文件
--返回值：
--string 文件数据,若文件不存在会返回nil
--例子：
--local data = io.readFile("/bootime")
---- 注意: offset和len参数是 2023.6.6添加的
---- 读取abc.txt, 先跳过128字节, 然后读取512字节数据
--local data = io.readFile("/abc.txt", "rb", 128, 512)
function io.readFile(path,mode,offset,len) end

--io.writeFile(path, data) - 将数据写入文件
--传入值：
--string 文件路径
--string 数据
--返回值：
--boolean 成功返回true, 否则返回false
--例子：
--io.writeFile("/bootime", "1")
function io.writeFile(path,data) end

--io.fill(buff, offset, len) - 读取文件并填充到zbuff内,但不移动指针位置
--传入值：
--userdata zbuff实体
--int 写入的位置,默认是0
--int 写入的长度,默认是zbuff的len减去offset
--返回值：
--boolean 成功返回true,否则返回false
--int 返回实际读取到的长度，如果小于0也说明是读取失败了
--例子：
--local buff = zbuff.create(1024)
--local f = io.open("/sd/test.txt")
--if f then
--  f:fill(buff)
--end
function io.fill(buff,offset,len) end

--io.mkfs(path) - 格式化文件系统,需指定挂载点
--传入值：
--string 挂载点
--返回值：
--bool 成功与否
--int 底层返回值
--例子：
--local ret, errio = io.mkfs("/sd")
--log.info("fs", "mkfs", ret, errio)
function io.mkfs(path) end

--io.mkdir(path) - 创建文件夹
--传入值：
--string 需要建立的目录路径
--返回值：
--bool 成功与否
--int 底层返回值
--例子：
--local ret, errio = io.mkdir("/data/")
--log.info("fs", "mkdir", ret, errio)
function io.mkdir(path) end

--io.rmdir(path) - 删除文件夹
--传入值：
--string 需要移除的目录路径
--返回值：
--bool 成功与否
--int 底层返回值
--例子：
--local ret, errio = io.rmdir("/data/")
--log.info("fs", "rmdir", ret, errio)
function io.rmdir(path) end

--io.lsdir(path, len, offset) - 列出目录下的文件
--传入值：
--string 需要枚举的目录路径
--int 最大长度, 默认10, 最高50
--int 偏移量, 默认0, 当目录文件很多时分页查询用
--返回值：
--bool 成功与否
--int 底层返回值
--例子：
--local ret, data = io.lsdir("/data/", 10, 0)
--if ret then
--  log.info("fs", "lsdir", json.encode(data))
--else
--  log.info("fs", "lsdir", "fail", ret, data)
--end
function io.lsdir(path,len,offset) end

--io.lsmount() - 列出所有挂载点
--返回值：
--table 挂载点列表
--例子：
--local data = io.lsmount()
--log.info("fs", "lsmount", json.encode(data))
function io.lsmount() end