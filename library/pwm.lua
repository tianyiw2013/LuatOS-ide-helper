---@meta

--- LuatOS IDE Helper for module: pwm
--- ```yaml
--- Summary: PWM模块
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_pwm.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/pwm
--- Video: 
--- Tag: LUAT_USE_PWM
--- ```
--- ```lua
--- 本库支持2套API风格
--- 1. 传统API, open和close
--- 2. 新的API(推荐使用), setup,start,stop,setDuty,setFreq
--- 传统API
--- pwm.open(1, 1000, 50) -- 打开PWM1, 频率1kHz, 占空比50%
--- sys.wait(5000) -- 等待5秒
--- pwm.close(1) -- 关闭PWM1
--- 新API
--- pwm.setup(1, 1000, 50) -- 设置PWM1, 频率1kHz, 占空比50%
--- pwm.start(1) -- 启动PWM1
--- sys.wait(5000) -- 等待5秒
--- pwm.setFreq(1, 2000) -- 设置PWM1频率2kHz
--- sys.wait(5000) -- 等待5秒
--- pwm.setDuty(1, 25) -- 设置PWM1占空比25%
--- sys.wait(5000) -- 等待5秒
--- pwm.stop(1) -- 关闭PWM1
--- 提醒: pwm.setFreq和pwm.setDuty的, 仅在start/open状态下立即生效, stop/close状态是不会生效的
--- ```
pwm = {}

--- 开启指定的PWM通道
---@param channel number PWM通道
---@param period number 频率, 1-N,单位Hz. N受限于具体硬件能力
---@param pulse number 占空比 0-分频精度
---@param pnum number 输出周期 0为持续输出, 1为单次输出, 其他为指定脉冲数输出
---@param precision number 分频精度, 100/256/1000, 默认为100, 若设备不支持会有日志提示
---@return boolean #1 处理结果,成功返回true,失败返回false
--- ```lua
--- 打开PWM5, 频率1kHz, 占空比50%
--- pwm.open(5, 1000, 50)
--- 打开PWM5, 频率10kHz, 分频为 31/256
--- pwm.open(5, 10000, 31, 0, 256)
--- ```
function pwm.open(channel, period, pulse, pnum, precision) end

--- 关闭指定的PWM通道
---@param channel number PWM通道
---@return nil #1 无处理结果
--- ```lua
--- 关闭PWM5
--- pwm.close(5)
--- ```
function pwm.close(channel) end

--- PWM捕获
---@param channel number PWM通道
---@return boolean #1 处理结果,成功返回true,失败返回false
--- ```lua
--- PWM0捕获
--- while 1 do
---     pwm.capture(0,1000)
---     local ret,channel,pulse,pwmH,pwmL  = sys.waitUntil("PWM_CAPTURE", 2000)
---     if ret then
---         log.info("PWM_CAPTURE","channel"..channel,"pulse"..pulse,"pwmH"..pwmH,"pwmL"..pwmL)
---     end
--- end
--- ```
function pwm.capture(channel) end

--- 初始化指定的PWM通道
---@param channel number PWM通道
---@param period number 频率, 1-N,单位Hz. N受限于具体硬件能力
---@param pulse number 占空比 0-分频精度
---@param pnum number 输出周期 0为持续输出, 1为单次输出, 其他为指定脉冲数输出
---@param precision number 分频精度, 100/256/1000, 默认为100, 若设备不支持会有日志提示
---@return boolean #1 处理结果,成功返回true,失败返回false
--- ```lua
--- 设置PWM5, 频率1kHz, 占空比50%
--- pwm.setup(5, 1000, 50)
--- ```
function pwm.setup(channel, period, pulse, pnum, precision) end

--- 启动指定的PWM通道
---@param channel number PWM通道
---@return boolean #1 处理结果,成功返回true,失败返回false
--- ```lua
--- 启动PWM1
--- pwm.start(1)
--- ```
function pwm.start(channel) end

--- 停止指定的PWM通道
---@param channel number PWM通道
---@return boolean #1 处理结果,成功返回true,失败返回false
--- ```lua
--- 停止PWM1
--- pwm.stop(1)
--- ```
function pwm.stop(channel) end

--- 设置指定PWM通道的占空比
---@param channel number PWM通道
---@param duty number 占空比
---@return boolean #1 处理结果,成功返回true,失败返回false
--- ```lua
--- 设置PWM1占空比25%
--- pwm.setDuty(1, 25)
--- ```
function pwm.setDuty(channel, duty) end

--- 设置指定PWM通道的频率
---@param channel number PWM通道
---@param freq number 频率, 1-N,单位Hz. N受限于具体硬件能力
---@return boolean #1 处理结果,成功返回true,失败返回false
--- ```lua
--- 设置PWM5频率2kHz
--- pwm.setFreq(5, 2000)
--- ```
function pwm.setFreq(channel, freq) end
