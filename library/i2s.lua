---@meta

--- LuatOS IDE Helper for module: i2s
--- ```yaml
--- Summary: 数字音频
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_i2s.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/multimedia
--- Video: 
--- Tag: LUAT_USE_I2S
--- ```
--- ```lua
--- 这个库属于底层适配库, 具体用法请查阅示例
--- demo/multimedia
--- demo/tts
--- demo/record
--- ```
i2s = {}

--- I2S标准，比如ES7149 (number)
i2s.MODE_I2S = 0

--- LSB格式 (number)
i2s.MODE_LSB = 0

--- MSB格式，比如TM8211 (number)
i2s.MODE_MSB = 0

--- 左声道 (number)
i2s.MONO_L = 0

--- 右声道 (number)
i2s.MONO_R = 0

--- 立体声 (number)
i2s.STEREO = 0

--- 初始化i2s
---@param id number i2s通道号,与具体设备有关
---@param mode number 模式, 0 主机 1 从机
---@param sample number 采样率,默认44100. 可选
---@param bitw number 数据位数,默认16, 可以是8的倍数
---@param channel number 声道, 0 左声道, 1 右声道, 2 立体声. 可选
---@param format number 格式, 可选MODE_I2S, MODE_LSB, MODE_MSB
---@param framebit number 1个声道的BCLK数量, 可选16和32
---@return boolean #1 成功与否
---@return number #2 底层返回值
--- ```lua
--- 以默认参数初始化i2s
--- i2s.setup(0)
--- 以详细参数初始化i2s, 示例为默认值
--- i2s.setup(0, 0, 44100, 16, 0, 0, 16)
--- ```
function i2s.setup(id, mode, sample, bitw, channel, format, framebit) end

--- 发送i2s数据
---@param id number 通道id
---@param data string 数据, 可以是字符串或zbuff
---@param len number 数据长度,单位字节, 字符串默认为字符串全长, zbuff默认为指针位置
---@return boolean #1 成功与否
---@return number #2 底层返回值,供调试用
--- ```lua
--- local f = io.open("/luadb/abc.wav")
--- while 1 do
---     local data = f:read(4096)
---     if not data or #data == 0 then
---         break
---     end
---     i2s.send(0, data)
---     sys.wait(100)
--- end
--- ```
function i2s.send(id, data, len) end

--- 接收i2s数据，注意在数据在回调时已经存放在zbuff里，目前只有air780exxx系列支持
---@param id number 通道id
---@param buffer zbuff 数据缓存区
---@param len number 单次返回的数据长度,单位字节,必须与传入的zbuff的大小一致
---@return boolean #1 成功与否
--- ```lua
--- local buffer = zbuff.create(3200)
--- local succ = i2s.recv(0, buffer, 3200);
--- ```
function i2s.recv(id, buffer, len) end

--- 关闭i2s
---@param id number 通道id
---@return nil #1 无返回值
--- ```lua
--- i2s.close(0)
--- ```
function i2s.close(id) end

--- 注册I2S事件回调
---@param id number i2s id, i2s0写0, i2s1写1
---@param func function 回调方法
---@return nil #1 无返回值
--- ```lua
--- i2s.on(0, function(id, buff)
---     if buff then
---         log.info("i2s get data in zbuff")
---     else
---         log.info("i2s tx one block done")
---     end
--- end)
--- ```
function i2s.on(id, func) end

--- 获取i2s的发送缓冲区状态
---@param id number i2s id, i2s0写0, i2s1写1
--- ```lua
--- 读取发送缓冲区的状态, 从而判断是否需要继续传入音频数据
--- local max, remain = i2s.txStat(0)
--- log.info("i2s发送缓冲区状态", max, remain)
--- ```
function i2s.txStat(id) end

--- 获取I2S参数，参数具体参考setup
---@param id number 通道id
---@return boolean #1 是否在工作状态 true是
---@return number #2 模式, 0 主机 1 从机
---@return number #3 采样率
---@return number #4 数据位数
---@return number #5 声道
---@return number #6 格式
---@return number #7 1个声道的BCLK数量
function i2s.getPara(id) end
