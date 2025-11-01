ir = {}

--ir.sendNEC(pin, addr, cmd, repeat, disablePWM) - 发送NEC数据
--传入值：
--int 使用的GPIO引脚编号
--int 用户码（大于0xff则采用Extended NEC模式）
--int 数据码
--int 可选，引导码发送次数（110ms一次），默认0次
--bool 可选，是否禁止直接发送pwm波，默认false
--例子：
----直接发
--ir.sendNEC(0, 0x11, 0x22)
----外接了38K的PWM载波，只控制电平
--ir.sendNEC(0, 0x11, 0x22,0,true)
function ir.sendNEC(pin,addr,cmd,repeat,disablePWM) end