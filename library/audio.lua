---@meta

--- LuatOS IDE Helper for module: audio
--- ```yaml
--- Summary: 多媒体-音频
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/multimedia/luat_lib_multimedia_audio.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/multimedia
--- Video: 
--- Tag: LUAT_USE_MEDIA
--- ```
audio = {}

--- PM模式 工作模式 (number)
audio.RESUME = 0

--- PM模式 待机模式，PA断电，codec待机状态，系统不能进低功耗状态，如果PA不可控，codec进入静音模式 (number)
audio.STANDBY = 0

--- PM模式 关机模式，PA断电，可配置的codec关机状态，不可配置的codec断电，系统能进低功耗状态 (number)
audio.SHUTDOWN = 0

--- PM模式 断电模式，PA断电，codec断电，系统能进低功耗状态 (number)
audio.POWEROFF = 0

--- PCM格式，即原始ADC数据 (number)
audio.PCM = 0

--- MP3格式 (number)
audio.MP3 = 0

--- WAV格式 (number)
audio.WAV = 0

--- AMR_NB格式 (number)
audio.AMR = 0

--- AMR_NB格式 (number)
audio.AMR_NB = 0

--- AMR_WB格式 (number)
audio.AMR_WB = 0

--- G711 ulaw格式 (number)
audio.ULAW = 0

--- G711 alaw格式 (number)
audio.ALAW = 0

--- audio.on回调函数传入参数的值，表示底层播放完一段数据，可以传入更多数据 (number)
audio.MORE_DATA = 0

--- audio.on回调函数传入参数的值，表示底层播放完全部数据了 (number)
audio.DONE = 0

--- audio.on回调函数传入参数的值，表示录音数据 (number)
audio.RECORD_DATA = 0

--- audio.on回调函数传入参数的值，表示录音完成 (number)
audio.RECORD_DONE = 0

--- 硬件输出总线，DAC类型 (number)
audio.BUS_DAC = 0

--- 硬件输出总线，I2S类型 (number)
audio.BUS_I2S = 0

--- 硬件输出总线，软件模式DAC类型 (number)
audio.BUS_SOFT_DAC = 0

--- 可配置的codec工作电压，1.8V (number)
audio.VOLTAGE_1800 = 0

--- 可配置的codec工作电压，3.3V (number)
audio.VOLTAGE_3300 = 0

--- 录音使用单声道 (number)
audio.RECORD_MONO = 0

--- 录音使用立体声 (number)
audio.RECORD_STEREO = 0

--- 启动一个多媒体通道准备播放音频
---@param id number 多媒体播放通道号
---@param audio_format number 音频格式
---@param num_channels number 声音通道数
---@param sample_rate number 采样频率
---@param bits_per_sample number 采样位数
---@param is_signed boolean 是否有符号，默认true
---@return boolean #1 成功true, 失败false
--- ```lua
--- audio.start(0, audio.PCM, 1, 16000, 16)
--- ```
function audio.start(id, audio_format, num_channels, sample_rate, bits_per_sample, is_signed) end

--- 录音
---@param id number id             多媒体播放通道号
---@param record_type number record_type    录音音频格式,支持 audio.AMR audio.PCM (部分平台支持audio.AMR_WB),或者直接输入采样率
---@param record_time number record_time    录制时长 单位秒,可选，默认0即表示一直录制
---@param amr_quailty number amr_quailty    质量,audio.AMR下有效
---@param path string path        录音文件路径,可选,不指定则不保存,可在audio.on回调函数中处理原始PCM数据
---@param record_callback_time number record_callback_time    不指定录音文件路径时，单次录音回调时长，单位是100ms。默认1，既100ms
---@param buff0 zbuff 录音原始PCM数据缓存0,不填写录音文件路径才会用到
---@param buff1 zbuff 录音原始PCM数据缓存1,不填写录音文件路径才会用到
---@param channelCount channelCount 声道数量,只针对非I2S设备有效,1单声道录音 2立体声录音 默认单声道.I2S设备在I2S相关API里配置
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- err,info = audio.record(id, type, record_time, quailty, path)
--- ```
function audio.record(id, record_type, record_time, amr_quailty, path, record_callback_time, buff0, buff1, channelCount) end

--- 录音停止
---@param id number id         多媒体播放通道号
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- audio.recordStop(0)
--- ```
function audio.recordStop(id) end

--- 往一个多媒体通道写入音频数据
---@param id string|zbuff 音频数据
---@param data any 
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- audio.write(0, "xxxxxx")
--- ```
function audio.write(id, data) end

--- 停止指定的多媒体通道
---@param id number audio id,例如0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- audio.stop(0)
--- ```
function audio.stop(id) end

