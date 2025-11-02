---@meta

--- LuatOS IDE Helper for module: little_flash
--- ```yaml
--- Summary: flash驱动 软件包(同时支持驱动nor flash和nand flash设备)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/little_flash/luat_lib_little_flash.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/little_flash
--- Video: 
--- Tag: LUAT_USE_LITTLE_FLASH
--- ```
lf = {}

--- 初始化 little_flash
---@param spi_device userdata spi_device
---@return userdata #1 成功返回一个数据结构,否则返回nil
--- ```lua
--- spi_device
--- spi_device = spi.deviceSetup(0,17,0,0,8,2000000,spi.MSB,1,0)
--- log.info("lf.init",lf.init(spi_device))
--- ```
function lf.init(spi_device) end

--- 擦除 Flash 指定地址指定大小，按照flash block大小进行擦除
---@param flash userdata flash Flash 设备对象 lf.init()返回的数据结构
---@param add number add 擦除地址
---@param size number size 擦除大小
---@return boolean #1 成功返回true
--- ```lua
--- lf.erase(flash,add,size)
--- ```
function lf.erase(flash, add, size) end

--- 擦除 Flash 全部数据
---@param flash userdata flash Flash 设备对象 lf.init()返回的数据结构
---@return boolean #1 成功返回true
--- ```lua
--- lf.chipErase(flash)
--- ```
function lf.chipErase(flash) end

--- 读取 Flash 数据
---@param flash userdata flash Flash 设备对象 lf.init()返回的数据结构
---@param addr number addr 起始地址
---@param size number size 从起始地址开始读取数据的总大小
---@return string #1 data 读取到的数据
--- ```lua
--- log.info("lf.read",lf.read(lf_device,1024,4))
--- ```
function lf.read(flash, addr, size) end

--- 向 Flash 写数据
---@param flash userdata flash Flash 设备对象 lf.init()返回的数据结构
---@param addr number addr 起始地址
---@param data string data 待写入的数据
---@return boolean #1 成功返回true
--- ```lua
--- log.info("lf.write",lf.write(lf_device,1024,"lf"))
--- ```
function lf.write(flash, addr, data) end

--- 先擦除再往 Flash 写数据
---@param flash userdata flash Flash 设备对象 lf.init()返回的数据结构
---@param addr number addr 起始地址
---@param data string data 待写入的数据
---@return boolean #1 成功返回true
--- ```lua
--- log.info("lf.eraseWrite",lf.eraseWrite(lf_device,1024,"lf"))
--- ```
function lf.eraseWrite(flash, addr, data) end

--- 获取 Flash 容量和page大小
---@param flash userdata flash Flash 设备对象 lf.init()返回的数据结构
---@return number #1 Flash 容量
---@return number #2 page 页大小
--- ```lua
--- log.info("lf.getInfo",lf.getInfo(lf_device))
--- ```
function lf.getInfo(flash) end

--- 挂载 little_flash lfs文件系统
---@param flash userdata flash Flash 设备对象 lf.init()返回的数据结构
---@param mount_point string mount_point 挂载目录名
---@param offset number 起始偏移量,默认0
---@param maxsize number 总大小, 默认是整个flash
---@return boolean #1 成功返回true
--- ```lua
--- log.info("lf.mount",lf.mount(little_flash_device,"/little_flash"))
--- ```
function lf.mount(flash, mount_point, offset, maxsize) end
