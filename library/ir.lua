---@meta

--- LuatOS IDE Helper for module: ir
--- ```yaml
--- Summary: 红外遥控
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_ir.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/ir
--- Video: 
--- Tag: LUAT_USE_IR
--- ```
ir = {}

--- 发送NEC数据
---@param pin number 使用的GPIO引脚编号
---@param addr number 用户码（大于0xff则采用Extended NEC模式）
---@param cmd number 数据码
---@param repeats number 可选，引导码发送次数（110ms一次），默认0次
---@param disablePWM boolean 可选，是否禁止直接发送pwm波，默认false
--- ```lua
--- 直接发
--- ir.sendNEC(0, 0x11, 0x22)
--- 外接了38K的PWM载波，只控制电平
--- ir.sendNEC(0, 0x11, 0x22,0,true)
--- ```
function ir.sendNEC(pin, addr, cmd, repeats, disablePWM) end
