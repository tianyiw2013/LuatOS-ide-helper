---@meta

--- LuatOS IDE Helper for module: socket
--- ```yaml
--- Summary: 网络接口
--- URL: 
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/socket
--- Video: 
--- Tag: LUAT_USE_NETWORK
--- ```
--- ```lua
--- 本库用于网络通信, 支持TCP, UDP, 也支持TLS加密传输
--- 支持加密传输版本有 TLS 1.0/1.1/1.2/1.3, DTLS 1.0/1.2, 当前不支持TLS 1.3
--- 不支持 SSL 3.0, 该协议已经被废弃, 也不安全
--- 支持的加密算法有 RSA, ECC, AES, 3DES, SHA1, SHA256, MD5 等等
--- 完整的加密套件列表, 可通过 crypto.cipher_suites() 获取
--- 本库的函数, 除非特别说明, 都是立即返回的非阻塞函数
--- 这意味着, 函数调用成功, 并不代表网络操作成功, 只代表网络操作已经开始
--- ```
socket = {}

--- 带硬件协议栈的ETH0，值为5 (number)
socket.ETH0 = 0

--- 使用LWIP协议栈的以太网卡，值为4 (number)
socket.LWIP_ETH = 0

--- 使用LWIP协议栈的WIFI STA，值为2 (number)
socket.LWIP_STA = 0

--- 使用LWIP协议栈的WIFI AP，值为3 (number)
socket.LWIP_AP = 0

--- 使用LWIP协议栈的移动蜂窝模块，值为1 (number)
socket.LWIP_GP = 0

--- 使用LWIP协议栈的USB网卡，值为6 (number)
socket.USB = 0

--- LINK事件 (number)
socket.LINK = 0

--- ON_LINE事件 (number)
socket.ON_LINE = 0

--- EVENT事件 (number)
socket.EVENT = 0

--- TX_OK事件 (number)
socket.TX_OK = 0

--- CLOSED事件 (number)
socket.CLOSED = 0

--- 使用LWIP协议栈的SPI网络 (number)
socket.LWIP_SPI = 0

--- 使用LWIP协议栈的自定义网卡0, 2025.1.12新增 (number)
socket.LWIP_USER0 = 0

--- 使用LWIP协议栈的自定义网卡1, 2025.1.12新增 (number)
socket.LWIP_USER1 = 0

--- 使用LWIP协议栈的自定义网卡2, 2025.1.12新增 (number)
socket.LWIP_USER2 = 0

--- 使用LWIP协议栈的自定义网卡3, 2025.1.12新增 (number)
socket.LWIP_USER3 = 0

--- 使用LWIP协议栈的自定义网卡4, 2025.1.12新增 (number)
socket.LWIP_USER4 = 0

--- 使用LWIP协议栈的自定义网卡5, 2025.1.12新增 (number)
socket.LWIP_USER5 = 0

--- 使用LWIP协议栈的自定义网卡6, 2025.1.12新增 (number)
socket.LWIP_USER6 = 0

--- 使用LWIP协议栈的自定义网卡7, 2025.1.12新增 (number)
socket.LWIP_USER7 = 0

--- 4G代理网关 (number)
socket.LWIP_GP_GW = 0

--- 获取本地ip
---@param adapter number 适配器序号, 默认是平台自带的能上外网的适配器,通过socket.dft()可以获取和修改
---@return string #1 通常是内网ip, 也可能是外网ip, 取决于运营商的分配
---@return string #2 网络掩码
---@return string #3 网关IP
--- ```lua
--- sys.taskInit(function()
---     while 1 do
---         sys.wait(3000)
---         log.info("socket", "ip", socket.localIP())
--- 输出示例
--- 62.39.244.10    255.255.255.255    0.0.0.0
---     end
--- end)
--- ```
function socket.localIP(adapter) end

