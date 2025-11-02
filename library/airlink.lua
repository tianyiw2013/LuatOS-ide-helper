---@meta

--- LuatOS IDE Helper for module: airlink
--- ```yaml
--- Summary: AirLink(设备间通讯协议)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/airlink/binding/luat_lib_airlink.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/airlink
--- Video: 
--- Tag: LUAT_USE_AIRLINK
--- ```
--- ```lua
--- 本库仅部分BSP支持, 通信形式以设备内SPI/设备间UART/设备间UART通信为主要载体
--- 主要是 Air8000 和 Air780E 系列
--- 详细用法请参考demo
--- ```
airlink = {}

--- airlink.start参数, SPI从机模式 (number)
airlink.MODE_SPI_SLAVE = 0

--- airlink.start参数, SPI主机模式 (number)
airlink.MODE_SPI_MASTER = 0

--- airlink.start参数, UART模式 (number)
airlink.MODE_UART = 0

--- SPI配置参数, 设置SPI的ID (number)
airlink.CONF_SPI_ID = 0

--- SPI配置参数, 设置SPI的CS脚的GPIO (number)
airlink.CONF_SPI_CS = 0

--- SPI/UART配置参数, 设置RDY脚的GPIO (number)
airlink.CONF_SPI_RDY = 0

--- SPI/UART配置参数, 设置IRQ脚的GPIO (number)
airlink.CONF_SPI_IRQ = 0

--- SPI配置参数, 设置SPI的波特率 (number)
airlink.CONF_SPI_SPEED = 0

--- SPIUART配置参数, 设置IRQ模式的等待超时时间 (number)
airlink.CONF_IRQ_TIMEOUT = 0

--- UART配置参数, 设置UART的ID (number)
airlink.CONF_UART_ID = 0

--- 初始化AirLink
---@return nil #1 无返回值
--- ```lua
--- 对于Air8000, 本函数已自动执行, 无需手动调用
--- 对于Air780EPM+Air8101的组合, 需要执行一次
--- airlink.init()
--- ```
function airlink.init() end

--- 启动AirLink
---@param mode number mode 0: SPI从机模式 1: SPI主机模式 2: UART模式
---@return nil #1 无返回值
--- ```lua
--- 对于Air8000, 本函数已自动执行, 无需手动调用
--- 对于Air780EPM+Air8101的组合, 需要执行一次
--- Air780EPM作为SPI主机
--- airlink.start(airlink.MODE_SPI_MASTER)
--- Air8101作为SPI从机
--- airlink.start(airlink.MODE_SPI_SLAVE)
--- ```
function airlink.start(mode) end

--- 关闭AirLink
---@param mode number mode 0: SPI从机模式 1: SPI主机模式 2: UART模式
---@return nil #1 无返回值
--- ```lua
--- 本函数当前无任何功能, 只做预留
--- ```
function airlink.stop(mode) end

--- 发送测试指令(nop空指令)
---@param count number count 发送次数
---@return nil #1 无返回值
--- ```lua
--- 本函数仅供内部测试使用
--- airlink.test(10)
--- ```
function airlink.test(count) end

--- 打印统计信息
---@return nil #1 无返回值
--- ```lua
--- 调试用途, 可周期性调用
--- airlink.statistics()
--- ```
function airlink.statistics() end

--- 重启从机
---@return nil #1 无返回值
--- ```lua
--- 调试用途, 可重启从机
--- airlink.slave_reboot()
--- ```
function airlink.slave_reboot() end

--- 发送自定义数据
---@param data string|zbuff 待传输的自定义数据,可以是字符串, 可以是zbuff
---@return nil #1 无返回值
--- ```lua
--- 本函数用于传递自定义数据到对端设备, 通常用于Air8101+Air780EPM的场景
--- airlink.sdata("hello world")
--- ```
function airlink.sdata(data) end

--- 判断是否就绪
---@return boolean #1 是否就绪
--- ```lua
--- 判断AirLink是否就绪, 指底层通信是否通畅, 最近一次通信是否超时(默认2s)
--- 本函数仅用于判断AirLink是否就绪, 不能用于判断是否收到数据
--- if airlink.ready() then
---     log.info("airlink", "已经就绪")
--- else
---     log.info("airlink", "尚未就绪")
--- end
--- ```
function airlink.ready() end

