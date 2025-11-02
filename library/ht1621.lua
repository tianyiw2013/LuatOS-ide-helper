---@meta

--- LuatOS IDE Helper for module: ht1621
--- ```yaml
--- Summary: 液晶屏驱动(HT1621/HT1621B)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/ht1621/binding/luat_lib_ht1621.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_GPIO
--- ```
--- ```lua
--- 需要接3个GPIO引脚, 然后给ht1621接好供电
--- 假设 CS脚接   模块的 GPIO4
--- 假设 DATA脚接 模块的 GPIO5
--- 假设 WR脚接   模块的 GPIO3
--- local seg = ht1621.setup(4, 5, 3)
--- ht1621.lcd(seg, true) -- 背光亮起
--- ht1621.data(seg, 0, 0xeb) -- 位置0显示数字1
--- ```
ht1621 = {}

--- 初始化ht1621
---@param pin_cs number 片选引脚, 填模块的GPIO编码
---@param pin_data number 数据引脚, 填模块的GPIO编码
---@param pin_wr number WR引脚, 填模块的GPIO编码
---@param cmd_com_mode number 命令模式, 默认是0x52
---@param cmd_rc number 内部RC振荡器,默认0x30
---@param cmd_sysen number 系统振荡器开,默认0x02
---@return userdata #1 返回ht1621对象
--- ```lua
--- local seg = ht1621.setup(4, 5, 3)
--- ht1621.data(seg, 0, 0xeb)
--- ```
function ht1621.setup(pin_cs, pin_data, pin_wr, cmd_com_mode, cmd_rc, cmd_sysen) end

--- LCD开关
---@param seg userdata ht1621.setup返回的ht1621对象
---@param onoff boolean true开,false关
---@return nil #1 无返回值
--- ```lua
--- local seg = ht1621.setup(4, 5, 3)
--- ht1621.lcd(seg, true)
--- ```
function ht1621.lcd(seg, onoff) end

--- 展示数据
---@param seg userdata ht1621.setup返回的ht1621对象
---@param addr number 地址, 0-6, 超过6无效
---@param sdat number 数据, 0-255
---@return nil #1 无返回值
--- ```lua
--- local seg = ht1621.setup(4, 5, 3)
--- ht1621.lcd(seg, true)
--- ht1621.data(seg, 0, 0xF1)
--- 附数字0-9的值表
--- 0,1,2,3,4,5,6,7,8,9
--- 0xeb,0x0a,0xad,0x8f,0x4e,0xc7,0xe7,0x8a,0xef,0xcf
--- ```
function ht1621.data(seg, addr, sdat) end

--- 发送指令
---@param seg userdata ht1621.setup返回的ht1621对象
---@param cmd number 指令, 0-255
---@return nil #1 无返回值
--- ```lua
--- 具体指令请查阅硬件手册
--- ```
function ht1621.cmd(seg, cmd) end
