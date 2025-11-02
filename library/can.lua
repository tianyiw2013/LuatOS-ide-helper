---@meta

--- LuatOS IDE Helper for module: can
--- ```yaml
--- Summary: can操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_can.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/can
--- Video: 
--- Tag: LUAT_USE_CAN
--- ```
--- ```lua
--- [[
--- 错误码介绍
--- 错误码由4byte组成小端格式的uint32
--- byte3预留无意义
--- byte2方向，0TX 1RX
--- byte1类型，0bit 1form 2stuff
--- byte0位置：
--- 0x03 start of frame
--- 0x02 extended: ID bits 28 - 21, standard:  10 - 3
--- 0x06 extended: ID bits 20 - 18, standard:  2 - 0
--- 0x04 extended: substitute RTR, standard: RTR
--- 0x05 identifier extension
--- 0x07 extended: ID bits 17 - 13
--- 0x0f extended: ID bits 12 - 5
--- 0x0e extended: ID bits 4 - 0
--- 0x0C RTR
--- 0x0D reserved bit 1
--- 0x09 reserved bit 0
--- 0x0b data length code
--- 0x0a data section
--- 0x08 CRC sequence
--- 0x18 CRC delimiter
--- 0x19 ACK slot
--- 0x1b ACK delimiter
--- 0x1a end of frame
--- 0x12 intermission
--- 0x00 unspecified
--- ]]
--- ```
can = {}

--- 正常工作模式 (number)
can.MODE_NORMAL = 0

--- 监听模式 (number)
can.MODE_LISTEN = 0

--- 自测模式 (number)
can.MODE_TEST = 0

--- 休眠模式 (number)
can.MODE_SLEEP = 0

--- 停止工作状态 (number)
can.STATE_STOP = 0

--- 主动错误状态，一般都是这个状态 (number)
can.STATE_ACTIVE = 0

--- 被动错误状态，总线上错误多会进入这个状态，但是还能正常收发 (number)
can.STATE_PASSIVE = 0

--- 离线状态，总线上错误非常多会进入这个状态，不能收发，需要手动退出 (number)
can.STATE_BUSOFF = 0

--- 监听状态，选择监听模式时进入这个状态 (number)
can.STATE_LISTEN = 0

--- 自收自发状态，选择自测模式时进入这个状态 (number)
can.STATE_TEST = 0

--- 休眠状态，选择休眠模式时进入这个状态 (number)
can.STATE_SLEEP = 0

--- 回调消息类型，有新数据写入缓存 (number)
can.CB_MSG = 0

--- 回调消息类型，数据发送结束，需要根据后续param确定发送成功还是失败 (number)
can.CB_TX = 0

--- 回调消息类型，有错误报告，后续param是错误码，具体见错误码介绍 (number)
can.CB_ERR = 0

--- 回调消息类型，总线状态变更，后续param是新的状态，也可以用can.state读出 (number)
can.CB_STATE = 0

--- 扩展帧 (number)
can.EXT = 0

--- 标准帧 (number)
can.STD = 0

--- CAN总线初始化
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@param rx_message_cache_max number rx_message_cache_max，接收缓存消息数的最大值，写0或者留空则使用平台默认值
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.init()
--- ```
function can.init(id, rx_message_cache_max) end

--- 注册CAN事件回调
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@param func function 回调方法
---@return nil #1 无返回值
--- ```lua
--- can.on(1, function(id, type, param)
---     log.info("can", id, type, param)
--- end)
--- ```
function can.on(id, func) end

--- CAN总线配置时序
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@param br number br, 波特率, 默认1Mbps
---@param PTS number PTS, 传播时间段, 范围1~8
---@param PBS1 number PBS1, 相位缓冲段1，范围1~8
---@param PBS2 number PBS2, 相位缓冲段2，范围2~8
---@param SJW number SJW, 同步补偿宽度值，范围1~4，默认2
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- air780EPM参考，不一定适合其他平台，CAN的实际波特率=基础时钟/分频系数/(1+PTS+PBS1+PBS2)，详见can.capacity
--- 快速参考，50K及x2,x4,x8,x16都可以用同一个PTS+PBS1+PBS2
--- 快速参考，125K及x2,x4,x8都可以用同一个PTS+PBS1+PBS2
--- can.timing(0, 50000, 6, 6, 3, 2)
--- can.timing(0, 100000, 6, 6, 3, 2)
--- can.timing(0, 400000, 6, 6, 3, 2)
--- can.timing(0, 125000, 6, 6, 4, 2)
--- can.timing(0, 250000, 6, 6, 4, 2)
--- can.timing(0, 1000000, 6, 6, 4, 2)
--- ```
function can.timing(id, br, PTS, PBS1, PBS2, SJW) end

