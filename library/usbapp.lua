---@meta

--- LuatOS IDE Helper for module: usbapp
--- ```yaml
--- Summary: USB功能操作
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/usbapp/luat_lib_usbapp.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/usb_hid
--- Video: 
--- Tag: LUAT_USE_USB
--- ```
usbapp = {}

--- NO_READY事件 (number)
usbapp.NO_READY = 0

--- READY事件 (number)
usbapp.READY = 0

--- SEND_OK事件 (number)
usbapp.SEND_OK = 0

--- NEW_DATA事件 (number)
usbapp.NEW_DATA = 0

--- USB 设置VID和PID
---@param id number 设备id,默认为0
---@param vid number vid 小端格式
---@param pid number pid 小端格式
--- ```lua
--- usbapp.set_id(0, 0x1234, 0x5678)
--- ```
function usbapp.set_id(id, vid, pid) end

--- USB HID设备模式
---@param id number 设备id,默认为0
---@param mode number mode，目前0是键盘，1是自定义
---@param buff_size number buff_size，只能是8,16,32,64，如果是键盘模式或者填了其他值，自动为8
--- ```lua
--- usbapp.hid_mode(0, 0) -- usb hid键盘模式
--- usbapp.hid_mode(0, 1) -- usb hid自定义模式，用于免驱USB交互
--- ```
function usbapp.hid_mode(id, mode, buff_size) end

--- 启动USB设备
---@param id number 设备id,默认为0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- 启动USB
--- usbapp.start(0)
--- ```
function usbapp.start(id) end

--- 关闭USB设备
---@param id number 设备id,默认为0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- 关闭USB
--- usbapp.stop(0)
--- ```
function usbapp.stop(id) end

--- USB HID设备上传数据
---@param id number 设备id,默认为0
---@param data string 数据. 注意, HID的可用字符是有限制的, 基本上只有可见字符是支持的, 不支持的字符会替换为空格.
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- HID上传数据
--- usbapp.vhid_upload(0, "1234") -- usb hid会模拟敲出1234
--- ```
function usbapp.vhid_upload(id, data) end

--- USB HID设备上传用户自定义数据
---@param id number 设备id,默认为0
---@param data string or zbuff 注意数据量不足时会自动填充0
---@param start number 可选，data为zbuff才有效，要发送的数据起始位置，默认为0
---@param len number 可选，data为zbuff才有效，要发送的数据长度，默认为zbuff内有效数据，最大值不超过zbuff的最大空间
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- HID上传数据
--- usbapp.hid_tx(0, "1234") -- usb hid上传0x31 0x32 0x33 0x34  + N个0
--- ```
function usbapp.hid_tx(id, data, start, len) end

--- buff形式读接收到的数据，一次读出全部数据存入buff中，如果buff空间不够会自动扩展，目前只有air105支持这个操作
---@param id number 设备id,默认为0
---@param buff zbuff zbuff对象
---@return number #1 返回读到的长度，并把zbuff指针后移
--- ```lua
--- usbapp.hid_rx(0, buff)
--- ```
function usbapp.hid_rx(id, buff) end

--- USB HID设备取消上传数据
---@param id number 设备id,默认为0
---@return nil #1 无返回值
--- ```lua
--- 取消上传数据,通常不需要
--- usbapp.vhid_cancel_upload(0)
--- ```
function usbapp.vhid_cancel_upload(id) end

--- USB U盘设备挂载SDHC，TF卡
---@param id number 设备id,默认为0
---@return nil #1 无返回值
--- ```lua
--- usbapp.udisk_attach_sdhc(0)
--- ```
function usbapp.udisk_attach_sdhc(id) end

--- USB U盘设备去除挂载SDHC，TF卡
---@param id number 设备id,默认为0
---@return nil #1 无返回值
--- ```lua
--- usbapp.udisk_detach_sdhc(0)
--- ```
function usbapp.udisk_detach_sdhc(id) end
