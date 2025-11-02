---@meta

--- LuatOS IDE Helper for module: lora
--- ```yaml
--- Summary: lora驱动模块
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/lora/luat_lib_lora.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/lora
--- Video: 
--- Tag: LUAT_USE_LORA
--- ```
lora = {}

--- SLEEP模式 (number)
lora.SLEEP = 0

--- STANDBY模式 (number)
lora.STANDBY = 0

--- lora初始化
---@param ic string lora 型号，当前支持：<br>llcc68<br>sx1268
---@param loraconfig table lora配置参数,与具体设备有关
---@param spiconfig any 
--- ```lua
--- lora.init("llcc68",
---     {
---         id = 0,           -- SPI id
---         cs = 8,    -- SPI 片选的GPIO号,如果没有pin库,填GPIO数字编号就行
---         res = 20,   -- 复位脚连接的GPIO号,如果没有pin库,填GPIO数字编号就行
---         busy = 21,  -- 忙检测脚的GPIO号
---         dio1 = 25,  -- 数据输入中断脚
---         lora_init = true  -- 是否发送初始化命令. 如果是唤醒后直接读取, 就传false
---     }
--- )
--- ```
function lora.init(ic, loraconfig, spiconfig) end

--- 设置频道频率
---@param freq number 频率
--- ```lua
--- lora.set_channel(433000000)
--- ```
function lora.set_channel(freq) end

--- lora配置发送参数
---@param ic string lora 型号，当前支持：<br>llcc68<br>sx1268
---@param txconfig table lora发送配置参数,与具体设备有关
--- ```lua
--- lora.set_txconfig("llcc68",
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
function lora.set_txconfig(ic, txconfig) end

--- lora配置接收参数
---@param ic string lora 型号，当前支持：<br>llcc68<br>sx1268
---@param set_rxconfig table lora接收配置参数,与具体设备有关
--- ```lua
--- lora.set_rxconfig("llcc68",
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
function lora.set_rxconfig(ic, set_rxconfig) end

--- 发数据
---@param data string 写入的数据
--- ```lua
--- lora.send("PING")
--- ```
function lora.send(data) end

--- 开启收数据
---@param timeout number 超时时间，默认1000 单位ms
--- ```lua
--- sys.subscribe("LORA_RX_DONE", function(data, size)
---     log.info("LORA_RX_DONE: ", data, size)
---     lora.send("PING")
--- end)
--- 老版本没有recv, 可以改成 lora.recive
--- lora.recv(1000)
--- ```
function lora.recv(timeout) end

--- 设置进入模式(休眠，正常等)
---@param mode number 模式 正常模式:lora.STANDBY 休眠模式:lora.SLEEP 默认为正常模式
--- ```lua
--- lora.mode(lora.STANDBY)
--- ```
function lora.mode(mode) end
