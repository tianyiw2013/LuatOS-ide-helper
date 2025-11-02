---@meta

--- LuatOS IDE Helper for module: spi
--- ```yaml
--- Summary: spi操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_spi.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/spi
--- Video: https://www.bilibili.com/video/BV1VY411M7YH
--- Tag: LUAT_USE_SPI
--- ```
--- ```lua
--- 本库支持2套API风格
--- 1. 老的API,spi.xxx 方式,需要自己控制软件cs引脚，不同设备要手动重新配置spi参数
--- 2. 新的API(推荐使用), spidevice对象方式,不需要手动控制cs引脚，不同设备也无需重复配置参数,设备内部自动管理
--- 老API
--- spi.setup(0,nil,0,0,8,2000000,spi.MSB,1,1)
--- local result = spi.send(0, "123")--发送123
--- local recv = spi.recv(0, 4)--接收4字节数据
--- spi.close(0)
--- 新API, 注意spi_device是一个对象,选一个全局名称, 避免被回收
--- spi_device = spi.deviceSetup(0,17,0,0,8,2000000,spi.MSB,1,1)
--- local result = spi_device:send("123")--发送123
--- local recv = spi_device:recv(4)--接收4字节数据
--- spi_device:close()
--- ```
spi = {}
spi_device = {}

--- 大端模式 (number)
spi.MSB = 0

--- 小端模式 (number)
spi.LSB = 0

--- 主机模式 (number)
spi.master = 0

--- 从机模式 (number)
spi.slave = 0

--- 全双工 (number)
spi.full = 0

--- 半双工 (number)
spi.half = 0

--- SPI0 (number)
spi.SPI_0 = 0

--- SPI1 (number)
spi.SPI_1 = 0

--- SPI2 (number)
spi.SPI_2 = 0

--- SPI3 (number)
spi.SPI_3 = 0

--- SPI4 (number)
spi.SPI_4 = 0

--- 高速SPI0，目前105专用 (number)
spi.HSPI_0 = 0

--- 设置并启用SPI
---@param id number SPI号,例如0
---@param cs number CS 片选脚,在w600不可用请填nil
---@param CPHA number CPHA 默认0,可选0/1
---@param CPOL number CPOL 默认0,可选0/1
---@param dataw number 数据宽度,默认8bit
---@param bandrate number 波特率,默认2M=2000000
---@param bitdict number 大小端, 默认spi.MSB, 可选spi.LSB
---@param ms number 主从设置, 默认主1, 可选从机0. 通常只支持主机模式
---@param mode number 工作模式, 全双工1, 半双工0, 默认全双工
---@return number #1 成功返回0,否则返回其他值
--- ```lua
--- 初始化spi
--- spi.setup(0,20,0,0,8,2000000,spi.MSB,1,1)
--- ```
function spi.setup(id, cs, CPHA, CPOL, dataw, bandrate, bitdict, ms, mode) end

--- 设置并启用软件SPI
---@param cs number cs引脚编号，传入nil意为Lua控制cs脚
---@param mosi number mosi引脚编号
---@param miso number miso引脚编号
---@param clk number clk引脚编号
---@param CPHA number 默认0，可选0/1
---@param CPOL number 默认0，可选0/1
---@param dataw number 数据宽度，默认8bit
---@param bitdict number 大小端，默认spi.MSB, 可选spi.LSB
---@param ms number 主从设置，默认主1, 可选从机0. 通常只支持主机模式
---@param mode number 工作模式，全双工1，半双工0，默认半双工
---@return 软件SPI对象 #1 可当作SPI的id使用
--- ```lua
--- 初始化软件spi
--- local softSpiDevice = spi.createSoft(0, 1, 2, 3, 0, 0, 8, spi.MSB, 1, 1)
--- local result = spi.send(softSpiDevice, string.char(0x9f))
--- ```
function spi.createSoft(cs, mosi, miso, clk, CPHA, CPOL, dataw, bitdict, ms, mode) end

--- 关闭指定的SPI
---@param id number SPI号,例如0
---@return number #1 成功返回0,否则返回其他值
--- ```lua
--- 关闭spi0
--- spi.close(0)
--- ```
function spi.close(id) end

--- 传输SPI数据
---@param id number SPI号(例如0)或软件SPI对象
---@param send_data string|zbuff 待发送的数据，如果为zbuff数据，则会从对象所处的指针处开始读
---@param send_len number 可选。待发送数据的长度，默认为data长度
---@param recv_len number 可选。读取数据的长度，默认为1. 注意, 如果是全双工模式,收发长度必须相等
---@return string #1 读取成功返回字符串,否则返回nil
--- ```lua
--- 初始化spi
--- spi.setup(0,nil,0,0,8,2000000,spi.MSB,1,1)
--- local recv = spi.transfer(0, "123")--发送123,并读取数据
--- local buff = zbuff.create(1024, 0x33) --创建一个初值全为0x33的内存区域
--- local recv = spi.transfer(0, buff)--把zbuff数据从指针开始，全发出去,并读取数据
--- ```
function spi.transfer(id, send_data, send_len, recv_len) end

--- 接收指定长度的SPI数据
---@param id number SPI号,例如0
---@param size number 数据长度
---@param buff userdata zbuff对象,可选,2024.3.29新增
---@return string|number #1 读取成功返回字符串,若传入的是zbuff就返回读取大小,出错返回nil
--- ```lua
--- 初始化spi
--- spi.setup(0,nil,0,0,8,2000000,spi.MSB,1,1)
--- 接收数据
--- local recv = spi.recv(0, 4)--接收4字节数据
--- 当传入zbuff参数时,返回值有所不同. 2024.3.29新增
--- 读取成功后, 指针会往后移动len个字节
--- 写入位置以当前used()位置开始, 请务必确保有足够空间写入len长度的数据
--- local len = spi.recv(0, 4, buff)
--- ```
function spi.recv(id, size, buff) end

