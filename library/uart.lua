---@meta

--- LuatOS IDE Helper for module: uart
--- ```yaml
--- Summary: 串口操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_uart.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/uart
--- Video: https://www.bilibili.com/video/BV1er4y1p75y
--- Tag: LUAT_USE_UART
--- ```
uart = {}

--- 奇校验,大小写兼容性 (number)
uart.Odd = 0

--- 偶校验,大小写兼容性 (number)
uart.Even = 0

--- 无校验,大小写兼容性 (number)
uart.None = 0

--- 奇校验 (number)
uart.ODD = 0

--- 偶校验 (number)
uart.EVEN = 0

--- 无校验 (number)
uart.NONE = 0

--- 小端模式 (number)
uart.LSB = 0

--- 大端模式 (number)
uart.MSB = 0

--- 虚拟串口0 (number)
uart.VUART_0 = 0

--- 遇到错误时抛弃缓存的数据 (number)
uart.ERROR_DROP = 0

--- 开启调试功能 (number)
uart.DEBUG = 0

--- 配置串口参数
---@param id number 串口id, uart0写0, uart1写1, 如此类推, 最大值取决于设备
---@param baud_rate number 波特率, 默认115200，可选择波特率表:{2000000,921600,460800,230400,115200,57600,38400,19200,9600,4800,2400}
---@param data_bits number 数据位，默认为8, 可选 7/8
---@param stop_bits number 停止位，默认为1, 根据实际情况，可以有0.5/1/1.5/2等
---@param partiy number 校验位，可选 uart.None/uart.Even/uart.Odd
---@param bit_order number 大小端，默认小端 uart.LSB, 可选 uart.MSB
---@param buff_size number 缓冲区大小，默认值1024
---@param rs485_gpio number 485模式下的转换GPIO, 默认值0xffffffff
---@param rs485_level number 485模式下的rx方向GPIO的电平, 默认值0
---@param rs485_delay number 485模式下tx向rx转换的延迟时间，默认值12bit的时间，单位us, 9600波特率填20000
---@param debug_enable number 开启调试功能，默认使能，填写uart.DEBUG或者非数字使能，其他值都是关闭，目前只有移芯平台支持
---@param error_drop number 遇到接收错误是否放弃缓存数据，默认使能，填写uart.ERROR_DROP或者非数字使能，其他值都是关闭，目前只有移芯平台支持
---@return number #1 成功返回0,失败返回其他值
--- ```lua
--- 最常用115200 8N1
--- uart.setup(1, 115200, 8, 1, uart.NONE)
--- 可以简写为 uart.setup(1)
--- 485自动切换, 选取GPIO10作为收发转换脚
--- uart.setup(1, 115200, 8, 1, uart.NONE, uart.LSB, 1024, 10, 0, 2000)
--- 遇到接收错误不抛弃缓存数据
--- uart.setup(1, 115200, 8, 1, uart.NONE, nil, 1024, nil, nil, nil, nil, 0)
--- ```
function uart.setup(id, baud_rate, data_bits, stop_bits, partiy, bit_order, buff_size, rs485_gpio, rs485_level, rs485_delay, debug_enable, error_drop) end

--- 写串口
---@param id number 串口id, uart0写0, uart1写1
---@param data string|zbuff 待写入的数据，如果是zbuff会从指针起始位置开始读
---@return number #1 成功的数据长度
--- ```lua
--- 写入可见字符串
--- uart.write(1, "rdy\r\n")
--- 写入十六进制的数据串
--- uart.write(1, string.char(0x55,0xAA,0x4B,0x03,0x86))
--- ```
function uart.write(id, data) end

--- FIFO方式取出串口缓存的数据
---@param id number 串口id, uart0写0, uart1写1
---@param len number 期望读取长度，可选，不填时读取全部，无论写多少，最多读取当前缓存区所有数据
---@return string #1 读取到的数据 / 传入zbuff时，返回读到的长度，并把zbuff指针后移
--- ```lua
--- uart.read(1, 16)
--- ```
function uart.read(id, len) end

