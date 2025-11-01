fs = {}

--fs.fsstat(path) - 获取文件系统信息
--传入值：
--string 路径,默认"/",可选
--返回值：
--boolean 获取成功返回true,否则返回false
--int 总的block数量
--int 已使用的block数量
--int block的大小,单位字节
--string 文件系统类型,例如lfs代表littlefs
--例子：
---- 打印根分区的信息
--log.info("fsstat", fs.fsstat("/"))
function fs.fsstat(path) end

--fs.fsize(path) - 获取文件大小
--传入值：
--string 文件路径
--返回值：
--int 文件大小,若获取失败会返回0
--例子：
---- 打印main.luac的大小
--log.info("fsize", fs.fsize("/main.luac"))
function fs.fsize(path) end