--- 暂停/恢复指定的多媒体通道
---@param id number audio id,例如0
---@param pause boolean onoff true 暂停，false 恢复
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- audio.pause(0, true) --暂停通道0
--- audio.pause(0, false) --恢复通道0
--- ```
function audio.pause(id, pause) end

--- 注册audio播放事件回调
---@param audio_id number audio id, audio 0写0, audio 1写1
---@param func function 回调方法，回调时传入参数为1、int 通道ID 2、int 消息值，有audio.MORE_DATA,audio.DONE,audio.RECORD_DATA,audio.RECORD_DONE,3、RECORD_DATA后面跟数据存在哪个zbuff内，0或者1
---@return nil #1 无返回值
--- ```lua
--- audio.on(0, function(audio_id, msg)
---     log.info("msg", audio_id, msg)
--- end)
--- ```
function audio.on(audio_id, func) end

--- 播放或者停止播放一个文件，播放完成后，会回调一个audio.DONE消息，可以用pause来暂停或者恢复，其他API不可用。考虑到读SD卡速度比较慢而拖累luavm进程的速度，所以尽量使用本API
---@param id number 音频通道
---@param path string|table 文件名，如果为空，则表示停止播放，如果是table，则表示连续播放多个文件，主要应用于云喇叭，目前只有Air780EXXX支持，并且会用到errStop参数
---@param errStop boolean 是否在文件解码失败后停止解码，只有在连续播放多个文件时才有用，默认true，遇到解码错误自动停止
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- audio.play(0, "xxxxxx")        --开始播放某个文件
--- audio.play(0)                --停止播放某个文件
--- ```
function audio.play(id, path, errStop) end

--- TTS播放或者停止
---@param id number 音频通道
---@param data string|zbuff 需要播放的内容
---@return boolean #1 成功返回true,否则返回false
function audio.tts(id, data) end

--- 停止播放文件，和audio.play(id)是一样的作用
---@param id number audio id,例如0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- audio.playStop(0)
--- ```
function audio.playStop(id) end

--- 检查当前文件是否已经播放结束
---@param id number 音频通道
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- audio.isEnd(0)
--- ```
function audio.isEnd(id) end

--- 获取最近一次播放结果，不是所有平台都支持的，目前只有Air780EXXX支持
---@param id number 音频通道
---@return boolean #1 是否全部播放成功，true成功，false有文件播放失败
---@return boolean #2 如果播放失败，是否是用户停止，true是，false不是
---@return number #3 第几个文件失败了，从1开始
--- ```lua
--- local result, user_stop, file_no = audio.getError(0)
--- ```
function audio.getError(id) end

--- 配置一个音频通道的特性，比如实现自动控制PA开关。注意这个不是必须的，一般在调用play的时候才需要自动控制，其他情况比如你手动控制播放时，就可以自己控制PA开关
---@param id number 音频通道
---@param paPin number PA控制IO
---@param onLevel number PA打开时的电平
---@param dacDelay number 在DAC启动前插入的冗余时间，单位100ms，一般用于外部DAC
---@param paDelay number 在DAC启动后，延迟多长时间打开PA，单位1ms
---@param dacPin number 外部dac电源控制IO，如果不填，则表示使用平台默认IO，比如Air780E使用DACEN脚，air105则不启用
---@param dacLevel number 外部dac打开时，电源控制IO的电平，默认拉高
---@param dacTimeDelay number 音频播放完毕时，PA与DAC关闭的时间间隔，单位1ms，默认0ms
--- ```lua
--- 下面的配置是Air780E云喇叭板的配置
--- audio.config(0, 25, 1, 6, 200)    --PA控制脚是GPIO25，高电平打开
--- ```
function audio.config(id, paPin, onLevel, dacDelay, paDelay, dacPin, dacLevel, dacTimeDelay) end

--- 配置一个音频通道的音量调节，直接将原始数据放大或者缩小，不是所有平台都支持，建议尽量用硬件方法去缩放
---@param id number 音频通道
---@param value number 音量，百分比，1%~1000%，默认100%，就是不调节
---@return number #1 当前音量
--- ```lua
--- local result = audio.vol(0, 90)    --通道0的音量调节到90%，result存放了调节后的音量水平，有可能仍然是100
--- ```
function audio.vol(id, value) end

--- 配置一个音频通道的mic音量调节
---@param id number 音频通道
---@param value number mic音量，百分比，1%~100%，默认100%，就是不调节
---@return number #1 当前mic音量
--- ```lua
--- local result = audio.vol(0, 90)    --通道0的音量调节到90%，result存放了调节后的音量水平，有可能仍然是100
--- ```
function audio.micVol(id, value) end

--- 配置一个音频通道的硬件输出总线，只有对应soc软硬件平台支持才设置对应类型
---@param id number 音频通道,例如0
---@param bus_type number 总线类型, 例如 audio.BUS_SOFT_DAC, audio.BUS_I2S
---@return nil #1 无返回值
--- ```lua
--- audio.setBus(0, audio.BUS_SOFT_DAC)    --通道0的硬件输出通道设置为软件DAC
--- audio.setBus(0, audio.BUS_I2S,{chip="es8311",i2cid=0,i2sid=0,voltage=codec.VDDA_3V3})    --通道0的硬件输出通道设置为I2S
--- ```
function audio.setBus(id, bus_type) end

--- 配置调试信息输出
---@param on_off boolean true开 false关
function audio.debug(on_off) end

--- audio 休眠控制(一般会自动调用不需要手动执行)
---@param id number 音频通道
---@param pm_mode number 休眠模式
---@return boolean #1 true成功
--- ```lua
--- audio.pm(multimedia_id,audio.RESUME)
--- ```
function audio.pm(id, pm_mode) end
