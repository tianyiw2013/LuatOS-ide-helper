---@meta

--- LuatOS IDE Helper for module: ftp
--- ```yaml
--- Summary: ftp 客户端 (服务器推荐使用vsftpd,其他暂不做支持)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/network/libftp/luat_lib_ftp.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/ftp
--- Video: 
--- Tag: LUAT_USE_FTP
--- ```
ftp = {}

--- FTP客户端
---@param adapter number 适配器序号, 如果不填,会选择平台自带的方式,然后是最后一个注册的适配器,可选值请查阅socket库的常量表
---@param ip_addr string ip_addr 地址,支持IP和域名
---@param port string port 端口,默认21
---@param username string username 用户名,默认空
---@param password string password 密码, 默认空
---@return boolean|string #1 成功返回true 失败返回string
--- ```lua
--- 使用默认适配器连接ftp服务器
--- ftpc = ftp.login(nil,"www.ftp.com.cn").wait()
--- ```
function ftp.login(adapter, ip_addr, port, username, password) end

--- FTP命令
---@param cmd string cmd 命令 目前支持:NOOP SYST TYPE PWD MKD CWD CDUP RMD DELE LIST
---@return string #1 成功返回true 失败返回string
--- ```lua
--- // 空操作，防止连接断掉
---     print(ftp.command("NOOP").wait())
---     // 报告远程系统的操作系统类型
---     print(ftp.command("SYST").wait())
---     // 指定文件类型
---     print(ftp.command("TYPE I").wait())
---     // 显示当前工作目录名
---     print(ftp.command("PWD").wait())
---     // 创建目录
---     print(ftp.command("MKD QWER").wait())
---     // 改变当前工作目录
---     print(ftp.command("CWD /QWER").wait())
---     // 返回上一层目录
---     print(ftp.command("CDUP").wait())
---     // 删除目录
---     print(ftp.command("RMD QWER").wait())
---     // 获取当前工作目录下的文件名列表
---     print(ftp.command("LIST").wait())
---     // 删除文件
---     print(ftp.command("DELE /1/12222.txt").wait())
--- ```
function ftp.command(cmd) end

--- FTP文件下载
---@param local_name string local_name 本地文件
---@param remote_name string remote_name 服务器文件
---@return boolean|string #1 成功返回true 失败返回string
--- ```lua
--- ftp.pull("/1222.txt","/1222.txt").wait()
--- ```
function ftp.pull(local_name, remote_name) end

--- FTP文件上传
---@param local_name string local_name 本地文件
---@param remote_name string remote_name 服务器文件
---@return boolean|string #1 成功返回true 失败返回string
--- ```lua
--- ftp.push("/1222.txt","/1222.txt").wait()
--- ```
function ftp.push(local_name, remote_name) end

--- FTP客户端关闭
---@return boolean|string #1 成功返回true 失败返回string
--- ```lua
--- ftp.close().wait()
--- ```
function ftp.close() end

--- 配置是否打开debug信息
---@param onoff boolean 是否打开debug开关
---@return nil #1 无返回值
function ftp.debug(onoff) end