--- 在指定网卡上申请一个socket_ctrl
---@param adapter number 适配器序号,默认是平台自带的能上外网的适配器,通过socket.dft()可以获取和修改
---@param cb string|function string为消息通知的taskName，function则为回调函数
---@return userdata #1 成功返回network_ctrl，失败返回nil
--- ```lua
--- 以太网网卡上申请一个network_ctrl,通过socket_cb_fun回调相关消息
--- local netc = socket.create(socket.LWIP_GP, socket_cb_fun)
--- 以太网网卡上申请一个network_ctrl,通过sendMsg方式通知taskName为"IOT_TASK"回调相关消息
--- local netc = socket.create(socket.LWIP_GP, "IOT_TASK")
--- 在默认网络适配器上创建一个network_ctrl
--- local netc = socket.create(nil, "MySocket")
--- [[
--- 当通过回调函数回调消息时，输入给function一共3个参数：
--- param1为申请的network_ctrl
--- param2为具体的消息，只能是socket.LINK, socket.ON_LINE, socket.TX_OK, socket.EVENT, socket.CLOSED等等
--- param3为消息对应的参数，目前只有0和-1，0表示成功或者可能有新数据（具体消息为socket.EVENT），-1表示失败或者有异常，需要断开重连
--- ]]
--- [[
--- Air8000内核固件运行起来之后，在脚本调用socket.dft(id)之前，默认适配器编号为socket.LWIP_GP，最后一个注册的适配器编号为socket.LWIP_AP；
--- Air780xx内核固件运行起来之后，在脚本调用socket.dft(id)之前，默认适配器编号为socket.LWIP_GP，最后一个注册的适配器编号为socket.LWIP_GP；
--- Air8101内核固件运行起来之后，在脚本调用socket.dft(id)之前，默认适配器编号为socket.LWIP_STA，最后一个注册的适配器编号为socket.LWIP_STA；
--- ]]
--- ```
function socket.create(adapter, cb) end

--- 配置是否打开debug信息
---@param ctrl user_data socket.create得到的ctrl
---@param onoff boolean true 打开debug开关
---@return nil #1 无返回值
--- ```lua
--- 打开调试信息,默认是关闭状态
--- socket.debug(ctrl, true)
--- ```
function socket.debug(ctrl, onoff) end

--- 配置network一些信息，
---@param ctrl user_data socket.create得到的ctrl
---@param local_port number 本地端口号，小端格式，如果不写，则自动分配一个，如果用户填了端口号则需要小于60000, 默认不写
---@param is_udp boolean 是否是UDP，默认false
---@param is_tls boolean 是否是加密传输，默认false
---@param keep_idle number tcp keep live模式下的idle时间（秒），如果留空则表示不启用，如果是不支持标准posix接口的网卡（比如W5500），则为心跳间隔
---@param keep_interval number tcp keep live模式下的探测间隔时间（秒）
---@param keep_cnt number tcp keep live模式下的探测次数
---@param server_cert string TCP模式下的服务器ca证书数据，UDP模式下的PSK，不需要加密传输写nil，后续参数也全部nil
---@param client_cert string TCP模式下的客户端证书数据，UDP模式下的PSK-ID，TCP模式下如果不需要验证客户端证书时，忽略，一般不需要验证客户端证书
---@param client_key string TCP模式下的客户端私钥加密数据
---@param client_password string TCP模式下的客户端私钥口令数据
---@return boolean #1 成功返回true，失败返回false
--- ```lua
--- 最普通的TCP传输
--- socket.config(ctrl)
--- 最普通的加密TCP传输，证书都不用验证的那种
--- socket.config(ctrl, nil, nil ,true)
--- ```
function socket.config(ctrl, local_port, is_udp, is_tls, keep_idle, keep_interval, keep_cnt, server_cert, client_cert, client_key, client_password) end

--- 等待网卡linkup
---@param ctrl user_data socket.create得到的ctrl
---@return boolean #1 true没有异常发生，false失败了，如果false则不需要看下一个返回值了
---@return boolean #2 true已经linkup，false没有linkup，之后需要接收socket.LINK消息
--- ```lua
--- 判断一下是否已经联网
--- local succ, result = socket.linkup(ctrl)
--- ```
function socket.linkup(ctrl) end

--- 作为客户端连接服务器
---@param ctrl user_data socket.create得到的ctrl
---@param ip string or int ip或者域名，如果是IPV4，可以是大端格式的int值
---@param remote_port number 服务器端口号，小端格式
---@param need_ipv6_dns boolean 域名解析是否要IPV6，true要，false不要，默认false不要，只有支持IPV6的协议栈才有效果
---@return boolean #1 true没有异常发生，false失败了，如果false则不需要看下一个返回值了，如果有异常，后续要close
---@return boolean #2 true已经connect，false没有connect，之后需要接收socket.ON_LINE消息
--- ```lua
--- local succ, result = socket.connect(ctrl, "netlab.luatos.com", 40123)
--- [[
--- 常见的连接失败的code值, 会在日志中显示
--- -1 底层内存不足
--- -3 超时
--- -8 端口已经被占用
--- -11 链接未建立
--- -13 模块主动断开连接
--- -14 服务器主动断开连接
--- ]]
--- ```
function socket.connect(ctrl, ip, remote_port, need_ipv6_dns) end

