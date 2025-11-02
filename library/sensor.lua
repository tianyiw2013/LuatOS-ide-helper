---@meta

--- LuatOS IDE Helper for module: sensor
--- ```yaml
--- Summary: 传感器操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_sensor.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/dht11
--- Video: 
--- Tag: LUAT_USE_SENSOR
--- ```
--- ```lua
--- 请查阅demo/dht11 demo/ds18b20
--- ```
sensor = {}

--- 获取DS18B20的温度数据
---@param pin number gpio端口号
---@param check_crc boolean 是否校验crc值,默认为true. 不校验crc值能提高读取成功的概率,但可能会读取到错误的值
---@return number #1 温度数据,单位0.1摄氏度，读取失败时返回错误码
---@return boolean #2 成功返回true,否则返回false
--- ```lua
--- while 1 do
---     sys.wait(5000)
---     local val,result = sensor.ds18b20(17, true) -- GPIO17且校验CRC值
--- val 301 == 30.1摄氏度
--- result true 读取成功
---     log.info("ds18b20", val, result)
--- end
--- ```
function sensor.ds18b20(pin, check_crc) end

--- 单总线协议,复位设备
---@param pin number gpio端口号
---@return nil #1 无返回
function sensor.w1_reset(pin) end

--- 单总线协议,连接设备
---@param pin number gpio端口号
---@return boolean #1 成功返回true,失败返回false
function sensor.w1_connect(pin) end

--- 单总线协议,往总线写入数据
---@param pin number gpio端口号
---@param data1 number 第一个数据
---@param data2 number 第二个数据, 可以写N个数据
---@return nil #1 无返回值
function sensor.w1_write(pin, data1, data2) end

--- 单总线协议,从总线读取数据
---@param pin number gpio端口号
---@param len number 读取的长度
---@return number #1 按读取的长度返回N个整数
function sensor.w1_read(pin, len) end

--- 获取Hx711的压力传感数据
---@param pin_date number 数据的gpio端口号
---@param pin_clk number 时钟的gpio端口号
---@return number #1 hx711读到的数据
--- ```lua
--- 如果设备不存在会卡在读取接口
--- sys.taskInit(
---     function()
---         sys.wait(1000)
---         local maopi = sensor.hx711(0,7)
---         while true do
---             sys.wait(2000)
---             a = sensor.hx711(0,7) - maopi
---             if a > 0 then
---                 log.info("tag", a / 4.6)
---             end
---         end
---     end
--- )
--- ```
function sensor.hx711(pin_date, pin_clk) end

--- 获取cs1237传感数据
---@param pin_date number 数据的gpio端口号
---@param pin_clk number 时钟的gpio端口号
---@return number #1 cs1237读到的数据
--- ```lua
--- 如果设备不存在会卡在读取接口
--- sys.taskInit(
---     function()
---         sys.wait(1000)
---         local cs1237_data = sensor.cs1237(0,7)
---         while true do
---             sys.wait(2000)
---             cs1237_data = sensor.cs1237(0,7) - maopi
---             log.info("cs1237_data:", cs1237_data)--得到原始数据
---         end
---     end
--- )
--- ```
function sensor.cs1237(pin_date, pin_clk) end

--- 设置ws2812b输出(gpio驱动方式)
---@param pin number ws2812b的gpio端口号
---@param data string|zbuff 待发送的数据（如果为zbuff数据，则会无视指针位置始终从0偏移开始）
---@param T0H number T0H时间，表示延时多少个nop，每个型号不一样，自己调
---@param T0L number T0L时间，表示延时多少个nop
---@param T1H number T1H时间，表示延时多少个nop
---@param T1L number T1L时间，表示延时多少个nop
--- ```lua
--- local buff = zbuff.create({8,8,24})
--- buff:drawLine(1,2,5,6,0x00ffff)
--- sensor.ws2812b(7,buff,300,700,700,700)
--- ```
function sensor.ws2812b(pin, data, T0H, T0L, T1H, T1L) end

