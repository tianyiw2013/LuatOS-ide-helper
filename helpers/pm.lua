pm = {}

--pm.request(mode) - 请求进入指定的休眠模式
--传入值：
--int 休眠模式,例如pm.IDLE/LIGHT/DEEP/HIB.
--返回值：
--boolean 处理结果,即使返回成功,也不一定会进入, 也不会马上进入
--例子：
---- 请求进入休眠模式
----[[
--IDLE   正常运行,就是无休眠
--LIGHT  轻休眠, CPU停止, RAM保持, 外设保持, 可中断唤醒. 部分型号支持从休眠处继续运行
--DEEP   深休眠, CPU停止, RAM掉电, 仅特殊引脚保持的休眠前的电平, 大部分管脚不能唤醒设备.
--HIB    彻底休眠, CPU停止, RAM掉电, 仅复位/特殊唤醒管脚可唤醒设备.
--]]
--
--pm.request(pm.HIB)
function pm.request(mode) end

--pm.dtimerStart(id, timeout) - 启动底层定时器,在休眠模式下依然生效. 只触发一次，关机状态下无效
--传入值：
--int 定时器id,通常是0-5
--int 定时时长,单位毫秒
--返回值：
--boolean 处理结果
--例子：
---- 添加底层定时器
--pm.dtimerStart(0, 300 * 1000) -- 5分钟后唤醒
---- 移芯CAT1平台系列(Air780E/Air700E/Air780EP等等)
---- id = 0 或者 id = 1 是, 最大休眠时长是2.5小时
---- id >= 2是, 最大休眠时长是740小时
function pm.dtimerStart(id,timeout) end

--pm.dtimerStop(id) - 关闭底层定时器
--传入值：
--int 定时器id
--例子：
---- 关闭底层定时器
--pm.dtimerStop(0) -- 关闭id=0的底层定时器
function pm.dtimerStop(id) end

--pm.dtimerCheck(id) - 检查底层定时器是不是在运行
--传入值：
--int 定时器id
--返回值：
--boolean 处理结果,true还在运行，false不在运行
--number 如果运行,运行剩余时间,单位毫秒(需bsp支持)
--例子：
---- 检查底层定时器是不是在运行
--pm.dtimerCheck(0) -- 检查id=0的底层定时器
function pm.dtimerCheck(id) end

--pm.lastReson() - 开机原因,用于判断是从休眠模块开机,还是电源/复位开机
--返回值：
--int 0-上电/复位开机, 1-RTC开机, 2-WakeupIn/Pad/IO开机, 3-未知原因(Wakeup/RTC皆有可能)开机,目前只有air101,air103会有这个返回值
--int 0-普通开机(上电/复位),3-深睡眠开机,4-休眠开机
--int 复位开机详细原因：0-powerkey或者上电开机 1-充电或者AT指令下载完成后开机 2-闹钟开机 3-软件重启 4-未知原因 5-RESET键 6-异常重启 7-工具控制重启 8-内部看门狗重启 9-外部重启 10-充电开机
--例子：
---- 是哪种方式开机呢
--log.info("pm", "last power reson", pm.lastReson())
function pm.lastReson() end

--pm.force(mode) - 强制进入指定的休眠模式，忽略某些外设的影响，比如USB
--传入值：
--int 休眠模式
--返回值：
--boolean 处理结果,若返回成功,大概率会马上进入该休眠模式
--例子：
---- 请求进入休眠模式
--pm.force(pm.HIB)
---- 移芯CAT1平台系列(Air780E/Air700E/Air780EP等等), 该操作会关闭USB通信
---- 唤醒后如需开启USB, 请打开USB电压
----pm.power(pm.USB, true)
function pm.force(mode) end

--pm.check() - 检查休眠状态
--返回值：
--boolean 处理结果,如果能顺利进入休眠,返回true,否则返回false
--int 底层返回值,0代表能进入最底层休眠,其他值代表最低可休眠级别
--例子：
---- 请求进入休眠模式,然后检查是否能真的休眠
--pm.request(pm.HIB)
--if pm.check() then
--    log.info("pm", "it is ok to hib")
--else
--    -- 移芯CAT1平台系列(Air780E/Air700E/Air780EP等等), 该操作会关闭USB通信
--    pm.force(pm.HIB) -- 强制休眠
--    -- 唤醒后如需开启USB, 请打开USB电压
--    --sys.wait(100)
--    --pm.power(pm.USB, true)
--end
function pm.check() end

--pm.shutdown() - 关机
--返回值：
--nil 无返回值
--例子：
---- 当前支持移芯CAT1平台系列(Air780E/Air700E/Air780EP等等)
---- 需要2022-12-22之后编译的固件
--pm.shutdown()
function pm.shutdown() end

--pm.reboot() - 重启
--返回值：
--nil 无返回值
function pm.reboot() end

--pm.power(id, onoff) - 开启内部的电源控制，注意不是所有的平台都支持，可能部分平台支持部分选项，看硬件
--传入值：
--int 电源控制id,pm.USB pm.GPS之类
--boolean or int 开关true/1开，false/0关，默认关，部分选项支持数值
--返回值：
--boolean 处理结果true成功，false失败
--例子：
---- 关闭USB电源, 反之开启就是传true
--pm.power(pm.USB, false) 
--
---- Air780EG,为内置的GPS芯片上电. 注意, Air780EG的GPS和GPS_ANT是一起控制的,所以合并了.
--pm.power(pm.GPS, true)
--
---- 移芯CAT1平台系列(Air780E/Air700E/Air780EP等等)开启pwrkey开机防抖
---- 注意: 开启后, 复位键就变成关机了!!! pwrkey要长按2秒才能开机
---- pm.power(pm.PWK_MODE, true)
--
---- 移芯CAT1平台系列(Air780E/Air700E/Air780EP等等)PSM+低功耗设置
---- 移芯CAT1平台系列(Air780E/Air700E/Air780EP等等)节能模式，0~3，0完全关闭，1性能优先，2平衡，3极致功耗
---- 详情访问: https://airpsm.cn
---- pm.power(pm.WORK_MODE, 1)
function pm.power(id,onoff) end

--pm.ioVol(id, val) - IO高电平电压控制
--传入值：
--int 电平id,目前只有pm.IOVOL_ALL_GPIO
--int 电平值,单位毫伏
--返回值：
--boolean 处理结果true成功，false失败
--例子：
---- 移芯CAT1平台系列(Air780E/Air700E/Air780EP等等)设置IO电平, 范围 1650 ~ 2000，2650~3400 , 单位毫伏, 步进50mv
---- 注意, 这里的设置优先级会高于硬件IOSEL脚的配置
---- 但开机时依然先使用硬件配置,直至调用本API进行配置, 所以io电平会变化
---- pm.ioVol(pm.IOVOL_ALL_GPIO, 3300)    -- 所有GPIO高电平输出3.3V
---- pm.ioVol(pm.IOVOL_ALL_GPIO, 1800)    -- 所有GPIO高电平输出1.8V
function pm.ioVol(id,val) end

--pm.wakeupPin(pin,level) - 配置唤醒引脚 (当前仅仅esp系列可用)
--传入值：
--int/table gpio引脚
--int 唤醒电压 可选,默认低电平唤醒
--返回值：
--boolean 处理结果
--例子：
--pm.wakeupPin(8,0)
function pm.wakeupPin(pin,level) end