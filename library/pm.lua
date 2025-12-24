---@meta

--- LuatOS IDE Helper for module: pm
--- ```yaml
--- Summary: 电源管理
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_pm.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/pm
--- Video: 
--- Tag: LUAT_USE_PM
--- ```
--- ```lua
--- [[
--- 休眠模式简介
--- 全速模式
--- PRO低功耗模式
--- PSM+模式
--- 以上模式均使用 pm.power(pm.WORK_MODE, mode) 来设置
--- mode=0   正常运行,就是无休眠
--- mode=1   轻度休眠, CPU停止, RAM保持, 可中断唤醒, 可定时器唤醒, 可网络唤醒. 支持从休眠处继续运行
--- mode=3   彻底休眠, CPU停止, RAM掉电, 支持特殊唤醒管脚唤醒, 支持定时器唤醒. 唤醒后脚本从头开始执行
--- ]]
--- ```
pm = {}

--- 不休眠模式 (number)
pm.NONE = 0

--- IDLE模式 (number)
pm.IDLE = 0

--- LIGHT模式 (number)
pm.LIGHT = 0

--- DEEP模式 (number)
pm.DEEP = 0

--- HIB模式 (number)
pm.HIB = 0

--- USB电源 (number)
pm.USB = 0

--- GPS电源 (number)
pm.GPS = 0

--- GPS的天线电源，有源天线才需要 (number)
pm.GPS_ANT = 0

--- camera电源，CAM_VCC输出 (number)
pm.CAMERA = 0

--- Air780EXXX的DAC_EN(新版硬件手册的LDO_CTL，同一个PIN，命名变更)，注意audio的默认配置会自动使用这个脚来控制CODEC的使能 (number)
pm.DAC_EN = 0

--- Air780EXXX的LDO_CTL(老版硬件手册的DAC_EN，同一个PIN，命名变更)，Air780EXXX的LDO_CTL, 注意audio的默认配置会自动使用这个脚来控制CODEC的使能 (number)
pm.LDO_CTL = 0

--- 是否Air780EXXX的powerkey滤波模式，true开，注意滤波模式下reset变成直接关机 (number)
pm.PWK_MODE = 0

--- Air780EXXX的节能模式，0~3，0完全关闭，1~2普通低功耗，3超低功耗，深度休眠 (number)
pm.WORK_MODE = 0

--- 所有GPIO高电平电压控制,当前仅Air780EXXX可用 (number)
pm.IOVOL_ALL_GPIO = 0

--- VMMC电压域IO (number)
pm.IOVOL_SDIO = 0

--- VLCD电压域IO (number)
pm.IOVOL_LCD = 0

--- camera模拟电压 (number)
pm.IOVOL_CAMA = 0

--- camera数字电压 (number)
pm.IOVOL_CAMD = 0

--- PM控制的ID, 主芯片, 任意芯片的默认值就是它 (number)
pm.ID_NATIVE = 0

--- PM控制的ID, WIFI芯片, 仅Air8000可用 (number)
pm.ID_WIFI = 0

--- wifi芯片控制STA模式下的DTIM间隔,单位100ms,默认值是1 (number)
pm.WIFI_STA_DTIM = 0

--- 请求进入指定的休眠模式
---@param mode number 休眠模式,例如pm.IDLE/LIGHT/DEEP/HIB.
---@param chip number 休眠芯片的ID, 默认是0, 大部分型号都只有0
---@return boolean #1 处理结果,即使返回成功,也不一定会进入, 也不会马上进入
--- ```lua
--- 请求进入休眠模式
--- [[
--- IDLE   正常运行,就是无休眠
--- LIGHT  轻休眠, CPU停止, RAM保持, 外设保持, 可中断唤醒. 部分型号支持从休眠处继续运行
--- DEEP   深休眠, CPU停止, RAM掉电, 仅特殊引脚保持的休眠前的电平, 大部分管脚不能唤醒设备.
--- HIB    彻底休眠, CPU停止, RAM掉电, 仅复位/特殊唤醒管脚可唤醒设备.
--- ]]
--- pm.request(pm.HIB)
--- ```
function pm.request(mode, chip) end

