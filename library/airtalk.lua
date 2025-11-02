---@meta

--- LuatOS IDE Helper for module: airtalk
--- ```yaml
--- Summary: 设备之间，设备与PC、手机，对讲处理
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/airtalk/binding/luat_lib_airtalk.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/airtalk
--- Video: 
--- Tag: LUAT_USE_AIRTALK
--- ```
--- ```lua
--- 本库仅部分BSP支持
--- 主要是 Air8000 和 Air780EXX 系列
--- 详细用法请参考demo
--- ```
airtalk = {}

--- 语音数据用MQTT传输 (number)
airtalk.PROTOCOL_MQTT = 0

--- 对讲工作模式1对1 (number)
airtalk.MODE_PERSON = 0

--- 对讲工作模式1对多的发起者，录音上行，不播放 (number)
airtalk.MODE_GROUP_SPEAKER = 0

--- 对讲工作模式1对多的接收者，下行播放，不录音 (number)
airtalk.MODE_GROUP_LISTENER = 0

--- airtalk离线 (number)
airtalk.EVENT_OFF_LINE = 0

--- airtalk在线处于空闲状态 (number)
airtalk.EVENT_ON_LINE_IDLE = 0

--- airtalk下行播放开始 (number)
airtalk.EVENT_PLAY_START = 0

--- airtalk下行播放结束 (number)
airtalk.EVENT_PLAY_END = 0

--- airtalk录音上行开始 (number)
airtalk.EVENT_RECORD_START = 0

--- airtalk录音上行结束 (number)
airtalk.EVENT_RECORD_END = 0

--- airtalk audio启动，只要上行和下行有一个开始就启动 (number)
airtalk.EVENT_AUDIO_START = 0

--- airtalk audio停止，上行和下行都结束才停止 (number)
airtalk.EVENT_AUDIO_END = 0

--- airtalk发生异常，后续param为异常值 (number)
airtalk.EVENT_ERROR = 0

--- airtalk发生异常，长时间没有收到音频数据 (number)
airtalk.EVENT_ERROR = 0

--- 配置airtalk参数
---@param protocol number 语音数据传输协议类型，见airtalk.PROTOCOL_XXX
---@param netc userdata network_ctrl或者mqtt客户端，如果协议是mqtt类型，传入mqtt.create返回值，如果是其他类型，传入socket.create的返回值
---@param cache_time number 缓冲时间，单位ms，默认500ms，值越小，delay越小，抗网络波动能力越差
---@param encode_cnt number 单次编码帧数，默认值5，不能低于2，不能高于5
---@param decode_cnt number 单次解码帧数，如果缓冲没有足够的帧数，自动补0，默认值5，不能低于2，不能高于10，不能低于encode_cnt, decode_cnt * 4 必须是 encode_cnt的整数倍
---@param audio_pm_mode_when_stop number 对讲停止后，audio的pm状态，默认是audio.SHUTDOWN
---@param no_data_to number 多长时间判定对端长时间无数据发送，超过这个时间会上报event_error，用户决定接下来的操作。默认5000ms，单位ms
---@return nil #1 无返回值
--- ```lua
--- mqttc = mqtt.create(nil,"120.55.137.106", 1884)
--- airtalk.config(airtalk.PROTOCOL_MQTT, mqttc)
--- ```
function airtalk.config(protocol, netc, cache_time, encode_cnt, decode_cnt, audio_pm_mode_when_stop, no_data_to) end

--- 注册airtalk事件回调
---@param func function 回调方法
---@return nil #1 无返回值
--- ```lua
--- airtalk.on(function(event, param)
---     log.info("airtalk event", event, param)
--- end)
--- [[
--- event具体见EVENT_XXX
--- param说明:
--- 目前只有EVENT_ERROR会有param值，为ERROR_XXX
--- ]]
--- ```
function airtalk.on(func) end

--- airtalk启动
---@return nil #1 无返回值
--- ```lua
--- mqttc = mqtt.create(nil,"120.55.137.106", 1884)
--- airtalk.config(airtalk.PROTOCOL_MQTT, mqttc)
--- airtalk.on(function(event, param)
---     log.info("airtalk event", event, param)
--- end)
--- airtalk.start()
--- ```
function airtalk.start() end

--- 配置airtalk RTP协议中的SSRC
---@param ssrc number|string ssrc，可以是int也是可以8字节string
---@return nil #1 无返回值
function airtalk.set_ssrc(ssrc) end

--- 配置airtalk mqtt类型语音数据的专用topic
---@param topic string topic
---@return nil #1 无返回值
--- ```lua
--- airtalk.set_topic("xxxxxxxxxx")
--- ```
function airtalk.set_topic(topic) end

--- airtalk对讲工作启动/停止
---@param on_off boolean 启停控制，true开始，false停止
---@param mode number 工作模式，见airtalk.MODE_XXX
---@param sample number 音频采样率，目前只有8000和16000，默认16000
---@return nil #1 无返回值
--- ```lua
--- 1对1对讲开始
--- airtalk.speech(true,airtalk.MODE_PERSON,16000)
--- 作为发起方，进行1对多对讲
--- airtalk.speech(true,airtalk.MODE_GROUP_SPEAKER,16000)
--- 作为接收方，进行1对多对讲
--- airtalk.speech(true,airtalk.MODE_GROUP_LISTENER,16000)
--- 对讲停止
--- airtalk.speech(false)
--- ```
function airtalk.speech(on_off, mode, sample) end

--- airtalk的详细调试信息开关
---@param on_off boolean 调试信息开关，true打开，false关闭
---@return nil #1 无返回值
function airtalk.debug(on_off) end
