---@meta

--- LuatOS IDE Helper for module: sfud
--- ```yaml
--- Summary: flash驱动 软件包(支持驱动nor flash设备)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/sfud/luat_lib_sfud.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/sfud
--- Video: 
--- Tag: LUAT_USE_SFUD
--- ```
sfud = {}

--- 初始化sfud
---@param spi_id number spi_id SPI的ID/userdata spi_device
---@param spi_cs number spi_cs SPI的片选
---@param spi_bandrate number spi_bandrate SPI的频率
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- spi
--- log.info("sfud.init",sfud.init(0,20,20 * 1000 * 1000))
--- spi_device
--- local spi_device = spi.deviceSetup(0,17,0,0,8,2000000,spi.MSB,1,0)
--- log.info("sfud.init",sfud.init(spi_device))
--- ```
function sfud.init(spi_id, spi_cs, spi_bandrate) end

--- 获取flash设备信息表中的设备总数
---@return number #1 返回设备总数
--- ```lua
--- log.info("sfud.getDeviceNum",sfud.getDeviceNum())
--- ```
function sfud.getDeviceNum() end

--- 通过flash信息表中的索引获取flash设备
---@param index number index flash信息表中的索引
---@return userdata #1 成功返回一个数据结构,否则返回nil
--- ```lua
--- local sfud_device = sfud.getDevice(1)
--- ```
function sfud.getDevice(index) end

--- 获取flash设备信息表
---@return userdata #1 成功返回一个数据结构,sfud flash tables地址
--- ```lua
--- local sfud_device = sfud.getDeviceTable()
--- ```
function sfud.getDeviceTable() end

--- 擦除 Flash 全部数据
---@param flash userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
---@return number #1 成功返回0
--- ```lua
--- sfud.chipErase(flash)
--- ```
function sfud.chipErase(flash) end

--- 擦除 Flash 指定地址指定大小，按照flash block大小进行擦除
---@param flash userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
---@param add number add 擦除地址
---@param size number size 擦除大小
---@return number #1 成功返回0
--- ```lua
--- sfud.erase(flash,add,size)
--- ```
function sfud.erase(flash, add, size) end

--- 读取 Flash 数据
---@param flash userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
---@param addr number addr 起始地址
---@param size number size 从起始地址开始读取数据的总大小
---@return string #1 data 读取到的数据
--- ```lua
--- log.info("sfud.read",sfud.read(sfud_device,1024,4))
--- ```
function sfud.read(flash, addr, size) end

--- 向 Flash 写数据
---@param flash userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
---@param addr number addr 起始地址
---@param data string data 待写入的数据
---@return number #1 成功返回0
--- ```lua
--- log.info("sfud.write",sfud.write(sfud_device,1024,"sfud"))
--- ```
function sfud.write(flash, addr, data) end

--- 先擦除再往 Flash 写数据
---@param flash userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
---@param addr number addr 起始地址
---@param data string data 待写入的数据
---@return number #1 成功返回0
--- ```lua
--- log.info("sfud.eraseWrite",sfud.eraseWrite(sfud_device,1024,"sfud"))
--- ```
function sfud.eraseWrite(flash, addr, data) end

--- 获取 Flash 容量和page大小
---@param flash userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
---@return number #1 Flash 容量
---@return number #2 page 页大小
--- ```lua
--- log.info("sfud.getInfo",sfud.getInfo(sfud_device))
--- ```
function sfud.getInfo(flash) end

--- 挂载sfud lfs文件系统
---@param flash userdata flash Flash 设备对象 sfud.get_device_table()返回的数据结构
---@param mount_point string mount_point 挂载目录名
---@param offset number 起始偏移量,默认0
---@param maxsize number 总大小, 默认是整个flash
---@return boolean #1 成功返回true
--- ```lua
--- log.info("sfud.mount",sfud.mount(sfud_device,"/sfud"))
--- log.info("fsstat", fs.fsstat("/"))
--- log.info("fsstat", fs.fsstat("/sfud"))
--- ```
function sfud.mount(flash, mount_point, offset, maxsize) end
