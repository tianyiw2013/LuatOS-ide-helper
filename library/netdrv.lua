---@meta

--- LuatOS IDE Helper for module: netdrv
--- ```yaml
--- Summary: 网络设备管理
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/network/netdrv/binding/luat_lib_netdrv.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/netdrv
--- Video: 
--- Tag: LUAT_USE_NETDRV
--- ```
netdrv = {}

--- 南京沁恒CH390系列,支持CH390D/CH390H, SPI通信 (number)
netdrv.CH390 = 0

--- 虚拟网卡 (number)
netdrv.WHALE = 0

--- 控制类型-复位,当前仅支持CH390H (number)
netdrv.CTRL_RESET = 0

--- 请求对网卡硬复位,当前仅支持CH390H (number)
netdrv.RESET_HARD = 0

--- 请求对网卡软复位,当前仅支持CH390H (number)
netdrv.RESET_SOFT = 0

--- 事件类型-socket事件 (number)
netdrv.EVT_SOCKET = 0

--- 初始化指定netdrv设备
---@param id number 网络适配器编号, 例如 socket.LWIP_ETH
---@param tp number 实现方式,如果是设备自带的硬件,那就不需要传, 外挂设备需要传,当前支持CH390H/D
---@param opts number 外挂方式,需要额外的参数,参考示例
---@return boolean #1 初始化成功与否
--- ```lua
--- Air8101初始化内部以太网控制器
--- netdrv.setup(socket.LWIP_ETH)
--- Air8000/Air780EPM初始化CH390H/D作为LAN/WAN
--- 支持多个CH390H, 使用不同的CS脚区分不同网口
--- netdrv.setup(socket.LWIP_ETH, netdrv.CH390, {spi=0,cs=8})
--- netdrv.dhcp(socket.LWIP_ETH, true)
--- 支持CH390H的中断模式, 能提供响应速度, 但是需要外接中断引脚
--- 实测对总网速没有帮助, 轻负载时能降低功耗, 让模组能进入低功耗模式
--- netdrv.setup(socket.LWIP_ETH, netdrv.CH390, {spi=0,cs=8,irq=20})
--- ```
function netdrv.setup(id, tp, opts) end

--- 开启或关闭DHCP
---@param id number 网络适配器编号, 例如 socket.LWIP_ETH
---@param enable boolean 开启或者关闭
---@param name string dhcp主机名称, 可选, 最长31字节，填""清除
---@return boolean #1 成功与否
function netdrv.dhcp(id, enable, name) end

--- 设置或获取设备MAC
---@param id number 网络适配器编号, 例如 socket.LWIP_ETH
---@param new_mac string 新的MAC地址,可选, 必须是6个字节
---@param raw_string boolean 是否返回6字节原始数据, 默认是否, 返回HEX字符串
---@return boolean #1 成功与否
--- ```lua
--- 获取MAC地址
--- log.info("netdrv", "mac addr", netdrv.mac(socket.LWIP_ETH))
--- 暂不支持设置
--- ```
function netdrv.mac(id, new_mac, raw_string) end

--- 设置或读取ipv4地址
---@param id number 网络适配器编号, 例如 socket.LWIP_ETH
---@param addr string ipv4地址,如果是读取就不需要传
---@param mark string 掩码
---@param gw string 网关
---@return string #1 ipv4地址
---@return string #2 掩码
---@return string #3 网关
--- ```lua
--- 注意, 不是所有netdrv都支持设置的, 尤其4G Cat.1自带的netdrv就不能设置ipv4
--- 注意, 设置ipv4时, DHCP要处于关闭状态!!
--- 当前设置ip但ip值非法, 不返回任何东西
--- 如果设置ip且ip值合法, 会返回ip, mask, gw
--- ```
function netdrv.ipv4(id, addr, mark, gw) end

--- 开启或关闭NAPT
---@param id number 网关适配器的id
---@return boolean #1 合法值就返回true, 否则返回nil
--- ```lua
--- 使用4G网络作为主网关出口
--- netdrv.napt(socket.LWIP_GP)
--- 关闭napt功能
--- netdrv.napt(-1)
--- ```
function netdrv.napt(id) end

--- 获取netdrv的物理连接状态
---@param id number netdrv的id, 例如 socket.LWIP_ETH
---@return boolean #1 已连接返回true, 否则返回false. 如果id对应的netdrv不存在,返回nil
--- ```lua
--- 注意, 本函数仅支持读取, 而且不能ip状态, 即是否能联网
--- ```
function netdrv.link(id) end