--- 作为客户端断开连接
---@param ctrl user_data socket.create得到的ctrl
---@return boolean #1 true没有异常发生，false失败了，如果false则不需要看下一个返回值了
---@return boolean #2 true已经断开，false没有断开，之后需要接收socket.CLOSED消息
--- ```lua
--- local succ, result = socket.discon(ctrl)
--- ```
function socket.discon(ctrl) end

--- 强制关闭socket
---@param ctrl user_data socket.create得到的ctrl
---@return nil #1 无返回值
function socket.close(ctrl) end

--- 发送数据给对端，UDP单次发送不要超过1460字节，否则很容易失败
---@param ctrl user_data socket.create得到的ctrl
---@param data string or user_data zbuff  要发送的数据
---@param ip string or int 对端IP，如果是TCP应用则忽略，如果是UDP，如果留空则用connect时候的参数，如果是IPV4，可以是大端格式的int值
---@param port number 对端端口号，小端格式，如果是TCP应用则忽略，如果是UDP，如果留空则用connect时候的参数
---@param flag number 发送参数，目前预留，不起作用
---@return boolean #1 true没有异常发生，false失败了，如果false则不需要看下一个返回值了，如果false，后续要close
---@return boolean #2 true缓冲区满了，false没有满，如果true，则需要等待一段时间或者等到socket.TX_OK消息后再尝试发送，同时忽略下一个返回值
---@return boolean #3 true已经收到应答，false没有收到应答，之后需要接收socket.TX_OK消息， 也可以忽略继续发送，直到full==true
--- ```lua
--- local succ, full, result = socket.tx(ctrl, "123456", "xxx.xxx.xxx.xxx", xxxx)
--- ```
function socket.tx(ctrl, data, ip, port, flag) end

--- 接收对端发出的数据，注意数据已经缓存在底层，使用本函数只是提取出来，UDP模式下一次只会取出一个数据包
---@param ctrl user_data socket.create得到的ctrl
---@param buff user_data zbuff 存放接收的数据，如果缓冲区不够大会自动扩容
---@param flag number 接收参数，目前预留，不起作用
---@param limit number 接收数据长度限制，如果指定了，则只取前N个字节. 2024.1.5 新增
---@return boolean #1 true没有异常发生，false失败了，如果false则不需要看下一个返回值了，如果false，后续要close
---@return number #2 本次接收到数据长度
---@return string #3 对端IP，只有UDP模式下才有意义，TCP模式返回nil，注意返回的格式，如果是IPV4，1byte 0x00 + 4byte地址 如果是IPV6，1byte 0x01 + 16byte地址
---@return number #4 对端port，只有UDP模式下才有意义，TCP模式返回0
--- ```lua
--- 从socket中读取数据, ctrl是socket.create返回的, 请查阅demo/socket
--- local buff = zbuff.create(2048)
--- local succ, data_len, remote_ip, remote_port = socket.rx(ctrl, buff)
--- 限制读取长度, 2024.1.5 新增
--- 注意
--- 如果是UDP数据, 如果limit小于UDP数据包长度, 只会取前limit个字节, 剩余数据会丢弃
--- 如果是TCP数据, 如果有剩余数据, 不会丢弃, 可继续读取.
--- 有新的数据到来才会有新的EVENT数据, 未读取完成的数据不会触发新EVENT事件
--- local succ, data_len, remote_ip, remote_port = socket.rx(ctrl, buff, 1500)
--- 读取缓冲区大小, 2024.1.5 新增, 注意,老版本固件不传buff参数会报错的
--- 对于TCP数据, 这里返回的是待读取的数据的总长度
--- 对于UDP数据, 这里返回的是单个UDP数据包的长度
--- local succ, data_len = socket.rx(ctrl)
--- if succ then
---     log.info("待收取数据长度", data_len)
--- end
--- ```
function socket.rx(ctrl, buff, flag, limit) end

--- 读取数据(非zbuff版本,已废弃)
---@param netc userdata socket.create得到的ctrl
---@param len number 限制读取数据长度,可选,不传就是读出全部
---@return boolean #1 读取成功与否
---@return string #2 读取的数据,仅当读取成功时有效
---@return string #3 对方IP地址,仅当读取成功且UDP通信时有效
---@return number #4 对方端口,仅当读取成功且UDP通信时有效
--- ```lua
--- 本函数于2024.4.8添加, 用于简易读取不大的数据
--- 请优先使用socket.rx函数, 本函数主要用于固件不含zbuff库时的变通调用
--- local ok, data = socket.read(netc, 1500)
--- if ok and #data > 0 then
---     log.info("读取到的数据", data)
--- end
--- ```
function socket.read(netc, len) end

