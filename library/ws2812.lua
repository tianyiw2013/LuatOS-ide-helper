---@meta

--- LuatOS IDE Helper for module: ws2812
--- ```yaml
--- Summary: 幻彩灯带RGB控制器(WS2812系列)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/ws2812/binding/luat_lib_ws2812.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_WS2812
--- ```
--- ```lua
--- 本库尚在开发阶段
--- ```
ws2812 = {}

--- 创建上下文
---@param mode number 传输模式, 例如 ws2812.GPIO, ws2812.PWM, ws2812.SPI
---@param count number RGB灯总个数
---@param id number 主参数id, 对于不同的模式有不同的值
---@return userdata #1 创建成功返回上下文,否则返回nil
--- ```lua
--- GPIO模式, 64个灯, 使用GPIO9
--- local leds = ws2812.create(ws2812.GPIO, 64, 9)
--- SPI模式, 32个灯, 使用SPI1
--- local leds = ws2812.create(ws2812.SPI, 32, 1)
--- PWM模式, 16个灯, 使用PWM4
--- local leds = ws2812.create(ws2812.PWM, 16, 4)
--- HW模式, 64个灯, 使用硬件专用实现,具体id需要对照手册
--- local leds = ws2812.create(ws2812.RMT, 64, 2)
--- 注意: 并非所有模块都支持以上所有模式
--- 而且, 固件需要开启对应的GPIO/SPI/PWM功能才能使用对应的模式
--- ```
function ws2812.create(mode, count, id) end

--- 设置灯的颜色
---@param leds userdata 通过ws2812.create获取到的上下文
---@param index number 灯的编号,从0开始
---@param R number RGB值中的R值
---@param G number RGB值中的G值
---@param B number RGB值中的B值
---@return boolean #1 设置成功返回true,否则返回nil
--- ```lua
--- RGB逐个颜色传递
--- ws2812.set(leds, 5, 0xFF, 0xAA, 0x11)
--- 也支持一个参数传完, 与前一条等价
--- ws2812.set(leds, 5, 0xFFAA11)
--- ```
function ws2812.set(leds, index, R, G, B) end

--- 发送数据到设备
---@param leds userdata 通过ws2812.create获取到的上下文
---@param fast_mode boolean GPIO模式下是否使用快速发送模式，默认不使用，其他模式均强制不使用。仅适用少量灯使用，灯数量不能超过os-tick时间/1个灯数据帧发送最长时间
---@return boolean #1 设置成功返回true,否则返回nil
---@return number #2 快速发送模式下数据帧发送总消耗时间，不包括起始帧，单位CPU-TICK。非快速发送模式下，是随机值
--- ```lua
--- ws2812.send(leds)    --普通模式发送，无需处理返回值
--- local _,t = ws2812.send(leds, true) --快速模式下，需要对消耗时间进行判断，超过理论时间太多说明被中断打断过，需要重发
--- ```
function ws2812.send(leds, fast_mode) end

--- 配置额外参数
---@param leds userdata 通过ws2812.create获取到的上下文
---@param arg0 number 额外参数0
---@param arg1 number 额外参数1
---@param arg2 number 额外参数2
---@param arg3 number 额外参数3
---@param arg4 number 额外参数4
---@return boolean #1 设置成功返回true,否则返回nil
--- ```lua
--- 本函数与具体模式有关
--- GPIO模式可调整T0H T0L, T1H T1L 的具体延时
--- ws2812.send(leds, t0h, t0l, t1h, t1l)
--- ```
function ws2812.args(leds, arg0, arg1, arg2, arg3, arg4) end