--- 关闭串口
---@param id number 串口id, uart0写0, uart1写1
---@return nil #1 无返回值
--- ```lua
--- uart.close(1)
--- ```
function uart.close(id) end

--- 注册串口事件回调
---@param id number 串口id, uart0写0, uart1写1
---@param event string 事件名称，目前只有"receive"/"recv":新数据接收完成或者接收缓存满了,"sent":发送结束
---@param func function 回调方法
---@return nil #1 无返回值
--- ```lua
--- uart.on(1, "receive", function(id, len)
---     local data = uart.read(id, len)
---     log.info("uart", id, len, data)
--- end)
--- ```
function uart.on(id, event, func) end

--- 等待485模式下TX完成，mcu不支持串口发送移位寄存器空或者类似中断时才需要，在sent事件回调后使用
---@param id number 串口id, uart0写0, uart1写1
---@return number #1 等待了多少次循环才等到tx完成，用于粗劣的观察delay时间是否足够，返回不为0说明还需要放大delay
function uart.wait485(id) end

--- 检查串口号是否存在
---@param id number 串口id, uart0写0, uart1写1, 如此类推
---@return boolean #1 存在返回true
function uart.exist(id) end

--- buff形式读串口，一次读出全部数据存入buff中，如果buff空间不够会自动扩展，目前air105,Air780EXXX支持这个操作
---@param id number 串口id, uart0写0, uart1写1
---@param buff zbuff zbuff对象
---@return number #1 返回读到的长度，并把zbuff指针后移
--- ```lua
--- uart.rx(1, buff)
--- ```
function uart.rx(id, buff) end

--- 读串口Rx缓存中剩余数据量，目前air105,Air780EXXX支持这个操作
---@param id number 串口id, uart0写0, uart1写1
---@return number #1 返回读到的长度
--- ```lua
--- local size = uart.rxSize(1)
--- ```
function uart.rxSize(id) end

--- 清除串口Rx缓存中剩余数据量，目前air105,Air780EXXX支持这个操作
---@param id number 串口id, uart0写0, uart1写1
--- ```lua
--- uart.rxClear(1)
--- ```
function uart.rxClear(id) end

--- buff形式写串口,等同于c语言uart_tx(uart_id, &buff[start], len);
---@param id number 串口id, uart0写0, uart1写1
---@param buff zbuff 待写入的数据，如果是zbuff会从指针起始位置开始读
---@param start number 可选，要发送的数据起始位置，默认为0
---@param len number 可选，要发送的数据长度，默认为zbuff内有效数据，最大值不超过zbuff的最大空间
---@return number #1 成功的数据长度
--- ```lua
--- uart.tx(1, buf)
--- ```
function uart.tx(id, buff, start, len) end

--- 设置软件uart的硬件配置，只有支持硬件定时器的SOC才能使用，目前只能设置一个，波特率根据平台的软硬件配置有不同的极限，建议9600，接收缓存不超过65535，不支持MSB，支持485自动控制。后续仍要setup操作
---@param tx_pin number 发送引脚编号
---@param tx_hwtimer_id number 发送用的硬件定时器ID
---@param rx_pin number 接收引脚编号
---@param rx_hwtimer_id number 接收用的硬件定时器ID
---@param adjust_period number 发送时序调整，单位是定时器时钟周期，默认是0，需要根据示波器或者逻辑分析仪进行微调
---@return number #1 软件uart的id，如果失败则返回nil
--- ```lua
--- 初始化软件uart
--- local uart_id = uart.createSoft(21, 0, 1, 2) --air780e建议用定时器0和2，tx_pin最好用AGPIO，防止休眠时误触发对端RX
--- ```
function uart.createSoft(tx_pin, tx_hwtimer_id, rx_pin, rx_hwtimer_id, adjust_period) end

--- 获取可用串口号列表，当前仅限win32
---@param max number 可选，默认256，最多获取多少个串口
---@return table #1 获取到的可用串口号列表
function uart.list(max) end
