---@meta

--- LuatOS IDE Helper for module: ulwip
--- ```yaml
--- Summary: 用户空间的lwip集成(开发中)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/network/ulwip/binding/luat_lib_ulwip.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_ULWIP
--- ```
--- ```lua
--- [[
--- 注意: 本库处于开发中, 接口随时可能变化
--- 用户空间的LWIP集成, 用于支持lwip的netif的网络集成, 实现在lua代码中直接控制MAC包/IP包的收发
--- 总体数据路径如下
--- lua代码 -> ulwip.input -> lwip(netif->input) -> lwip处理逻辑 -> luatos socket框架
--- lua代码 <- ulwip回调函数 <- lwip(netif->low_level_output) <- lwip处理逻辑 <- luatos socket框架
--- 应用示例:
--- 1. Air601的wifi模块作为被控端, 通过UART/SPI收发MAC包, 实现Air780E/Air780EP集成wifi模块的功能
--- 2. 使用W5500/CH395/ENC28J60等以太网模块, 在用户lua代码中控制其mac包收发, 并集成到luatos socket框架中
--- 3. 通过蓝牙模块,集成lowpan6
--- 开发中, 请关注 https://github.com/wendal/xt804-spinet
--- ]]
--- ```
ulwip = {}

--- 初始化lwip netif
---@param adapter_index number adapter_index 适配器编号
---@param mac string mac 网卡mac地址
---@param output_lua_ref function output_lua_ref 回调函数, 参数为(adapter_index, data)
---@param opts table 额外参数, 例如 {mtu=1500, flags=(ulwip.FLAG_BROADCAST | ulwip.FLAG_ETHARP)}
---@return boolean #1 成功与否
--- ```lua
--- 初始化一个适配器, 并设置回调函数
--- ulwip.setup(socket.LWIP_STA, string.fromHex("18fe34a27b69"), function(adapter_index, data)
---     log.info("ulwip", "output_lua_ref", adapter_index, data:toHex())
--- end)
--- 注意, setup之后, netif的状态是down, 调用ulwip.updown(adapter_index, true)后, 才能正常收发数据
--- 额外参数配置table可选值
--- mtu, 默认1460
--- flags, 默认 ulwip.FLAG_BROADCAST | ulwip.FLAG_ETHARP | ulwip.FLAG_ETHERNET | ulwip.FLAG_IGMP | ulwip.FLAG_MLD6
--- zbuff_out 回调函数接受zbuff作为参数, 默认false
--- reverse 本地lwip设备,翻转调用逻辑, 默认false, 这个参数是为了拦截当前设备的硬件联网数据所设计的
--- ```
function ulwip.setup(adapter_index, mac, output_lua_ref, opts) end

--- 设置netif的状态
---@param adapter_index number adapter_index 适配器编号
---@param up boolean up true为up, false为down
---@return boolean #1 成功与否
--- ```lua
--- 参考ulwip.setup
--- ```
function ulwip.updown(adapter_index, up) end

--- 设置netif的物理链路状态
---@param adapter_index number adapter_index 适配器编号
---@param up boolean up true为up, false为down
---@return boolean #1 当前状态
--- ```lua
--- 参考ulwip.setup
--- ```
function ulwip.link(adapter_index, up) end

--- 往netif输入数据
---@param adapter_index number adapter_index 适配器编号
---@param data string|userdata data 输入的数据
---@param len number 如果data是zbuff, len默认是zbuff的used, 对string无效
---@param offset number 如果data是zbuff, offset为数据起始位置, 默认是0, 对string无效
---@return boolean #1 成功与否
--- ```lua
--- 参考ulwip.setup
--- ```
function ulwip.input(adapter_index, data, len, offset) end

--- 启动或关闭dhcp
---@param adapter_index number adapter_index 适配器编号
---@param up boolean up true为启动, false为关闭
---@return boolean #1 当前状态
--- ```lua
--- 参考ulwip.setup
--- ```
function ulwip.dhcp(adapter_index, up) end

--- 设置或获取ip信息
---@param adapter_index number adapter_index 适配器编号
---@param ip string ip IP地址, 仅获取时可以不填
---@param netmask string netmask 子网掩码, 仅获取时可以不填
---@param gw string gw 网关地址, 仅获取时可以不填
---@return string #1 ip地址, 子网掩码, 网关地址
--- ```lua
--- 获取现有值
--- local ip, netmask, gw = ulwip.ip(socket.LWIP_STA)
--- 设置新值
--- ulwip.ip(socket.LWIP_STA, "192.168.0.1", "255.255.255.0", "192.168.0.1")
--- ```
function ulwip.ip(adapter_index, ip, netmask, gw) end

--- 将netif注册到luatos socket中
---@param adapter_index number adapter_index 适配器编号
---@return boolean #1 成功与否
--- ```lua
--- 参考ulwip.setup
--- ```
function ulwip.reg(adapter_index) end

--- 操作XT804进行SPI快速收发
---@param spi_id number spi_id SPI的ID号
---@param cs_pin number cs_pin CS脚的GPIO号
---@param addr number addr 寄存器地址
---@param zbuff zbuff zbuff对象
---@param len number len 长度
---@param offset number offset 偏移量, 默认buff:used()
---@param auto_seek boolean auto_seek 是否自动移动偏移量, 默认false
---@param auto_len number auto_len 自动分片长度, 默认按寄存器自动选择
---@return nil #1 无返回值
--- ```lua
--- 本函数属于辅助函数
--- ```
function ulwip.xt804_xfer(spi_id, cs_pin, addr, zbuff, len, offset, auto_seek, auto_len) end