--- 发送SPI数据
---@param id number SPI号,例如0
---@param data string|zbuff 待发送的数据，如果为zbuff数据，则会从对象所处的指针处开始读
---@param len number 可选。待发送数据的长度，默认为data长度
---@return number #1 发送结果
--- ```lua
--- 初始化spi
--- spi.setup(0,nil,0,0,8,2000000,spi.MSB,1,1)
--- local result = spi.send(0, "123")--发送123
--- local buff = zbuff.create(1024, 0x33) --创建一个初值全为0x33的内存区域
--- local result = spi.send(0, buff)--把zbuff数据从指针开始，全发出去
--- ```
function spi.send(id, data, len) end

--- 设置并启用SPI(对象方式)
---@param id number SPI号,例如0
---@param cs number CS 片选脚,在w600不可用请填nil
---@param CPHA number CPHA 默认0,可选0/1
---@param CPOL number CPOL 默认0,可选0/1
---@param dataw number 数据宽度,默认8bit
---@param bandrate number 波特率,默认20M=20000000
---@param bitdict number 大小端, 默认spi.MSB, 可选spi.LSB
---@param ms number 主从设置, 默认主1, 可选从机0. 通常只支持主机模式
---@param mode number 工作模式, 全双工1, 半双工0, 默认全双工
---@return userdata #1 spi_device
--- ```lua
--- 初始化spi
--- spi_device = spi.deviceSetup(0,17,0,0,8,2000000,spi.MSB,1,1)
--- ```
function spi.deviceSetup(id, cs, CPHA, CPOL, dataw, bandrate, bitdict, ms, mode) end

--- 关闭指定的SPI(对象方式)
---@return number #1 成功返回0,否则返回其他值
--- ```lua
--- 初始化spi
--- spi_device:close()
--- ```
function spi_device:close() end

--- 传输SPI数据(对象方式)
---@param send_data userdata spi_device
---@param send_len string|zbuff 待发送的数据，如果为zbuff数据，则会从对象所处的指针处开始读
---@param recv_len number 可选。待发送数据的长度，默认为data长度
---@return string #1 读取成功返回字符串,否则返回nil
--- ```lua
--- 初始化spi
--- spi_device = spi.device_setup(0,17,0,0,8,2000000,spi.MSB,1,1)
--- local recv = spi_device:transfer("123")--发送123,并读取数据
--- local result = spi_device:transfer({0x00,0x01})--发送0x00,0x01,并读取数据
--- local buff = zbuff.create(1024, 0x33) --创建一个初值全为0x33的内存区域
--- local recv = spi_device:transfer(buff)--把zbuff数据从指针开始，全发出去,并读取数据
--- ```
function spi_device:transfer(send_data, send_len, recv_len) end

--- 发送SPI数据(对象方式)
---@param data userdata spi_device
---@param len string|zbuff 待发送的数据，如果为zbuff数据，则会从对象所处的指针处开始读
---@return number #1 发送结果
--- ```lua
--- 初始化spi
--- spi_device = spi.device_setup(0,17,0,0,8,2000000,spi.MSB,1,1)
--- local result = spi_device:send("123")--发送123
--- local result = spi_device:send({0x00,0x01})--发送0x00,0x01
--- local buff = zbuff.create(1024, 0x33) --创建一个初值全为0x33的内存区域
--- local result = spi_device:send(buff)--把zbuff数据从指针开始，全发出去
--- ```
function spi_device:send(data, len) end

--- 接收指定长度的SPI数据(对象方式)
---@param size userdata spi_device
---@return string #1 读取成功返回字符串,否则返回nil
--- ```lua
--- 初始化spi
--- spi_device = spi.device_setup(0,17,0,0,8,2000000,spi.MSB,1,1)
--- local recv = spi_device:recv(4)--接收4字节数据
--- ```
function spi_device:recv(size) end

--- 非阻塞方式硬件SPI传输SPI数据，目的为了提高核心利用率。API直接返回是否启动传输，传输完成后通过topic回调，本API适合硬件SPI传输大量数据传输，外设功能（LCD SPI，W5500 SPI之类的）占据的SPI和软件SPI不能用，少量数据传输建议使用传统阻塞型API
---@param id userdata or int spi_device或者spi_id，注意，如果是spi_device，需要手动在传输完成后拉高cs!!!!!!
---@param txbuff zbuff 待发送的数据，如果为nil，则只接收数据，由于用的非阻塞模型，为保证动态数据的有效性，只能使用zbuff，发送的数据从zbuff.addr
---@param rxbuff zbuff 接收数据，如果为nil，则只发送数据，由于用的非阻塞模型，为保证动态数据的有效性，只能使用zbuff，接收的数据从zbuff.addr开始存储
---@param rx_len number 传输数据长度，特别说明 如果为半双工，先发后收，比如spi flash操作这种，则长度=发送字节+接收字节，注意上面发送和接收buff都要留足够的数据，后续接收数据处理需要跳过发送数据长度字节
---@param transfer_done_topic string 传输完成后回调的topic
---@return boolean #1 true/false 本次传输是否正确启动，true，启动，false，有错误无法启动。传输完成会发布消息transfer_done_topic和boolean型结果
--- ```lua
--- local result = spi.xfer(spi.SPI_0, txbuff, rxbuff, 1024, "SPIDONE") if result then result, spi_id, succ, error_code = sys.waitUntil("SPIDONE") end if not result or not succ then log.info("spi fail, error code", error_code) else log.info("spi ok") end
--- ```
function spi.xfer(id, txbuff, rxbuff, rx_len, transfer_done_topic) end