--- 配置AirLink的参数
---@param key number key 配置项, 参考airlink的常数项
---@param value number value 配置值
---@return boolean #1 成功返回true, 失败返回nil
--- ```lua
--- 配置AirLink的SPI ID为1, CS引脚为10, RDY引脚为11, IRQ引脚为12
--- airlink.config(airlink.CONF_SPI_ID, 1)
--- airlink.config(airlink.CONF_SPI_CS, 10)
--- airlink.config(airlink.CONF_SPI_RDY, 11)
--- airlink.config(airlink.CONF_SPI_IRQ, 12)
--- ```
function airlink.config(key, value) end

--- 升级从机固件
---@param path string 升级文件的路径
---@return boolean #1 成功返回true, 失败返回nil
--- ```lua
--- 注意, 升级过程是异步的, 耗时1~2分钟, 注意观察日志
--- airlink.sfota("/luadb/air8000s_v5.bin")
--- 注意, 升级过程中, 其他任何指令和数据都不再传输和执行!!!
--- ```
function airlink.sfota(path) end

--- 调试开关
---@param mode number mode 0: 关闭调试 1: 打开调试
---@return nil #1 无返回值
--- ```lua
--- 打开调试(默认是关闭状态)
--- airlink.debug(1)
--- ```
function airlink.debug(mode) end

--- 暂停或回复airlink通信
---@param mode number mode 0: 恢复 1: 暂停
---@return nil #1 无返回值
--- ```lua
--- 仅当airlink运行在轮询模式, 需要暂停时使用, 通常是为了休眠
--- airlink.pause(1)
--- ```
function airlink.pause(mode) end

--- 开启中断模式
---@param mode number mode false: 禁用 true: 启用
---@param master_gpio number master_gpio 主机引脚, 建议使用GPIO20
---@param slave_gpio number slave_gpio 从机引脚, Air8000使用GPIO140, Air8101使用GPIO28
---@return nil #1 无返回值
--- ```lua
--- 默认情况下, airlink工作在轮询模式, 周期性查询数据
--- 开启中断模式后, 从机有新数据时, 会在slave_gpio上产生一个下升沿+上升沿中断
--- airlink.irqmode(true, 20, 140)
--- 注意, 开启本模式, 外部接线必须稳固, 否则各种airlink相关操作都会异常
--- ```
function airlink.irqmode(mode, master_gpio, slave_gpio) end

--- 开启wakeup唤醒中断模式
---@param mode number mode false: 禁用 true: 启用
---@param master_gpio number master_gpio 主机引脚, 建议使用GPIO20
---@param slave_gpio number slave_gpio 从机引脚, Air8000使用GPIO140, Air8101使用GPIO28
---@param irq_mode number irq_mode 中断模式, 例如gpio.RISING (上升沿), gpio.FALLING (下降沿)
---@return nil #1 无返回值
--- ```lua
--- 用于设置唤醒wifi 开启此功能后, 会在Air8000主机休眠唤醒时，允许在master_gpio上产生一个脉冲，从而通过绑定的slave_gpio触发中断唤醒wifi
--- airlink.wakeupIrqmode(true, 20, 140, gpio.RISING)
--- 注意, 开启本模式, 外部接线必须稳固, 否则可能会导致触发的中断脉冲不完整或接收不到，从而无法唤醒wifi
--- ```
function airlink.wakeupIrqmode(mode, master_gpio, slave_gpio, irq_mode) end

--- 关闭airlink相关供电
---@param enable boolean enable true: 使能 false: 禁用
---@return nil #1 无返回值
--- ```lua
--- 关闭airlink相关供电, 通常用于省电
--- 当前仅对Air8000带wifi功能的模组有效
--- 关闭之后, 如需使用wifi功能, 需要重新执行wifi.init等操作
--- 注意, wifi供电关掉后, >=128的GPIO也会变成输入高阻态
--- airlink.power(false)
--- 开启wifi芯片,恢复airlink通信
--- airlink.power(true)
--- ```
function airlink.power(enable) end

--- 获取从机版本号
---@return number #1 从机固件版本号
--- ```lua
--- 注意, 获取之前, 需要确定airlink.ready()已经返回true
--- log.info("airlink", "从机固件版本号", airlink.sver())
--- ```
function airlink.sver() end
