audio = {}

--audio.start(id, audio_format, num_channels, sample_rate, bits_per_sample, is_signed) - 启动一个多媒体通道准备播放音频
--传入值：
--int 多媒体播放通道号
--int 音频格式
--int 声音通道数
--int 采样频率
--int 采样位数
--boolean 是否有符号，默认true
--返回值：
--boolean 成功true, 失败false
--例子：
--audio.start(0, audio.PCM, 1, 16000, 16)
function audio.start(id,audio_format,num_channels,sample_rate,bits_per_sample,is_signed) end

--audio.record(id, record_type, record_time, amr_quailty, path) - 录音
--传入值：
--int id             多媒体播放通道号
--int record_type    录音音频格式,支持 audio.AMR audio.PCM (部分平台支持audio.AMR_WB)
--int record_time    录制时长 单位秒,可选，默认0即表示一直录制
--int amr_quailty    质量,audio.AMR下有效
--string path        录音文件路径,可选,不指定则不保存,可在audio.on回调函数中处理原始PCM数据
--int record_callback_time    不指定录音文件路径时，单次录音回调时长，单位是100ms。默认1，既100ms
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--err,info = audio.record(id, type, record_time, quailty, path)
function audio.record(id,record_type,record_time,amr_quailty,path) end

--audio.recordStop(id) - 录音停止
--传入值：
--int id         多媒体播放通道号
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--audio.recordStop(0)
function audio.recordStop(id) end

--audio.write(id, data) - 往一个多媒体通道写入音频数据
--传入值：
--string or zbuff 音频数据
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--audio.write(0, "xxxxxx")
function audio.write(id,data) end

--audio.stop(id) - 停止指定的多媒体通道
--传入值：
--int audio id,例如0
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--audio.stop(0)
function audio.stop(id) end

--audio.pause(id, pause) - 暂停/恢复指定的多媒体通道
--传入值：
--int audio id,例如0
--boolean onoff true 暂停，false 恢复
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--audio.pause(0, true) --暂停通道0
--audio.pause(0, false) --恢复通道0
function audio.pause(id,pause) end

--audio.on(audio_id, func) - 注册audio播放事件回调
--传入值：
--int audio id, audio 0写0, audio 1写1
--function 回调方法，回调时传入参数为1、int 通道ID 2、int 消息值，只有audio.MORE_DATA和audio.DONE
--返回值：
--nil 无返回值
--例子：
--audio.on(0, function(audio_id, msg)
--    log.info("msg", audio_id, msg)
--end)
function audio.on(audio_id,func) end

--audio.play(id, path, errStop) - 播放或者停止播放一个文件，播放完成后，会回调一个audio.DONE消息，可以用pause来暂停或者恢复，其他API不可用。考虑到读SD卡速度比较慢而拖累luavm进程的速度，所以尽量使用本API
--传入值：
--int 音频通道
--string/table 文件名，如果为空，则表示停止播放，如果是table，则表示连续播放多个文件，主要应用于云喇叭，目前只有EC618支持，并且会用到errStop参数
--boolean 是否在文件解码失败后停止解码，只有在连续播放多个文件时才有用，默认true，遇到解码错误自动停止
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--audio.play(0, "xxxxxx")        --开始播放某个文件
--audio.play(0)                --停止播放某个文件
function audio.play(id,path,errStop) end

--audio.tts(id, data) - TTS播放或者停止
--传入值：
--int 音频通道
--string/zbuff 需要播放的内容
--返回值：
--boolean 成功返回true,否则返回false
function audio.tts(id,data) end

--audio.playStop(id) - 停止播放文件，和audio.play(id)是一样的作用
--传入值：
--int audio id,例如0
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--audio.playStop(0)
function audio.playStop(id) end

--audio.isEnd(id) - 检查当前文件是否已经播放结束
--传入值：
--int 音频通道
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--audio.isEnd(0)
function audio.isEnd(id) end

--audio.getError(id) - 获取最近一次播放结果，不是所有平台都支持的，目前只有EC618支持
--传入值：
--int 音频通道
--返回值：
--boolean 是否全部播放成功，true成功，false有文件播放失败
--boolean 如果播放失败，是否是用户停止，true是，false不是
--int 第几个文件失败了，从1开始
--例子：
--local result, user_stop, file_no = audio.getError(0)
function audio.getError(id) end

--audio.config(id, paPin, onLevel, dacDelay, paDelay, dacPin, dacLevel, dacTimeDelay) - 配置一个音频通道的特性，比如实现自动控制PA开关。注意这个不是必须的，一般在调用play的时候才需要自动控制，其他情况比如你手动控制播放时，就可以自己控制PA开关
--传入值：
--int 音频通道
--int PA控制IO
--int PA打开时的电平
--int 在DAC启动前插入的冗余时间，单位100ms，一般用于外部DAC
--int 在DAC启动后，延迟多长时间打开PA，单位1ms
--int 外部dac电源控制IO，如果不填，则表示使用平台默认IO，比如Air780E使用DACEN脚，air105则不启用
--int 外部dac打开时，电源控制IO的电平，默认拉高
--int 音频播放完毕时，PA与DAC关闭的时间间隔，单位1ms，默认0ms
--例子：
--audio.config(0, pin.PC0, 1)    --PA控制脚是PC0，高电平打开，air105用这个配置就可以用了
--audio.config(0, 25, 1, 6, 200)    --PA控制脚是GPIO25，高电平打开，Air780E云喇叭板用这个配置就可以用了
function audio.config(id,paPin,onLevel,dacDelay,paDelay,dacPin,dacLevel,dacTimeDelay) end

--audio.vol(id, value) - 配置一个音频通道的音量调节，直接将原始数据放大或者缩小，不是所有平台都支持，建议尽量用硬件方法去缩放
--传入值：
--int 音频通道
--int 音量，百分比，1%~1000%，默认100%，就是不调节
--返回值：
--int 当前音量
--例子：
--local result = audio.vol(0, 90)    --通道0的音量调节到90%，result存放了调节后的音量水平，有可能仍然是100
function audio.vol(id,value) end

--audio.micVol(id, value) - 配置一个音频通道的mic音量调节
--传入值：
--int 音频通道
--int mic音量，百分比，1%~100%，默认100%，就是不调节
--返回值：
--int 当前mic音量
--例子：
--local result = audio.vol(0, 90)    --通道0的音量调节到90%，result存放了调节后的音量水平，有可能仍然是100
function audio.micVol(id,value) end

--audio.setBus(id, bus_type) - 配置一个音频通道的硬件输出总线，只有对应soc软硬件平台支持才设置对应类型
--传入值：
--int 音频通道,例如0
--int 总线类型, 例如 audio.BUS_SOFT_DAC
--int 硬件id, 例如 总线类型为audio.BUS_I2S时,硬件id即为i2s codec的i2c id
--返回值：
--nil 无返回值
--例子：
--audio.setBus(0, audio.BUS_SOFT_DAC)    --通道0的硬件输出通道设置为软件DAC
--audio.setBus(0, audio.BUS_I2S)    --通道0的硬件输出通道设置为I2S
function audio.setBus(id,bus_type) end

--audio.debug(on_off) - 配置调试信息输出
--传入值：
--boolean true开 false关
function audio.debug(on_off) end

--audio.pm(id,pm_mode) - audio 休眠控制(一般会自动调用不需要手动执行)
--传入值：
--int 音频通道
--int 休眠模式 
--返回值：
--boolean true成功
--例子：
--audio.pm(multimedia_id,audio.RESUME)
function audio.pm(id,pm_mode) end