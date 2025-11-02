---@meta

--- LuatOS IDE Helper for module: lora2
--- ```yaml
--- Summary: lora2驱动模块(支持多挂)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/lora2/luat_lib_lora.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/lora
--- Video: 
--- Tag: LUAT_USE_LORA2
--- ```
lora2 = {}
lora_device = {}

--- SLEEP模式 (number)
lora2.SLEEP = 0

--- STANDBY模式 (number)
lora2.STANDBY = 0

--- lora初始化
---@param ic string lora 型号，当前支持：<br>llcc68<br>sx1268
---@param loraconfig table lora配置参数,与具体设备有关
---@param spiconfig any 
---@return userdata #1 若成功会返回lora对象,否则返回nil
--- ```lua
--- spi_lora = spi.deviceSetup(spi_id,pin_cs,0,0,8,10*1000*1000,spi.MSB,1,0)
--- lora_device = lora2.init("llcc68",{res = pin_reset,busy = pin_busy,dio1 = pin_dio1},spi_lora)
--- ```
function lora2.init(ic, loraconfig, spiconfig) end

--- 设置频道频率
---@param freq number 频率
--- ```lua
--- lora_device:set_channel(433000000)
--- ```
function lora_device:set_channel(freq) end

--- lora配置发送参数
---@param txconfig table lora发送配置参数,与具体设备有关
--- ```lua
--- lora_device:set_txconfig(
---     {
---         mode=1,
---         power=22,
---         fdev=0,
---         bandwidth=0,
---         datarate=9,
---         coderate=4,
---         preambleLen=8,
---         fixLen=false,
---         crcOn=true,
---         freqHopOn=0,
---         hopPeriod=0,
---         iqInverted=false,
---         timeout=3000
---     }
--- )
--- ```
function lora_device:set_txconfig(txconfig) end

--- lora配置接收参数
---@param set_rxconfig table lora接收配置参数,与具体设备有关
--- ```lua
--- lora_device:set_rxconfig(
---     {
---         mode=1,
---         bandwidth=0,
---         datarate=9,
---         coderate=4,
---         bandwidthAfc=0,
---         preambleLen=8,
---         symbTimeout=0,
---         fixLen=false,
---         payloadLen=0,
---         crcOn=true,
---         freqHopOn=0,
---         hopPeriod=0,
---         iqInverted=false,
---         rxContinuous=false
---     }
--- )
--- ```
function lora_device:set_rxconfig(set_rxconfig) end

--- 发数据
---@param data string 写入的数据
--- ```lua
--- lora_device:send("PING")
--- ```
function lora_device:send(data) end

--- 开启收数据
---@param timeout number 超时时间，默认1000 单位ms
--- ```lua
--- sys.subscribe("LORA_RX_DONE", function(data, size)
---     log.info("LORA_RX_DONE: ", data, size)
---     lora_device:send("PING")
--- end)
--- lora_device:recv(1000)
--- ```
function lora_device:recv(timeout) end

--- 设置进入模式(休眠，正常等)
---@param mode number 模式 正常模式:lora.STANDBY 休眠模式:lora.SLEEP 默认为正常模式
--- ```lua
--- lora_device:mode(lora.STANDBY)
--- ```
function lora_device:mode(mode) end

--- 注册lora回调
---@param cb function cb lora回调,参数包括lora_device, event, data, size
---@return nil #1 无返回值
--- ```lua
--- lora_device:on(function(lora_device, event, data, size)
---     log.info("lora", "event", event, lora_device, data, size)
---     if event == "tx_done" then
---         lora_device:recv(1000)
---     elseif event == "rx_done" then
---         lora_device:send("PING")
---     elseif event == "tx_timeout" then
---     elseif event == "rx_timeout" then
---         lora_device:recv(1000)
---     elseif event == "rx_error" then
---     end
--- end)
--- [[
--- event可能出现的值有
---     tx_done         -- 发送完成
---     rx_done         -- 接收完成
---     tx_timeout      -- 发送超时
---     rx_timeout      -- 接收超时
---     rx_error        -- 接收错误
--- ]]
--- ```
function lora_device:on(cb) end
