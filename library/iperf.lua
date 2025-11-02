---@meta

--- LuatOS IDE Helper for module: iperf
--- ```yaml
--- Summary: 吞吐量测试
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/network/iperf/binding/luat_lib_iperf.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_IPERF
--- ```
--- ```lua
--- 支持server模式, 也支持client模式
--- 注意, 支持的是 iperf2, 不支持 iperf3
--- ```
iperf = {}

--- 启动server模式
---@param id number 网络适配器的id, 必须填, 例如 socket.LWIP_ETH
---@param port number 监听的端口, 可选, 默认5001
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- 启动server模式, 监听5001端口
--- 注意, 该网卡必须已经联网成功, 并且有ip地址
--- if iperf then
---     log.info("启动iperf服务器端")
---     iperf.server(socket.LWIP_ETH)
--- end
--- 测试结果回调
--- sys.subscribe("IPERF_REPORT", function(bytes, ms_duration, bandwidth)
---     log.info("iperf", bytes, ms_duration, bandwidth)
--- end)
--- ```
function iperf.server(id, port) end

--- 启动client模式
---@param id number 网络适配器的id, 必须填, 例如 socket.LWIP_ETH0
---@param ip string 远程服务器的ip, 只能是ipv4地址,不支持域名!!! 必须填值
---@param port number 远程服务器的端口, 可选, 默认5001
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- 启动client模式, 连接服务器的5001端口
--- 注意, 该网卡必须已经联网成功, 并且有ip地址
--- if iperf then
---     log.info("启动iperf客户端端")
--- 47.94.236.172 是演示服务器, 不一定有开启
---     iperf.client(socket.LWIP_ETH, "47.94.236.172")
---     sys.wait(60*1000)
--- 测试完成停掉
---     iperf.abort()
--- end
--- 测试结果回调
--- sys.subscribe("IPERF_REPORT", function(bytes, ms_duration, bandwidth)
---     log.info("iperf", bytes, ms_duration, bandwidth)
--- end)
--- ```
function iperf.client(id, ip, port) end

--- 关闭iperf
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- 关闭已经启动的server或者client
--- ```
function iperf.abort() end
