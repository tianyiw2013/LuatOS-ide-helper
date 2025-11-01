repl = {}

--repl.enable(re) - 启用或禁用REPL功能
--传入值：
--bool 启用与否,默认是启用
--return 之前的设置状态
--例子：
---- 若固件支持REPL,即编译时启用了REPL,是默认启用REPL功能的
---- 本函数是提供关闭REPL的途径
--repl.enable(false)
function repl.enable(re) end

--repl.push(data) - 主动推送待处理的数据到底层
--传入值：
--string 待处理的数据,通常从串口来
--返回值：
--nil 无返回值
--例子：
---- 虚拟串口的设备才需要这个函数
function repl.push(data) end