--- CAN总线设置工作模式
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@param mode number mode, 见MODE_XXX，默认是MODE_NORMAL
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.mode(0, CAN.MODE_NORMAL)
--- ```
function can.mode(id, mode) end

--- CAN总线设置节点ID，这是一种简易的过滤规则，只接收和ID完全匹配的消息，和can.filter选择一个使用
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@param node_id number node_id, 节点ID, 标准格式11位或者扩展格式29位，根据id_type决定，默认值是0x1fffffff，id值越小，优先级越高
---@param id_type number id_type，ID类型，填1或者CAN.EXT为扩展格式，填0或者CAN.STD为标准格式
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.node(0, 0x12345678, CAN.EXT)
--- can.node(0, 0x123, CAN.STD)
--- ```
function can.node(id, node_id, id_type) end

--- CAN总线设置接收过滤模式，当can.node不满足需求时才使用这个，和can.node选择一个使用，过滤模式比较复杂，请参考SJA1000的Pelican模式下滤波
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@param dual_mode boolean dual_mode, 是否是双过滤模式，true是，false不是，默认是false
---@param ACR number ACR, 接收代码寄存器值，必须写0xnnnnnnnn这样的格式，大端格式赋值到4个ACR寄存器上，默认值是0
---@param AMR number AMR, 接收屏蔽寄存器值，必须写0xnnnnnnnn这样的格式，大端格式赋值到4个AMR寄存器上，对应bit写0表示需要检测，写1表示不检测，默认是0xffffffff，不过滤全接收
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.filter(0, false, 0x12345678 << 3, 0x07) --效果等同于can.node(0, 0x12345678, CAN.EXT)
--- can.filter(0, false, 0x123 << 21, 0x0001fffff) --效果等同于can.node(0, 0x123, CAN.STD)
--- ```
function can.filter(id, dual_mode, ACR, AMR) end

--- CAN工作状态
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@return number #1 返回值见STATE_XXX
--- ```lua
--- can.state(0)
--- ```
function can.state(id) end

--- CAN发送一条消息
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@param msg_id number msg_id, 节点ID, 标准格式11位或者扩展格式29位，根据id_type决定，默认值是0x1fffffff，id值越小，优先级越高
---@param id_type number id_type, ID类型，填1或者CAN.EXT为扩展格式，填0或者CAN.STD为标准格式
---@param RTR boolean RTR, 是否是遥控帧，true是，false不是，默认是false
---@param need_ack boolean need_ack，是否需要应答，true是，false不需要，默认是true
---@param data string|zbuff data, 需要发送的数据, 如果是zbuff会从指针起始位置开始发送，最多发送8字节
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.tx(id, 0x12345678, CAN.EXT, false, true, "\x00\x01\x02\x03\0x04\x05\0x6\x07")
--- ```
function can.tx(id, msg_id, id_type, RTR, need_ack, data) end

--- 从缓存里读出一条消息
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@return boolean #1 是否读出数据，true读出，false没有读出，缓存已经空了，或者id不对
---@return number #2 消息ID
---@return number #3 ID类型，1或者CAN.EXT为扩展格式，0或者CAN.STD为标准格式
---@return boolean #4 是否是遥控帧，true是，false不是
---@return string #5 数据
--- ```lua
--- local succ, id, type, rtr, data = can.rx(0)
--- ```
function can.rx(id) end

--- 立刻停止当前的发送
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.stop(0)
--- ```
function can.stop(id) end

--- CAN总线复位，一般用于从总线关闭状态恢复成主动错误
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.reset(0)
--- ```
function can.reset(id) end

--- CAN总线关闭，此时可以重新进行timing,filter,node等配置
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.busOff(0)
--- ```
function can.busOff(id) end

--- CAN完全关闭
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- can.deinit(0)
--- ```
function can.deinit(id) end

--- CAN debug开关，打开后有更详细的打印
---@param on_off boolean true打开，false关闭
---@return nil #1 无返回值
--- ```lua
--- can.debug(true)
--- ```
function can.debug(on_off) end

--- 获取CAN时钟特性，包括基础时钟,分频系数范围,CAN的实际波特率=基础时钟/分频系数/(1+PTS+PBS1+PBS2),从时钟特性里能看出对应平台是否能配置出需要的波特率
---@param id number id, 如果只有一条总线写0或者留空, 有多条的，can0写0，can1写1, 如此类推, 一般情况只有1条
---@return boolean #1 成功返回true,失败返回false,如果失败就不用看后面的参数了
---@return number #2 基础时钟
---@return number #3 最小分频系数
---@return number #4 最大分频系数
---@return number #5 分频系数步进，一般为1
--- ```lua
--- local res, clk, div_min, div_max, div_step = can.capacity(0)
--- ```
function can.capacity(id) end
