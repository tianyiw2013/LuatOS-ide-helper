---@meta

--- LuatOS IDE Helper for module: wlan
--- ```yaml
--- Summary: wifi操作
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/wlan/luat_lib_wlan.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/wlan
--- Video: 
--- Tag: LUAT_USE_WLAN
--- ```
--- ```lua
--- [[
--- 提醒:
--- 对于仅支持wifiscan的模块, 仅 init/scan/scanResult 函数是可用的
--- 例如: Air780EXXX等仅支持wifiscan
--- ]]
--- ```
wlan = {}

--- V1 (esptouch配网,)
wlan.ESPTOUCH = 0

--- 微信常用 (Airkiss配网,)
wlan.AIRKISS = 0

--- V2, 未测试 (esptouch配网,)
wlan.ESPTOUCH_V2 = 0

--- 初始化
---@return boolean #1 成功返回true,否则返回false
function wlan.init() end

--- 设置wifi模式
---@param mode number wifi模式
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- 设置为AP模式, 广播ssid, 接收wifi客户端的链接
--- wlan.setMode(wlan.AP)
--- 设置为STATION模式, 也是初始化后的默认模式
--- wlan.setMode(wlan.STATION)
--- 混合模式, 做AP又做STATION
--- wlan.setMode(wlan.APSTA)
--- ```
function wlan.setMode(mode) end

--- 作为STATION时,是否已经连接上AP,且获取IP成功
---@return boolean #1 已经连接成功返回true,否则返回false
function wlan.ready() end

--- 作为STATION时,连接到指定AP
---@param ssid string AP的ssid
---@param password string AP的password,可选
---@param auto_reconnect number 0关闭自动重连,1开启自动重连.当前强制开启自动重连
---@param bssid string AP的bssid,可选,必须是6字节
---@return boolean #1 发起连接成功返回true,否则返回false.注意,不代表连接AP成功!!
--- ```lua
--- 普通模式,带密码
--- wlan.connect("myap", "12345678")
--- 普通模式,不带密码
--- wlan.connect("myap")
--- 特殊模式, 重用之前的ssid和密码,本次直接连接
--- 注意, 前提是本次上电后已经传过ssid和或password,否则必失败
--- wlan.connect()
--- 特殊模式, 使用ssid和密码,本次连接指定bssid, 2024.5.7新增
--- local bssid = string.fromHex("00182946365f")
--- wlan.connect("myap", "12345678", 1, bssid)
--- ```
function wlan.connect(ssid, password, auto_reconnect, bssid) end

--- 作为STATION时,断开AP
function wlan.disconnect() end

--- 扫描wifi频段
--- ```lua
--- 注意, wlan.scan()是异步API,启动扫描后会马上返回
--- wifi扫描成功后, 会有WLAN_SCAN_DONE消息, 读取即可
--- sys.subscribe("WLAN_SCAN_DONE", function ()
---     local results = wlan.scanResult()
---     log.info("scan", "results", #results)
---     for k,v in pairs(results) do
---         log.info("scan", v["ssid"], v["rssi"], (v["bssid"]:toHex()))
---     end
--- end)
--- 下面演示的是初始化wifi后定时扫描,请按实际业务需求修改
--- sys.taskInit(function()
---     sys.wait(1000)
---     wlan.init()
---     while 1 do
---         wlan.scan()
---         sys.wait(15000)
---     end
--- end)
--- ```
function wlan.scan() end

--- 获取wifi扫描结果
---@return table #1 扫描结果
--- ```lua
--- 用法请查阅 wlan.scan() 函数
--- ```
function wlan.scanResult() end

--- 配网
---@param mode number 配网模式, 默认为esptouch, 若传0则主动停止配网
---@return boolean #1 启动成功或停止成功, 返回true, 否则返回false
--- ```lua
--- wlan.smartconfig()
--- local ret, ssid, passwd = sys.waitUntil("SC_RESULT", 180*1000) -- 最多等3分钟
--- log.info("sc", ret, ssid, passwd)
--- 详细用法请查看demo
--- ```
function wlan.smartconfig(mode) end

--- 获取mac
---@param tp number 设置何种mac地址,对ESP32系列来说,只能设置STA的地址,即0,默认值也是0
---@param hexstr boolean 是否转HEX字符, 默认是true,即输出hex字符串
---@return string #1 MAC地址,十六进制字符串形式 "AABBCCDDEEFF" 或原始数据
function wlan.getMac(tp, hexstr) end

--- 设置mac
---@param tp number 设置何种mac地址,对ESP32系列来说,只能设置STA的地址,即0
---@param mac string 待设置的MAC地址,长度6字节
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- 设置MAC地址, 2023-03-01之后编译的固件可用
--- local mac = string.fromHex("F01122334455")
--- wlan.setMac(0, mac)
--- 部分模块支持恢复默认MAC, 例如esp32系列
--- 在2023-11-01 之后编译的固件可用
--- local mac = string.fromHex("000000000000")
--- wlan.setMac(0, mac)
--- ```
function wlan.setMac(tp, mac) end

--- 获取ip,仅STATION或APSTA模式下有意义
---@return string #1 ip地址,当前仅返回ipv4地址,例如 "192.168.1.25"
function wlan.getIP() end

--- 启动AP
---@param ssid string AP的SSID,必填
---@param passwd string AP的密码,可选
---@param gateway string AP的网关地址, 默认192.168.4.1
---@param netmask string AP的网关掩码, 默认255.255.255.0
---@param channel number AP建立的通道, 默认6
---@param opts table AP的配置选项, 可选
---@return boolean #1 成功创建返回true,否则返回false
--- ```lua
--- 注意, 调用本AP时,若wifi模式为STATION,会自动切换成 APSTA
--- wlan.createAP("luatos1234", "12341234")
--- 设置网关IP,掩码, 通道, 2023.7.13 新增, BSP未必支持
--- wlan.createAP("luatos1234", "12341234", "192.168.4.1", "255.255.255.0", 6)
--- opts更多配置项, 2024.3.5新增
--- [[
--- {
---     hidden = false, -- 是否隐藏SSID, 默认false,不隐藏
---     max_conn = 4 -- 最大客户端数量, 默认4
--- }
--- ]]
--- ```
function wlan.createAP(ssid, passwd, gateway, netmask, channel, opts) end

--- 关闭AP功能
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- wlan.stopAP()
--- ```
function wlan.stopAP() end

--- 获取信息,如AP的bssid,信号强度, STA联网后可获取
---@return table #1 详情,键值对形式
--- ```lua
--- log.info("wlan", "info", json.encode(wlan.getInfo()))
--- [[
--- 典型输出
--- {
---     "bssid" : "xxxxxx",
---     "rssi"  : -89,
---     "gw" : "192.168.1.1"
--- }
--- ]]
--- ```
function wlan.getInfo() end

--- 读取或设置省电模式
---@param mode number 省电模式,可选, 传入就是设置, 例如wlan.PS_NONE
---@return number #1 当前省电模式/设置后的省电模式
--- ```lua
--- 请查阅常量表  PS_NONE/PS_MIN_MODEM/PS_MAX_MODEM
--- log.info("wlan", "PS", wlan.powerSave(wlan.PS_NONE))
--- 本API于 2023.03.31 新增
--- ```
function wlan.powerSave(mode) end

--- 读取或设置Hostname
---@param id number STA为0, AP为1. 本参数需要2025.2.25及之后编译的固件
---@param new_name string 新的hostname,可选, 传入就是设置
---@return string #1 当前的hostname或者设置后的hostname
--- ```lua
--- 本API于 2023.07.23 新增
--- 本函数应该在wlan.init之前设置好, 最晚应早于wlan.connect
--- hostname的默认值是  "LUATOS_" + 设备的MAC值
--- 例如: LUATOS_0022EECC2399
--- 老写法, 直接设置STA的hostname
--- wlan.hostname("我的wifi物联网设备")
--- 新的API, 支持设置STA或AP的hostname, 也可以分别取
--- wlan.hostname(1, "myhost")
--- wlan.hostname(0) -- 取STA的hostname
--- ```
function wlan.hostname(id, new_name) end

--- 设置Station模式下的IP获取模式
---@param dhcp_enable boolean 是否启用DHCP,默认是true
---@param ip string 本机IP地址,例如192.168.2.200, 禁用DHCP时必填
---@param netmask string 本机IP掩码,例如255.255.255.0, 禁用DHCP时必填
---@param gateway string 本机IP网关,例如192.168.2.1, 禁用DHCP时必填
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- 本API于 2023.10.06 新增
--- 本函数需要在wlan.init之后才允许调用
--- 启用DHCP, 默认也是启用DHCP,这里是演示API使用
--- wlan.staIp(true)
--- 禁用DHCP,自行设置IP/掩码/网关
--- wlan.staIp(false, "192.168.2.200", "255.255.255.0", "192.168.2.1")
--- ```
function wlan.staIp(dhcp_enable, ip, netmask, gateway) end