--- 等待新的socket消息，在连接成功和发送数据成功后，使用一次将network状态转换到接收新数据
---@param ctrl user_data socket.create得到的ctrl
---@return boolean #1 true没有异常发生，false失败了，如果false则不需要看下一个返回值了，如果false，后续要close
---@return boolean #2 true有新的数据需要接收，false没有数据，之后需要接收socket.EVENT消息
--- ```lua
--- local succ, result = socket.wait(ctrl)
--- ```
function socket.wait(ctrl) end

--- 作为服务端开始监听
---@param ctrl user_data socket.create得到的ctrl
---@return boolean #1 true没有异常发生，false失败了，如果false则不需要看下一个返回值了，如果false，后续要close
---@return boolean #2 true已经connect，false没有connect，之后需要接收socket.ON_LINE消息
--- ```lua
--- local succ, result = socket.listen(ctrl)
--- ```
function socket.listen(ctrl) end

--- 作为服务端接收到一个新的客户端，注意，如果是类似W5500的硬件协议栈不支持1对多，则不需要第二个参数
---@param ctrl user_data socket.create得到的ctrl，这里是服务器端
---@return boolean #1 true没有异常发生，false失败了，如果false则不需要看下一个返回值了，如果false，后续要close
---@return user_data #2 or nil 如果支持1对多，则会返回新的ctrl，自动create，如果不支持则返回nil
--- ```lua
--- local succ, new_netc = socket.accept(ctrl, cb)
--- ```
function socket.accept(ctrl) end

--- 获取socket当前状态
---@param ctrl user_data socket.create得到的ctrl
---@return number #1 or nil,输入参数正确的情况下，返回状态的数值，否则返回nil
---@return string #2 or nil,输入参数正确的情况下，返回状态的中文描述，否则返回nil
--- ```lua
--- local state, str = socket.state(ctrl)
--- log.info("state", state, str)
--- state    0    "硬件离线",
---         1    "离线",
---         2    "等待DNS",
---         3    "正在连接",
---         4    "正在TLS握手",
---         5    "在线",
---         6    "在监听",
---         7    "正在离线",
---         8    "未知"
--- ```
function socket.state(ctrl) end

--- 主动释放掉network_ctrl
---@param ctrl user_data socket.create得到的ctrl
--- ```lua
--- 释放后就不能再使用了
--- socket.release(ctrl)
--- ```
function socket.release(ctrl) end

--- 设置DNS服务器
---@param adapter_index number 适配器序号,请参考socket库的常量表
---@param dns_index number dns服务器序号，从1开始
---@param ip string or int dns，如果是IPV4，可以是大端格式的int值
---@return boolean #1 成功返回true，失败返回false
--- ```lua
--- 设置默认网络适配器的DNS配置
--- socket.setDNS(nil, 1, "114.114.114.114")
--- 设置制定网络适配器的DNS配置
--- socket.setDNS(socket.ETH0, 1, "114.114.114.114")
--- ```
function socket.setDNS(adapter_index, dns_index, ip) end

--- 设置SSL的log登记
---@param log_level number mbedtls log等级
---@return nil #1 无返回值
--- ```lua
--- [[
--- SSL/TLS log级别说明
--- 0不打印
--- 1只打印错误和警
--- 2大部分info
--- 3及3以上详细的debug
--- 过多的信息可能会造成内存碎片化
--- ]]
--- 打印大部分info日志
--- socket.sslLog(2)
--- ```
function socket.sslLog(log_level) end

--- 查看网卡适配器的联网状态
---@param index number 需要查看的适配器序号，可以留空会查看全部网卡，直到遇到IP READY的，如果指定网卡，只能是socket.ETH0（外置以太网），socket.LWIP_ETH（内置以太网），socket.LWIP_STA（内置WIFI的STA），socket.LWIP_AP（内置WIFI的AP），socket.LWIP_GP（内置蜂窝网络的GPRS），socket.USB（外置USB网卡）
---@return boolean #1 被查看的适配器是否IP READY,true表示已经准备好可以联网了,false暂时不可以联网
---@return number #2 最后一个被查看的适配器序号
--- ```lua
--- 查看全部网卡，直到找到一个是IP READY的
--- local isReady,index = socket.adapter() --如果isReady为true,则index为IP READY的网卡适配器序号
--- 查看外置以太网（比如W5500）是否IP READY
--- local isReady,default = socket.adapter(socket.ETH0)
--- ```
function socket.adapter(index) end