--- 启动底层定时器,在休眠模式下依然生效. 只触发一次，关机状态下无效
---@param id number 定时器id,通常是0-5
---@param timeout number 定时时长,单位毫秒
---@return boolean #1 处理结果
--- ```lua
--- 添加底层定时器
--- pm.dtimerStart(0, 300 * 1000) -- 5分钟后唤醒
--- 针对Air780EXXX有如下限制
--- id = 0 或者 id = 1 是, 最大休眠时长是2.5小时
--- id >= 2是, 最大休眠时长是740小时
--- ```
function pm.dtimerStart(id, timeout) end

--- 关闭底层定时器
---@param id number 定时器id
--- ```lua
--- 关闭底层定时器
--- pm.dtimerStop(0) -- 关闭id=0的底层定时器
--- ```
function pm.dtimerStop(id) end

--- 检查底层定时器是不是在运行
---@param id number 定时器id
---@return boolean #1 处理结果,true还在运行，false不在运行
---@return number #2 如果运行,运行剩余时间,单位毫秒(需bsp支持)
--- ```lua
--- 检查底层定时器是不是在运行
--- pm.dtimerCheck(0) -- 检查id=0的底层定时器
--- ```
function pm.dtimerCheck(id) end

--- 检查定时唤醒是哪一个定时器，如果不是定时唤醒的，返回-1
---@return number #1 处理结果 >=0 是本次定时唤醒的定时器ID，其他错误，说明不是定时唤醒的
--- ```lua
--- local timer_id = pm.dtimerWkId()
--- ```
function pm.dtimerWkId() end

--- 开机原因,用于判断是从休眠模块开机,还是电源/复位开机
---@return number #1 0-上电/复位开机, 1-RTC开机, 2-WakeupIn/Pad/IO开机, 3-未知原因(Wakeup/RTC皆有可能)开机,目前只有air101,air103会有这个返回值
---@return number #2 0-普通开机(上电/复位),3-深睡眠开机,4-休眠开机
---@return number #3 复位开机详细原因：0-powerkey或者上电开机 1-充电或者AT指令下载完成后开机 2-闹钟开机 3-软件重启 4-未知原因 5-RESET键 6-异常重启 7-工具控制重启 8-内部看门狗重启 9-外部重启 10-充电开机
--- ```lua
--- 是哪种方式开机呢
--- log.info("pm", "last power reson", pm.lastReson())
--- ```
function pm.lastReson() end

--- 强制进入指定的休眠模式，忽略某些外设的影响，比如USB
---@param mode number 休眠模式
---@return boolean #1 处理结果,若返回成功,大概率会马上进入该休眠模式
--- ```lua
--- 请求进入休眠模式
--- pm.force(pm.HIB)
--- 针对Air780EXXX, 该操作会关闭USB通信
--- 唤醒后如需开启USB, 请打开USB电压
--- pm.power(pm.USB, true)
--- ```
function pm.force(mode) end

--- 检查休眠状态
---@return boolean #1 处理结果,如果能顺利进入休眠,返回true,否则返回false
---@return number #2 底层返回值,0代表能进入最底层休眠,其他值代表最低可休眠级别
--- ```lua
--- 请求进入休眠模式,然后检查是否能真的休眠
--- pm.request(pm.HIB)
--- if pm.check() then
---     log.info("pm", "it is ok to hib")
--- else
--- 针对Air780EXXX, 该操作会关闭USB通信
---     pm.force(pm.HIB) -- 强制休眠
--- 唤醒后如需开启USB, 请打开USB电压
--- sys.wait(100)
--- pm.power(pm.USB, true)
--- end
--- ```
function pm.check() end

--- 关机
---@return nil #1 无返回值
--- ```lua
--- 当前支持移芯CAT1平台系列(Air780E/Air700E/Air780EP等等)
--- 需要2022-12-22之后编译的固件
--- pm.shutdown()
--- ```
function pm.shutdown() end

--- 重启
---@return nil #1 无返回值
function pm.reboot() end

