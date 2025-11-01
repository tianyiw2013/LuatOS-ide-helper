i2s = {}

--i2s.setup(id, mode, sample, bitw, channel, format, framebit) - 初始化i2s
--传入值：
--int i2s通道号,与具体设备有关
--int 模式, 0 主机 1 从机
--int 采样率,默认44100. 可选
--int 数据位数,默认16, 可以是8的倍数
--int 声道, 0 左声道, 1 右声道, 2 立体声. 可选
--int 格式, 可选MODE_I2S, MODE_LSB, MODE_MSB
--int 1个声道的BCLK数量, 可选16和32
--返回值：
--boolean 成功与否
--int 底层返回值
--例子：
---- 以默认参数初始化i2s
--i2s.setup(0)
---- 以详细参数初始化i2s, 示例为默认值
--i2s.setup(0, 0, 44100, 16, 0, 0, 16)
function i2s.setup(id,mode,sample,bitw,channel,format,framebit) end

--i2s.send(id, data, len) - 发送i2s数据
--传入值：
--int 通道id
--string 数据, 可以是字符串或zbuff
--int 数据长度,单位字节, 字符串默认为字符串全长, zbuff默认为指针位置
--返回值：
--boolean 成功与否
--int 底层返回值,供调试用
--例子：
--local f = io.open("/luadb/abc.wav")
--while 1 do
--    local data = f:read(4096)
--    if not data or #data == 0 then
--        break
--    end
--    i2s.send(0, data)
--    sys.wait(100)
--end
function i2s.send(id,data,len) end

--i2s.recv(id, buffer, len) - 接收i2s数据，注意在数据在回调时已经存放在zbuff里，目前只有air780e系列支持
--传入值：
--int 通道id
--zbuff 数据缓存区
--int 单次返回的数据长度,单位字节,必须与传入的zbuff的大小一致
--返回值：
--boolean 成功与否
--例子：
--local buffer = zbuff.create(3200)
--local succ = i2s.recv(0, buffer, 3200);
function i2s.recv(id,buffer,len) end

--i2s.close(id) - 关闭i2s
--传入值：
--int 通道id
--返回值：
--nil 无返回值
--例子：
--i2s.close(0)
function i2s.close(id) end

--i2s.on(id, func) - 注册I2S事件回调
--传入值：
--int i2s id, i2s0写0, i2s1写1
--function 回调方法
--返回值：
--nil 无返回值
--例子：
--i2s.on(0, function(id, buff)
--    if buff then
--        log.info("i2s get data in zbuff")
--    else
--        log.info("i2s tx one block done")
--    end
--end)
function i2s.on(id,func) end

--i2s.txStat(id) - 获取i2s的发送缓冲区状态
--传入值：
--int i2s id, i2s0写0, i2s1写1
--return 底层缓冲区的总大小
--return 底层缓冲区的剩余待发送数据
--例子：
---- 读取发送缓冲区的状态, 从而判断是否需要继续传入音频数据
--local max, remain = i2s.txStat(0)
--log.info("i2s发送缓冲区状态", max, remain)
function i2s.txStat(id) end

--i2s.getPara(id) - 获取I2S参数，参数具体参考setup
--传入值：
--int 通道id
--返回值：
--boolean 是否在工作状态 true是
--int 模式, 0 主机 1 从机
--int 采样率
--int 数据位数
--int 声道
--int 格式
--int 1个声道的BCLK数量
function i2s.getPara(id) end