--- 设置ws2812b输出(pwm驱动方式,需要pwm能输出800k频率，否则无法使用此方法)
---@param pin number pwm端口号
---@param data string|zbuff 待发送的数据（如果为zbuff数据，则会无视指针位置始终从0偏移开始）
--- ```lua
--- local buff = zbuff.create({8,8,24})
--- buff:setFrameBuffer(8,8,24,0x0000ff)
--- sensor.ws2812b_pwm(7,buff)
--- ```
function sensor.ws2812b_pwm(pin, data) end

--- 设置ws2812b输出(spi驱动方式,需要spi能输出5M频率，否则无法使用此方法)
---@param pin number spi端口号
---@param data string|zbuff 待发送的数据（如果为zbuff数据，则会无视指针位置始终从0偏移开始）
--- ```lua
--- local buff = zbuff.create({8,8,24})
--- buff:setFrameBuffer(8,8,24,0x0000ff)
--- sensor.ws2812b_spi(2,buff)
--- ```
function sensor.ws2812b_spi(pin, data) end

--- 获取DHT11/DHT12的温湿度数据
---@param pin number gpio端口号
---@return number #1 湿度数据,单位0.01%，读取失败时返回错误值
---@return number #2 温度数据,单位0.01摄氏度，读取失败时返回错误值
---@return boolean #3 成功返回true,否则返回false
--- ```lua
--- while 1 do
---     sys.wait(1000)
---     local h,t,r = sensor.dht1x(17, true) -- GPIO17且校验CRC值
---     log.info("dht11", h/100,t/100,r)--90.1 23.22
--- end
--- ```
function sensor.dht1x(pin) end

--- 获取sc12a被触摸的通道数据
---@param sda number 数据的gpio端口号
---@param scl number 时钟的gpio端口号
---@return number #1 读取成功返回整形数据，读取失败时返回错误值
--- ```lua
--- while true do
---   local temp1=sensor.sc12a(4,7)
---   if bit.rshift(bit.band( temp1, 0x8000), 15 )==0x01 then
---     log.info("被按下的有通道0")
---   end
---   if bit.rshift(bit.band( temp1, 0x4000), 14 )==0x01 then
---     log.info("被按下的有通道1")
---   end
---   if bit.rshift(bit.band( temp1, 0x2000), 13 )==0x01 then
---     log.info("被按下的有通道2")
---   end
---   if bit.rshift(bit.band( temp1, 0x1000), 12 )==0x01 then
---     log.info("被按下的有通道3")
---   end
---   if bit.rshift(bit.band( temp1, 0x800), 11 )==0x01 then
---     log.info("被按下的有通道4")
---   end
---   if bit.rshift(bit.band( temp1, 0x400), 10 )==0x01 then
---     log.info("被按下的有通道5")
---   end
---   if bit.rshift(bit.band( temp1, 0x200), 9 )==0x01 then
---     log.info("被按下的有通道6")
---   end
---   if bit.rshift(bit.band( temp1, 0x100), 8 )==0x01 then
---     log.info("被按下的有通道7")
---   end
---   if bit.rshift(bit.band( temp1, 0x80), 7 )==0x01 then
---     log.info("被按下的有通道8")
---   end
---   if bit.rshift(bit.band( temp1, 0x40), 6 )==0x01 then
---     log.info("被按下的有通道9")
---   end
---   if bit.rshift(bit.band( temp1, 0x20), 5 )==0x01 then
---     log.info("被按下的有通道10")
---   end
---   if bit.rshift(bit.band( temp1, 0x10), 4 )==0x01 then
---     log.info("被按下的有通道11")
---   end
---   sys.wait(200)
--- end
--- ```
function sensor.sc12a(sda, scl) end

--- 单总线命令读写YHM27XX
---@param pin number gpio端口号
---@param chip_id number 芯片ID
---@param reg number 寄存器地址
---@param data number 要写入的数据，如果没填，则表示从寄存器读取数据
---@return boolean #1 成功返回true,失败返回false
---@return number #2 读取成功返回寄存器值，写入成功无返回
--- ```lua
--- while 1 do
---     sys.wait(1000)
---     local result, data = sensor.yhm27xxx(15, 0x04, 0x05)
---     log.info("yhm27xxx", result, data)
--- end
--- ```
function sensor.yhm27xxx(pin, chip_id, reg, data) end
