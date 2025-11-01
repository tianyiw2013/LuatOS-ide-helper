local lora_device = {}

--lora_device:set_channel(freq) - 设置频道频率
--传入值：
--number 频率
--例子：
--lora_device:set_channel(433000000)
function lora_device:set_channel(freq) end

--lora_device:set_txconfig(txconfig) - lora配置发送参数
--传入值：
--table lora发送配置参数,与具体设备有关
--例子：
--lora_device:set_txconfig(
--    {
--        mode=1,
--        power=22,
--        fdev=0,
--        bandwidth=0,
--        datarate=9,
--        coderate=4,
--        preambleLen=8,
--        fixLen=false,
--        crcOn=true,
--        freqHopOn=0,
--        hopPeriod=0,
--        iqInverted=false,
--        timeout=3000
--    }
--)
function lora_device:set_txconfig(txconfig) end

--lora_device:set_rxconfig(set_rxconfig) - lora配置接收参数
--传入值：
--table lora接收配置参数,与具体设备有关
--例子：
--lora_device:set_rxconfig(
--    {
--        mode=1,
--        bandwidth=0,
--        datarate=9,
--        coderate=4,
--        bandwidthAfc=0,
--        preambleLen=8,
--        symbTimeout=0,
--        fixLen=false,
--        payloadLen=0,
--        crcOn=true,
--        freqHopOn=0,
--        hopPeriod=0,
--        iqInverted=false,
--        rxContinuous=false
--    }
--)
function lora_device:set_rxconfig(set_rxconfig) end

--lora_device:send(data) - 发数据
--传入值：
--string 写入的数据
--例子：
--lora_device:send("PING")
function lora_device:send(data) end

--lora_device:recv(timeout) - 开启收数据
--传入值：
--number 超时时间，默认1000 单位ms
--例子：
--sys.subscribe("LORA_RX_DONE", function(data, size)
--    log.info("LORA_RX_DONE: ", data, size)
--    lora_device:send("PING")
--end)
--lora_device:recv(1000)
function lora_device:recv(timeout) end

--lora_device:mode(mode) - 设置进入模式(休眠，正常等)
--传入值：
--number 模式 正常模式:lora.STANDBY 休眠模式:lora.SLEEP 默认为正常模式
--例子：
--lora_device:mode(lora.STANDBY)
function lora_device:mode(mode) end

--lora_device:on(cb) - 注册lora回调
--传入值：
--function cb lora回调,参数包括lora_device, event, data, size
--返回值：
--nil 无返回值
--例子：
--lora_device:on(function(lora_device, event, data, size)
--    log.info("lora", "event", event, lora_device, data, size)
--    if event == "tx_done" then
--        lora_device:recv(1000)
--    elseif event == "rx_done" then
--        lora_device:send("PING")
--    elseif event == "tx_timeout" then
--
--    elseif event == "rx_timeout" then
--        lora_device:recv(1000)
--    elseif event == "rx_error" then
--
--    end
--end)
----[[
--event可能出现的值有
--    tx_done         -- 发送完成
--    rx_done         -- 接收完成
--    tx_timeout      -- 发送超时
--    rx_timeout      -- 接收超时
--    rx_error        -- 接收错误
--]]
function lora_device:on(cb) end