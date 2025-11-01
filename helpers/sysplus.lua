sysplus = {}

--sysplus.waitMsg(taskName, target, timeout) - 等待接收一个目标消息
--传入值：
--string 任务名称，用于唤醒任务的id
--string 目标消息，如果为nil，则表示接收到任意消息都会退出
--int 超时时间，如果为nil，则表示无超时，永远等待
--返回值：
--table 成功返回table型的msg，超时返回false
--例子：
---- 等待任务
--sysplus.waitMsg('a', 'b', 1000)
---- 注意, 本函数会自动注册成全局函数 sys_wait
function sysplus.waitMsg(taskName,target,timeout) end

--sysplus.sendMsg(taskName, target, arg2, arg3, arg4) - 向目标任务发送一个消息
--传入值：
--string 任务名称，用于唤醒任务的id
--any 消息中的参数1，同时也是waitMsg里的target
--any 消息中的参数2
--any 消息中的参数3
--any 消息中的参数4
--返回值：
--bool 成功返回true, 否则返回false
--例子：
---- 向任务a,目标b发送消息
--sysplus.sendMsg('a', 'b')
---- 注意, 本函数会自动注册成全局函数 sys_send
function sysplus.sendMsg(taskName,target,arg2,arg3,arg4) end

--sysplus.taskInitEx(fun, taskName, cbFun, ...) - 创建一个任务线程,在模块最末行调用该函数并注册模块中的任务函数,main.lua导入该模块即可
--传入值：
--function 任务函数名,用于resume唤醒时调用
--string 任务名称,用于唤醒任务的id
--function 接收到非目标消息时的回调函数
--any ... 任务函数fun的可变参数
--返回值：
--number 返回该任务的线程号
--例子：
--sysplus.taskInitEx(task1,'a',callback)
function sysplus.taskInitEx(fun,taskName,cbFun,...) end

--sysplus.taskDel(taskName) - 删除由taskInitEx创建的任务线程
--传入值：
--string 任务名称,用于唤醒任务的id
--例子：
--sysplus.taskDel('a')
function sysplus.taskDel(taskName) end

--sysplus.cleanMsg(taskName) - 清除指定task的消息队列
--传入值：
--string 任务名称
--例子：
--sysplus.cleanMsg('a')
function sysplus.cleanMsg(taskName) end