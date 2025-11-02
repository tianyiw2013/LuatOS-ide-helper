---@meta

--- LuatOS IDE Helper for module: ioqueue
--- ```yaml
--- Summary: io序列操作
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/io_queue/luat_lib_io_queue.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/io_queue
--- Video: 
--- Tag: LUAT_USE_IO_QUEUE
--- ```
ioqueue = {}

--- 初始化一个io操作队列
---@param hwtimer_id number 硬件定时器id，默认用0，根据实际MCU确定，air105为0~5，与pwm共用，同一个通道号不能同时为pwm和ioqueue
---@param cmd_cnt number 一个完整周期需要的命令，可以比实际的多
---@param repeat_cnt number 重复次数,默认是1，如果写0则表示无限次数循环
---@return nil #1 无返回值
--- ```lua
--- ioqueue.init(0,10,5) --以timer0为时钟源初始化一个io操作队列，有10个有效命令，循环5次
--- ```
function ioqueue.init(hwtimer_id, cmd_cnt, repeat_cnt) end

--- 对io操作队列增加延时命令
---@param hwtimer_id number 硬件定时器id
---@param time_us number 延时时间,0~65535us
---@param time_tick number 延时微调时间,0~255tick,总的延时时间是time_us * 1us_tick + time_tick
---@param continue boolean 是否连续是连续延时，默认否，如果是，定时器在时间到后不会停止而是重新计时，
function ioqueue.setdelay(hwtimer_id, time_us, time_tick, continue) end

--- 对io操作队列增加一次重复延时，在前面必须有setdelay且是连续延时
---@param hwtimer_id number 硬件定时器id
---@return nil #1 无返回值
--- ```lua
--- ioqueue.setdelay(0,9,15,true) --延时9us+15个tick,在之后遇到delay命令时，会延时9us+15个tick
--- ioqueue.delay(0)
--- ```
function ioqueue.delay(hwtimer_id) end

--- 对io操作队列增加设置gpio命令
---@param hwtimer_id number 硬件定时器id
---@param pin number pin
---@param is_input boolean 是否是输入
---@param pull_mode number 上下拉模式,只能是0,gpio.PULLUP,gpio.PULLDOWN
---@param init_level number 初始输出电平
---@return nil #1 无返回值
--- ```lua
--- ioqueue.setgpio(0,17,true,gpio.PULLUP,0) --GPIO17设置成上拉输入
--- ioqueue.setgpio(0,17,false,0,1)--GPIO17设置成默认上下拉输出高电平
--- ```
function ioqueue.setgpio(hwtimer_id, pin, is_input, pull_mode, init_level) end

--- 对io操作队列增加读取gpio命令
---@param hwtimer_id number 硬件定时器id
---@param pin number pin
---@return nil #1 无返回值
--- ```lua
--- - 对GPIO17进行输入读取
--- ioqueue.input(0, 17)
--- ```
function ioqueue.input(hwtimer_id, pin) end

--- 对io操作队列增加输出GPIO命令
---@param hwtimer_id number 硬件定时器id
---@param pin number pin
---@param level number 输出电平
---@return nil #1 无返回值
--- ```lua
--- 对GPIO17输出低电平
--- ioqueue.output(0, 17, 0)
--- ```
function ioqueue.output(hwtimer_id, pin, level) end

--- 对io操作队列增加设置捕获某个IO命令
---@param hwtimer_id number 硬件定时器id
---@param pin number pin
---@param pull_mode number 上下拉模式,只能是0,gpio.PULLUP,gpio.PULLDOWN
---@param irq_mode number 中断模式,只能是gpio.BOTH,gpio.RISING,gpio.FALLING
---@param max_tick number 定时器最大计时时间 考虑到lua是int类型，最小0x10000, 最大值为0x7fffffff，默认为最大值
---@return nil #1 无返回值
--- ```lua
--- 捕获指令
--- ioqueue.setcap(0, 17, gpio.PULLUP, gpio.FALLING, 48000000)
--- ```
function ioqueue.set_cap(hwtimer_id, pin, pull_mode, irq_mode, max_tick) end

--- 对io操作队列增加捕获一次IO状态命令
---@param hwtimer_id number 硬件定时器id
---@return nil #1 无返回值
--- ```lua
--- ioqueue.capture(0)
--- ```
function ioqueue.capture(hwtimer_id) end

--- 对io操作队列增加结束捕获某个IO命令
---@param hwtimer_id number 硬件定时器id
---@param pin number pin
---@return nil #1 无返回值
--- ```lua
--- 结束捕获
--- ioqueue.cap_done(0, 17)
--- ```
function ioqueue.cap_done(hwtimer_id, pin) end

--- * 获取io操作队列中输入和捕获的数据
---@param hwtimer_id number 硬件定时器id
---@param input_buff zbuff 存放IO输入数据的buff，按照1byte pin + 1byte level 形式存放数据
---@param capture_buff zbuff 存放IO捕获数据的buff，按照1byte pin + 1byte level + 4byte tick形式存放数据
---@return number #1 返回多少组IO输入数据
---@return number #2 返回多少组IO捕获数据
--- ```lua
--- local input_cnt, capture_cnt = ioqueue.get(0, input_buff, capture_buff)
--- ```
function ioqueue.get(hwtimer_id, input_buff, capture_buff) end

--- 启动io操作队列
---@param hwtimer_id number 硬件定时器id
---@return nil #1 无返回值
--- ```lua
--- ioqueue.start(0)
--- ```
function ioqueue.start(hwtimer_id) end

--- 停止io操作队列，可以通过start从头开始
---@param hwtimer_id number 硬件定时器id
---@return number #1 返回已经循环的次数，如果是0，表示一次循环都没有完成
---@return number #2 返回单次循环中已经执行的cmd次数，如果是0，可能是一次循环刚刚结束
--- ```lua
--- ioqueue.stop(0)
--- ```
function ioqueue.stop(hwtimer_id) end

--- 释放io操作队列的资源，下次使用必须重新init
---@param hwtimer_id number 硬件定时器id
---@return nil #1 无返回值
--- ```lua
--- ioqueue.clear(0)
--- ```
function ioqueue.release(hwtimer_id) end

--- 清空io操作队列
---@param hwtimer_id number 硬件定时器id
---@return nil #1 无返回值
--- ```lua
--- ioqueue.clear(0)
--- ```
function ioqueue.clear(hwtimer_id) end

--- 检测io操作队列是否已经执行完成
---@param hwtimer_id number 硬件定时器id
---@return boolean #1 队列是否执行完成，
--- ```lua
--- local result = ioqueue.done(0)
--- ```
function ioqueue.done(hwtimer_id) end

--- 启动/停止一个带系统tick返回的外部中断
---@param pin number pin
---@param pull_mode number 上下拉模式,只能是0,gpio.PULLUP,gpio.PULLDOWN
---@param irq_mode number 中断模式,只能是gpio.BOTH,gpio.RISING,gpio.FALLING
---@param onoff boolean 开关，默认是false关
---@return nil #1 无返回值
--- ```lua
--- 对GPIO17进行外部中断捕获
--- ioqueue.exti(17, gpio.PULLUP, gpio.BOTH, true)
--- ioqueue.exti(17)
--- ```
function ioqueue.exti(pin, pull_mode, irq_mode, onoff) end
