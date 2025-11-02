---@meta

--- LuatOS IDE Helper for module: tp
--- ```yaml
--- Summary: 触摸库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/tp/luat_lib_tp.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/lcd
--- Video: 
--- Tag: LUAT_USE_TP
--- ```
tp = {}

--- 空事件,不应出现 (number)
tp.EVENT_NONE = 0

--- 按下 (number)
tp.EVENT_DOWN = 0

--- 抬起 (number)
tp.EVENT_UP = 0

--- 移动 (number)
tp.EVENT_MOVE = 0

--- 触摸初始化
---@param tp string 触摸芯片型号，当前支持：<br>gt911 <br>gt9157 <br>jd9261t
---@param args table 附加参数,与具体设备有关：<br>port 驱动方式<br>port：硬件i2c端口,例如0,1,2...如果为软件i2c对象<br>pin_rst：复位引脚<br>pin_int：中断引脚<br>w:宽度(可选,默认会寻找已初始化的lcd的数据)<br>h:高度(可选,默认会寻找已初始化的lcd的数据)
---@return userdata #1 tp_device:触摸设备对象
--- ```lua
--- local function tp_callBack(tp_device, tp_data)
---         log.info("TP", tp_data[1].x, tp_data[1].y, tp_data[1].event)
---         sys.publish("TP", tp_device, tp_data)
---     end
--- 硬件i2c驱动
--- tp.init("gt911",{port=0,pin_rst = 22,pin_int = 23},tp_callBack)
--- 软件i2c驱动
--- local softI2C = i2c.createSoft(20, 21)
--- tp.init("gt911",{port=softI2C,pin_rst = 22,pin_int = 23},tp_callBack)
--- ```
function tp.init(tp, args) end
