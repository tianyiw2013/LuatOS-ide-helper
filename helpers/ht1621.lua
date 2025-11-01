ht1621 = {}

--ht1621.setup(pin_cs, pin_data, pin_wr, cmd_com_mode, cmd_rc, cmd_sysen) - 初始化ht1621
--传入值：
--int 片选引脚, 填模块的GPIO编码
--int 数据引脚, 填模块的GPIO编码
--int WR引脚, 填模块的GPIO编码
--int 命令模式, 默认是0x52
--int 内部RC振荡器,默认0x30
--int 系统振荡器开,默认0x02
--返回值：
--userdata 返回ht1621对象
--例子：
--local seg = ht1621.setup(4, 5, 3)
--ht1621.data(seg, 0, 0xeb)
function ht1621.setup(pin_cs,pin_data,pin_wr,cmd_com_mode,cmd_rc,cmd_sysen) end

--ht1621.lcd(seg, onoff) - LCD开关
--传入值：
--userdata ht1621.setup返回的ht1621对象
--boolean true开,false关
--返回值：
--nil 无返回值
--例子：
--local seg = ht1621.setup(4, 5, 3)
--ht1621.lcd(seg, true)
function ht1621.lcd(seg,onoff) end

--ht1621.data(seg, addr, sdat) - 展示数据
--传入值：
--userdata ht1621.setup返回的ht1621对象
--int 地址, 0-6, 超过6无效
--int 数据, 0-255
--返回值：
--nil 无返回值
--例子：
--local seg = ht1621.setup(4, 5, 3)
--ht1621.lcd(seg, true)
--ht1621.data(seg, 0, 0xF1)
---- 附数字0-9的值表
---- 0,1,2,3,4,5,6,7,8,9
---- 0xeb,0x0a,0xad,0x8f,0x4e,0xc7,0xe7,0x8a,0xef,0xcf
function ht1621.data(seg,addr,sdat) end

--ht1621.cmd(seg, cmd) - 发送指令
--传入值：
--userdata ht1621.setup返回的ht1621对象
--int 指令, 0-255
--返回值：
--nil 无返回值
--例子：
---- 具体指令请查阅硬件手册
function ht1621.cmd(seg,cmd) end