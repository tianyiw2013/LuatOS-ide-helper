local spi_device = {}

--spi_device:close() - 关闭指定的SPI(对象方式)
--传入值：
--userdata spi_device
--返回值：
--int 成功返回0,否则返回其他值
--例子：
---- 初始化spi
--spi_device.close()
function spi_device:close() end

--spi_device:transfer(send_data[, len]) - 传输SPI数据(对象方式)
--传入值：
--userdata spi_device
--string/zbuff 待发送的数据，如果为zbuff数据，则会从对象所处的指针处开始读
--int 可选。待发送数据的长度，默认为data长度
--int 可选。读取数据的长度，默认为1
--返回值：
--string 读取成功返回字符串,否则返回nil
--例子：
---- 初始化spi
--local spi_device = spi.device_setup(0,17,0,0,8,2000000,spi.MSB,1,1)
--local recv = spi_device:transfer("123")--发送123,并读取数据
--local result = spi_device:transfer({0x00,0x01})--发送0x00,0x01,并读取数据
--
--local buff = zbuff.create(1024, 0x33) --创建一个初值全为0x33的内存区域
--local recv = spi_device:transfer(buff)--把zbuff数据从指针开始，全发出去,并读取数据
function spi_device:transfer(send_data,len) end

--spi_device:send(data[, len]) - 发送SPI数据(对象方式)
--传入值：
--userdata spi_device
--string/zbuff 待发送的数据，如果为zbuff数据，则会从对象所处的指针处开始读
--返回值：
--int 发送结果
--例子：
---- 初始化spi
--local spi_device = spi.device_setup(0,17,0,0,8,2000000,spi.MSB,1,1)
--local result = spi_device:send("123")--发送123
--local result = spi_device:send({0x00,0x01})--发送0x00,0x01
--
--local buff = zbuff.create(1024, 0x33) --创建一个初值全为0x33的内存区域
--local result = spi_device:send(buff)--把zbuff数据从指针开始，全发出去
function spi_device:send(data,len) end

--spi_device:recv(size) - 接收指定长度的SPI数据(对象方式)
--传入值：
--userdata spi_device
--int 数据长度
--返回值：
--string 读取成功返回字符串,否则返回nil
--例子：
---- 初始化spi
--local spi_device = spi.device_setup(0,17,0,0,8,2000000,spi.MSB,1,1)
--local recv = spi_device:recv(4)--接收4字节数据
function spi_device:recv(size) end