--- 开启内部的电源控制，注意不是所有的平台都支持，可能部分平台支持部分选项，看硬件
---@param id number 电源控制id, 包括开关型pm.USB（USB电源） pm.GPS（GPS电源） pm.PWK_MODE（powerkey模式）和 数值型pm.WORK_MODE（功耗模式）
---@param onoff boolean|number 开关型控制：true/1打开供电，false/0关闭供电，默认关。pm.WORK_MODE 0~3，0完全关闭，1~2普通低功耗，3超低功耗，深度休眠
---@param chip number 休眠芯片的ID, 默认是0, 大部分型号都只有0。1是协处理器，如air8000内的wifi芯片
---@return boolean #1 处理结果true成功，false失败
--- ```lua
--- 关闭USB电源, 反之开启就是传true
--- pm.power(pm.USB, false) 
--- Air780EG,为内置的GPS芯片上电. 注意, Air780EG的GPS和GPS_ANT是一起控制的,所以合并了.
--- pm.power(pm.GPS, true)
--- Air780EXXX开启pwrkey开机防抖
--- 注意: 开启后, 复位键就变成关机了!!! pwrkey要长按2秒才能开机
--- pm.power(pm.PWK_MODE, true)
--- Air780EXXX PSM+低功耗设置
--- Air780EXXX节能模式，0~3，0完全关闭，1~2普通低功耗，3超低功耗，深度休眠
--- 详情访问: https://airpsm.cn
--- pm.power(pm.WORK_MODE, 1)
--- ```
function pm.power(id, onoff, chip) end

--- IO高电平和对外输出LDO的电压控制
---@param id number 电平id,目前只有pm.IOVOL_ALL_GPIO
---@param val number 电平值,单位毫伏
---@return boolean #1 处理结果true成功，false失败
--- ```lua
--- Air780EXXX设置IO电平, 范围 1650 ~ 2000，2650~3400 , 单位毫伏, 步进50mv
--- 注意, 这里的设置优先级会高于硬件IOSEL脚的配置
--- 但开机时依然先使用硬件配置,直至调用本API进行配置, 所以io电平会变化
--- pm.ioVol(pm.IOVOL_ALL_GPIO, 3300)    -- 所有GPIO高电平输出3.3V
--- pm.ioVol(pm.IOVOL_ALL_GPIO, 1800)    -- 所有GPIO高电平输出1.8V
--- ```
function pm.ioVol(id, val) end

--- 配置唤醒引脚
---@param pin number gpio引脚
---@param level number 唤醒方式, 例如gpio.RISING (上升沿), gpio.FALLING (下降沿)
---@return boolean #1 处理结果
--- ```lua
--- 本函数仅Air8101有效
--- pm.wakeupPin(8, gpio.RISING)
--- 对Air780xx系列, Air8000, Air72x系列均无效
--- 对于这些系列，使用gpio.setup即可, 例如使用 WAKEUP0引脚实现唤醒操作
--- gpio.setup(gpio.WAKEUP0, function() end, gpio.PULLUP, gpio.RISING)
--- 注意, 对于PSM+休眠, 唤醒相当于重启, 回调函数是不会执行的
--- 对于PRO休眠, 回调函数会执行
--- 唤醒原因, 可以通过 pm.lastReson()获取
--- ```
function pm.wakeupPin(pin, level) end

--- 单总线命令读写YHM27XX
---@param pin number yhm27xx_CMD引脚(可选,若传入nil则根据模组型号自动选择)
---@param chip_id number 芯片ID
---@param reg number 读写寄存器地址
---@param data number 要写入的数据，如果没填，则表示从寄存器读取数据
---@return boolean #1 成功返回true,失败返回false
---@return number #2 读取成功返回寄存器值，写入成功无返回
--- ```lua
--- 读取寄存器0x01的值
--- local ret = pm.chgcmd(pin, chip_id, 0x01)
--- 写入寄存器0x01的值为0x55
--- local ret = pm.chgcmd(pin, chip_id, 0x01, 0x55)
--- ```
function pm.chgcmd(pin, chip_id, reg, data) end

--- 获取最新的寄存器信息(异步)
---@param pin number yhm27xx_CMD引脚(可选,若传入nil则根据模组型号自动选择)
---@param chip_id number 芯片ID
---@return nil #1 无返回值
--- ```lua
--- sys.subscribe("YHM27XX_REG", function(data)
--- 注意, 会一次性读出0-9,总共8个寄存器值
---     log.info("yhm27xx", data and data:toHex())
--- end)
--- pm.chginfo(nil, 0x04)
--- ```
function pm.chginfo(pin, chip_id) end
