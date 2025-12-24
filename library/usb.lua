---@meta

--- LuatOS IDE Helper for module: usb
--- ```yaml
--- Summary: usb操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_usb.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/usb
--- Video: 
--- Tag: LUAT_USE_USB
--- ```
--- ```lua
--- [[
--- 简单举例
--- pm.power(pm.USB, false)        --确保USB外设是掉电状态
--- usb.vid(0, 0x1234)        --配置VID,不是必须的
--- usb.pvid(0, 0x5678)        --配置PID,不是必须的
--- usb.clear_all_class(0)                --清除掉之前配置的设备类
--- usb.mode(0, usb.DEVICE)        --usb设置成从机模式
--- usb.add_class(0, usb.CDC_ACM, 1)    --使用1个CDC-ACM虚拟串口功能
--- usb.add_class(0, usb.WINUSB, 1)        --使用1个WINUSB功能
--- pm.power(pm.USB, true)        --USB上电初始化开始工作
--- 说明
--- 目前设备类只有usb.HID和usb.WINUSB可以通过usb操作库api和对端通讯,usb.CDC-ACM虚拟串口直接使用uart api
--- ]]
--- ```
usb = {}

--- USB主机模式 (number)
usb.HOST = 0

--- USB从机模式 (number)
usb.DEVICE = 0

--- USB otg模式 (number)
usb.OTG = 0

--- cdc_acm 虚拟串口类 (number)
usb.CDC_ACM = 0

--- audio音频类 (number)
usb.AUDIO = 0

--- 摄像头类 (number)
usb.CAMERA = 0

--- HID设备类，只支持键盘和自定义 (number)
usb.HID = 0

--- 大容量存储类，也就是U盘，TF卡 (number)
usb.MSC = 0

--- WINUSB类，透传数据 (number)
usb.WINUSB = 0

--- 有新的数据到来 (number)
usb.EV_RX = 0

--- 所有数据都已发送 (number)
usb.EV_TX = 0

--- usb从机已经连接上并且枚举成功 (number)
usb.EV_CONNECT = 0

--- usb从机断开 (number)
usb.EV_DISCONNECT = 0

--- usb从机挂起 (number)
usb.EV_SUSPEND = 0

--- usb从机恢复 (number)
usb.EV_RESUME = 0

--- USB发送数据,目前仅限于HID和WINUSB设备,CDC-ACM虚拟串口直接使用串口API操作
---@param id number 设备id,默认为0
---@param data zbuff or string 需要发送的数据
---@param class number 设备类
---@return boolean #1 成功返回true,否则返回false,总线id填错,所填设备类不支持直接发送数据等情况下返回错误
--- ```lua
--- HID上传数据
--- usb.tx(0, "1234", usb.HID) -- usb hid上传0x31 0x32 0x33 0x34  + N个0
--- ```
function usb.tx(id, data, class) end

--- buff形式读接收到的数据，一次读出全部数据存入buff中，如果buff空间不够会自动扩展
---@param id number 设备id,默认为0
---@param buff zbuff zbuff对象
---@param class number 设备类
---@return number #1 返回读到的长度，并把zbuff指针后移
--- ```lua
--- usb.rx(0, buff, usb.HID)
--- ```
function usb.rx(id, buff, class) end

--- 设置USB工作模式，必须在USB外设掉电不工作时进行设置
---@param id number usb总线id,默认0,如果芯片只有1条USB线,填0
---@param mode number 工作模式,只有3种,usb.HOST主机模式,usb.DEVICE从机模式,usb.OTG协商模式,默认是从机模式
---@return boolean #1 成功返回true,否则返回false,总线id填错,所选模式不支持时,USB外设正在工作等情况下返回失败
--- ```lua
--- pm.power(pm.USB, false)
--- usb.mode(0, usb.DEVICE)
--- pm.power(pm.USB, true)
--- ```
function usb.mode(id, mode) end

--- 注册USB事件回调
---@param id number usb总线id,默认0,如果芯片只有1条USB线,填0
---@param func function 回调方法
---@return nil #1 无返回值
--- ```lua
--- usb.on(0, function(id, class, event)
---     log.info("usb", id, class, event)
--- end)
--- 回调参数有3个
--- 1、usb总线id
--- 2、event,见usb.EV_XXX
--- 3、如果event是usb.EV_RX或usb.EV_TX,则第三个参数表示哪个设备类,目前只有usb.HID和usb.WINUSB
--- ```
function usb.on(id, func) end

--- 设置/获取USB的VID,必须在USB外设掉电不工作时进行设置,获取没有限制
---@param id number usb总线id,默认0,如果芯片只有1条USB线,填0
---@param vid number 想要设置的VID值,留空则不做设置
---@return boolean #1 成功或者获取VID时返回true,否则返回false,总线id填错,芯片不支持设置,USB外设正在工作等情况下返回失败
---@return number #2 当前VID值
--- ```lua
--- pm.power(pm.USB, false)
--- usb.vid(0, 0x1234)
--- pm.power(pm.USB, true)
--- ```
function usb.vid(id, vid) end

--- 设置/获取USB的PID,必须在USB外设掉电不工作时进行设置,获取没有限制
---@param id number usb总线id,默认0,如果芯片只有1条USB线,填0
---@param pid number 想要设置的PID值,留空则不做设置
---@return boolean #1 成功或者获取VID时返回true,否则返回false,总线id填错,芯片不支持设置,USB外设正在工作等情况下返回失败
---@return number #2 当前PID值
--- ```lua
--- pm.power(pm.USB, false)
--- usb.pid(0, 0x1234)
--- pm.power(pm.USB, true)
--- ```
function usb.pid(id, pid) end

--- 设置USB支持的设备类和数量，必须在USB外设掉电不工作时进行设置
---@param id number usb总线id,默认0,如果芯片只有1条USB线,填0
---@param class number 设备类,从机模式支持usb.CDC_ACM,usb.HID,usb.MSC,usb.WINUSB,主机模式支持usb.CAMERA
---@param num number 数量,目前只有从机的usb.CDC_ACM允许至多3个,其他只允许1个,超过时会强制改成所允许的最大值
---@return boolean #1 成功返回true,否则返回false,总线id填错,所选设备类不支持时,端点数量超过芯片允许的最大值,USB外设正在工作等情况下返回失败
--- ```lua
--- pm.power(pm.USB, false)
--- usb.add_class(0, usb.CDC_ACM, 3)    --使用3个CDC-ACM虚拟串口功能
--- usb.add_class(0, usb.WINUSB, 1)        --使用1个WINUSB功能
--- pm.power(pm.USB, true)
--- ```
function usb.add_class(id, class, num) end

--- 清除掉当前配置的设备类,必须在USB外设掉电不工作时进行设置
---@param id number usb总线id,默认0,如果芯片只有1条USB线,填0
---@return boolean #1 成功返回true,否则返回false,总线id填错,USB外设正在工作等情况下返回失败
--- ```lua
--- pm.power(pm.USB, false)
--- usb.clear_all_class(0)                --清除掉之前配置的设备类
--- usb.add_class(0, usb.CDC_ACM, 3)    --使用3个CDC-ACM虚拟串口功能
--- usb.add_class(0, usb.WINUSB, 1)        --使用1个WINUSB功能
--- pm.power(pm.USB, true)
--- ```
function usb.clear_all_class(id) end

--- 返回当前剩余的端点数
---@param id number usb总线id,默认0,如果芯片只有1条USB线,填0
---@return number #1 剩余的端点数,总线id填错时直接返回0
--- ```lua
--- log.info(usb.get_free_ep_num(0))
--- ```
function usb.get_free_ep_num(id) end