--- 获取netdrv的网络状态
---@param id number netdrv的id, 例如 socket.LWIP_ETH
---@return boolean #1 已连接返回true, 否则返回false. 如果id对应的netdrv不存在,返回nil
--- ```lua
--- 注意, 本函数仅支持读取, 即判断是否能通信, 不代表IP状态
--- ```
function netdrv.ready(id) end

--- 给具体的驱动发送控制指令
---@param id number 网络适配器编号, 例如 socket.LWIP_ETH
---@param cmd number 指令, 例如 netdrv.CTRL_RESET
---@param arg number 参数, 例如 netdrv.RESET_HARD
---@return boolean #1 成功与否
--- ```lua
--- 重启网卡, 仅CH390H支持, 其他网络设备暂不支持
--- 本函数于 2025.4.14 新增
--- netdrv.ctrl(socket.LWIP_ETH, netdrv.CTRL_RESET, netdrv.RESET_HARD)
--- ```
function netdrv.ctrl(id, cmd, arg) end

--- 设置调试信息输出
---@param id number 网络适配器编号, 例如 socket.LWIP_ETH, 如果传0就是全局调试开关
---@param enable boolean 是否开启调试信息输出
---@return boolean #1 成功与否
--- ```lua
--- 打开netdrv全局调试开关
--- netdrv.debug(0, true)
--- ```
function netdrv.debug(id, enable) end

--- 设置遥测功能，开启后，会自动上报设备信息，2025/9/25启用
---@param config string 配置项
---@param value boolean 设置功能开关
---@return boolean #1 成功与否
--- ```lua
--- 设置开启与关闭
--- netdrv.mreport("enable", true)
--- netdrv.mreport("enable", false)
--- 设置使用的网络适配器，2025/10/30启用
--- netdrv.mreport("adapter_id", socket.LWIP_GP)
--- netdrv.mreport("adapter_id", socket.LWIP_STA)
--- netdrv.mreport("adapter_id", socket.LWIP_ETH)
--- 立即上报一次, 无参数的方式调用
--- netdrv.mreport()
--- ```
function netdrv.mreport(config, value) end

--- 发起ping(异步的)
---@param id number 网络适配器的id
---@param ip string 目标ip地址,不支持域名!!
---@param len number ping包大小,默认128字节,可以不传
---@return boolean #1 成功与否, 仅代表发送与否,不代表服务器已经响应
--- ```lua
--- 本功能在2025.9.3新增
--- sys.taskInit(function()
--- 要等联网了才能ping
---     sys.waitUntil("IP_READY")
---     sys.wait(1000)
---     while 1 do
--- 必须指定使用哪个网卡
---         netdrv.ping(socket.LWIP_GP, "121.14.77.221")
---         sys.waitUntil("PING_RESULT", 3000)
---         sys.wait(3000)
---     end
--- end)
--- sys.subscribe("PING_RESULT", function(id, time, dst)
---     log.info("ping", id, time, dst);
--- end)
--- ```
function netdrv.ping(id, ip, len) end

--- 订阅网络事件
---@param adapter_id number 网络适配器的id
---@param event_type number 事件总类型, 当前支持 netdrv.EVT_SOCKET
---@param callback function 回调函数 function(id, event, params)
---@return boolean #1 成功与否,成功返回true,否则返回nil
--- ```lua
--- 订阅socket连接状态变化事件
--- netdrv.on(socket.LWIP_ETH, netdrv.EVT_SOCKET, function(id, event, params)
--- id 是网络适配器id
--- event是事件id, 字符串类型, 
---         - create 创建socket对象
---         - release 释放socket对象
---         - connecting 正在连接, 域名解析成功后出现
---         - connected 连接成功, TCP三次握手成功后出现
---         - closed 连接关闭
---         - remote_close 远程关闭, 网络中断,或者服务器主动断开
---         - timeout dns解析超时,或者tcp连接超时
---         - error 错误,包括一切异常错误
--- params是参数表
---         - remote_ip 远端ip地址,未必存在
---         - remote_port 远端端口,未必存在
---         - online_ip 实际连接的ip地址,未必存在
---         - domain_name 远端域名,如果是通过域名连接的话, release时没有这个值, create时也没有
---     log.info("netdrv", "socket event", id, event, json.encode(params or {}))
---     if params then
--- params里会有remote_ip, remote_port等信息, 可按需获取
---         local remote_ip = params.remote_ip
---         local remote_port = params.remote_port
---         local domain_name = params.domain_name
---         log.info("netdrv", "socket event", "remote_ip", remote_ip, "remote_port", remote_port, "domain_name", domain_name)
---     end
--- end)
--- ```
function netdrv.on(adapter_id, event_type, callback) end
