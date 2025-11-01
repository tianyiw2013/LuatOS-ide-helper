usbapp = {}

--usbapp.set_id(id, vid, pid) - USB 设置VID和PID
--传入值：
--int 设备id,默认为0
--int vid 小端格式
--int pid 小端格式
--例子：
--usbapp.set_id(0, 0x1234, 0x5678)
function usbapp.set_id(id,vid,pid) end

--usbapp.hid_mode(id, mode, buff_size) - USB HID设备模式
--传入值：
--int 设备id,默认为0
--int mode，目前0是键盘，1是自定义
--int buff_size，只能是8,16,32,64，如果是键盘模式或者填了其他值，自动为8
--例子：
--usbapp.hid_mode(0, 0) -- usb hid键盘模式
--usbapp.hid_mode(0, 1) -- usb hid自定义模式，用于免驱USB交互
function usbapp.hid_mode(id,mode,buff_size) end

--usbapp.start(id) - 启动USB设备
--传入值：
--int 设备id,默认为0
--返回值：
--bool 成功返回true,否则返回false
--例子：
---- 启动USB
--usbapp.start(0)
function usbapp.start(id) end

--usbapp.stop(id) - 关闭USB设备
--传入值：
--int 设备id,默认为0
--返回值：
--bool 成功返回true,否则返回false
--例子：
---- 关闭USB
--usbapp.stop(0)
function usbapp.stop(id) end

--usbapp.vhid_upload(id, data) - USB HID设备上传数据
--传入值：
--int 设备id,默认为0
--string 数据. 注意, HID的可用字符是有限制的, 基本上只有可见字符是支持的, 不支持的字符会替换为空格.
--返回值：
--bool 成功返回true,否则返回false
--例子：
---- HID上传数据
--usbapp.vhid_upload(0, "1234") -- usb hid会模拟敲出1234
function usbapp.vhid_upload(id,data) end

--usbapp.hid_tx(id, data, start, len) - USB HID设备上传用户自定义数据
--传入值：
--int 设备id,默认为0
--string or zbuff 注意数据量不足时会自动填充0
--int 可选，data为zbuff才有效，要发送的数据起始位置，默认为0
--int 可选，data为zbuff才有效，要发送的数据长度，默认为zbuff内有效数据，最大值不超过zbuff的最大空间
--返回值：
--bool 成功返回true,否则返回false
--例子：
---- HID上传数据
--usbapp.hid_tx(0, "1234") -- usb hid上传0x31 0x32 0x33 0x34  + N个0
function usbapp.hid_tx(id,data,start,len) end

--usbapp.hid_rx(id, buff) - buff形式读接收到的数据，一次读出全部数据存入buff中，如果buff空间不够会自动扩展，目前只有air105支持这个操作
--传入值：
--int 设备id,默认为0
--zbuff zbuff对象
--返回值：
--int 返回读到的长度，并把zbuff指针后移
--例子：
--usbapp.hid_rx(0, buff)
function usbapp.hid_rx(id,buff) end

--usbapp.vhid_cancel_upload(id) - USB HID设备取消上传数据
--传入值：
--int 设备id,默认为0
--返回值：
--nil 无返回值
--例子：
---- 取消上传数据,通常不需要
--usbapp.vhid_cancel_upload(0)
function usbapp.vhid_cancel_upload(id) end

--usbapp.udisk_attach_sdhc(id) - USB U盘设备挂载SDHC，TF卡
--传入值：
--int 设备id,默认为0
--返回值：
--nil 无返回值
--例子：
--usbapp.udisk_attach_sdhc(0)
function usbapp.udisk_attach_sdhc(id) end

--usbapp.udisk_detach_sdhc(id) - USB U盘设备去除挂载SDHC，TF卡
--传入值：
--int 设备id,默认为0
--返回值：
--nil 无返回值
--例子：
--usbapp.udisk_detach_sdhc(0)
function usbapp.udisk_detach_sdhc(id) end