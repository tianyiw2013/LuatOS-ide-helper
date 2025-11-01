sfud = {}

--sfud.init(spi_id, spi_cs, spi_bandrate) - 初始化sfud
--传入值：
--int spi_id SPI的ID/userdata spi_device
--int spi_cs SPI的片选
--int spi_bandrate SPI的频率
--返回值：
--bool 成功返回true,否则返回false
--例子：
----spi
--log.info("sfud.init",sfud.init(0,20,20 * 1000 * 1000))
----spi_device
--local spi_device = spi.deviceSetup(0,17,0,0,8,2000000,spi.MSB,1,0)
--log.info("sfud.init",sfud.init(spi_device))
function sfud.init(spi_id,spi_cs,spi_bandrate) end

--sfud.getDeviceNum() - 获取flash设备信息表中的设备总数
--返回值：
--int 返回设备总数
--例子：
--log.info("sfud.getDeviceNum",sfud.getDeviceNum())
function sfud.getDeviceNum() end

--sfud.getDevice(index) - 通过flash信息表中的索引获取flash设备
--传入值：
--int index flash信息表中的索引
--返回值：
--userdata 成功返回一个数据结构,否则返回nil
--例子：
--local sfud_device = sfud.getDevice(1)
function sfud.getDevice(index) end

--sfud.getDeviceTable() - 获取flash设备信息表
--返回值：
--userdata 成功返回一个数据结构,否则返回nil
--例子：
--local sfud_device = sfud.getDeviceTable()
function sfud.getDeviceTable() end

--sfud.chipErase(flash) - 擦除 Flash 全部数据
--传入值：
--userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
--返回值：
--int 成功返回0
--例子：
--sfud.chipErase(flash)
function sfud.chipErase(flash) end

--sfud.erase(flash,add,size) - 擦除 Flash 指定地址指定大小，按照flash block大小进行擦除
--传入值：
--userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
--number add 擦除地址
--number size 擦除大小
--返回值：
--int 成功返回0
--例子：
--sfud.erase(flash,add,size)
function sfud.erase(flash,add,size) end

--sfud.read(flash, addr, size) - 读取 Flash 数据
--传入值：
--userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
--int addr 起始地址
--int size 从起始地址开始读取数据的总大小
--返回值：
--string data 读取到的数据
--例子：
--log.info("sfud.read",sfud.read(sfud_device,1024,4))
function sfud.read(flash,addr,size) end

--sfud.write(flash, addr,data) - 向 Flash 写数据
--传入值：
--userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
--int addr 起始地址
--string data 待写入的数据
--返回值：
--int 成功返回0
--例子：
--log.info("sfud.write",sfud.write(sfud_device,1024,"sfud"))
function sfud.write(flash,addr,data) end

--sfud.eraseWrite(flash, addr,data) - 先擦除再往 Flash 写数据
--传入值：
--userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
--int addr 起始地址
--string data 待写入的数据
--返回值：
--int 成功返回0
--例子：
--log.info("sfud.eraseWrite",sfud.eraseWrite(sfud_device,1024,"sfud"))
function sfud.eraseWrite(flash,addr,data) end

--sfud.getInfo(flash) - 获取 Flash 容量和page大小
--传入值：
--userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
--返回值：
--int Flash 容量
--int page 页大小
--例子：
--log.info("sfud.getInfo",sfud.getInfo(sfud_device))
function sfud.getInfo(flash) end

--sfud.mount(flash, mount_point, offset, maxsize) - 挂载sfud lfs文件系统
--传入值：
--userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
--string mount_point 挂载目录名
--int 起始偏移量,默认0
--int 总大小, 默认是整个flash
--返回值：
--bool 成功返回true
--例子：
--log.info("sfud.mount",sfud.mount(sfud_device,"/sfud"))
--log.info("fsstat", fs.fsstat("/"))
--log.info("fsstat", fs.fsstat("/sfud"))
function sfud.mount(flash,mount_point,offset,maxsize) end