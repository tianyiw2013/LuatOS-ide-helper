lf = {}

--lf.init(spi_device) - 初始化 little_flash
--传入值：
--int userdata spi_device
--返回值：
--userdata 成功返回一个数据结构,否则返回nil
--例子：
----spi_device
--spi_device = spi.deviceSetup(0,17,0,0,8,2000000,spi.MSB,1,0)
--log.info("lf.init",lf.init(spi_device))
function lf.init(spi_device) end

--lf.mount(flash, mount_point, offset, maxsize) - 挂载 little_flash lfs文件系统
--传入值：
--userdata flash Flash 设备对象 lf.init()返回的数据结构
--string mount_point 挂载目录名
--int 起始偏移量,默认0
--int 总大小, 默认是整个flash
--返回值：
--bool 成功返回true
--例子：
--log.info("lf.mount",lf.mount(little_flash_device,"/little_flash"))
function lf.mount(flash,mount_point,offset,maxsize) end