--- 获取对端ip
---@param ctrl user_data socket.create得到的ctrl
---@return string #1 IP1，如果为nil，则表示没有获取到IP地址
---@return string #2 IP2，如果为nil，则表示没有IP2
---@return string #3 IP3，如果为nil，则表示没有IP3
---@return string #4 IP4，如果为nil，则表示没有IP4
--- ```lua
--- 注意: ，必须在接收到socket.ON_LINE消息之后才可能获取到，最多返回4个IP。
--- socket.connect里如果remote_port设置成0，则当DNS完成时就返回socket.ON_LINE消息
--- local ip1,ip2,ip3,ip4 = socket.remoteIP(ctrl)
--- ```
function socket.remoteIP(ctrl) end

--- 设置默认网络适配器编号
---@param id number 默认适配器编号,若不传,则打包获取
---@return number #1 默认适配器编号
---@return number #2 最后一个注册的适配器编号(2025.7.25新增)
--- ```lua
--- 本函数于 2025.1.6 新增
--- 获取当前默认适配器编号
--- local id = socket.dft()
--- 设置默认适配器编号
--- socket.dft(socket.LWIP_ETH)
--- 获取当前默认适配器编号, 及最后一个注册的适配器编号
--- local id, last_id = socket.dft()
--- log.info("当前默认适配器编号", id, "最后一个注册的适配器编号", last_id)
--- 1. 当前的默认网卡, 可以获取, 可以设置, 就是socket.dft(id)的第一个参数, 也是第一个返回值
--- 2. 最后注册的网卡, 可以获取, 不支持设置, 就是socket.dft()的第二个返回值
--- ```
function socket.dft(id) end

--- 断开指定网卡的所有数据链接（实验性支持）
---@param id number 适配器编号
---@return boolean #1 执行结果
--- ```lua
--- 本函数于 2025.9.24 新增
--- 断开WIFI网卡上的所有数据链接
--- socket.close_all(socket.LWIP_STA)
--- ```
function socket.close_all(id) end

--- sntp时间同步
---@tag LUAT_USE_SNTP
---@param sntp_server string|table sntp服务器地址 选填
---@param adapter number 适配器序号,请参考socket库的常量表
--- ```lua
--- socket.sntp()
--- socket.sntp("ntp.aliyun.com") --自定义sntp服务器地址
--- socket.sntp({"ntp.aliyun.com","ntp1.aliyun.com","ntp2.aliyun.com"}) --sntp自定义服务器地址
--- socket.sntp(nil, socket.ETH0) --sntp自定义适配器序号
--- sys.subscribe("NTP_UPDATE", function()
---     log.info("sntp", "time", os.date())
--- end)
--- sys.subscribe("NTP_ERROR", function()
---     log.info("socket", "sntp error")
---     socket.sntp()
--- end)
--- ```
function socket.sntp(sntp_server, adapter) end

--- 网络对时后的时间戳(ms级别)
---@return table #1 包含时间信息的数据
--- ```lua
--- 本API于 2023.11.15 新增
--- 注意, 本函数在执行socket.sntp()且获取到NTP时间后才有效
--- 而且是2次sntp之后才是比较准确的值
--- 网络波动越小, 该时间戳越稳定
--- local tm = socket.ntptm()
--- 对应的table包含多个数据, 均为整数值
--- 标准数据
--- tsec 当前秒数,从1900.1.1 0:0:0 开始算, UTC时间
--- tms  当前毫秒数
--- vaild 是否有效, true 或者 nil
--- 调试数据, 调试用,一般用户不用管
--- ndelay 网络延时平均值,单位毫秒
--- ssec 系统启动时刻与1900.1.1 0:0:0的秒数偏移量
--- sms 系统启动时刻与1900.1.1 0:0:0的毫秒偏移量
--- lsec 本地秒数计数器,基于mcu.tick64()
--- lms 本地毫秒数计数器,基于mcu.tick64()
--- log.info("tm数据", json.encode(tm))
--- log.info("时间戳", string.format("%u.%03d", tm.tsec, tm.tms))
--- ```
function socket.ntptm() end

--- 设置SNTP服务器的端口号
---@param port number port 端口号, 默认123
---@return number #1 返回当前的端口号
--- ```lua
--- 本函数于2024.5.17新增
--- 大部分情况下不需要设置NTP服务器的端口号,默认123即可
--- ```
function socket.sntp_port(port) end
