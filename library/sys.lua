---@meta

--- LuatOS IDE Helper for module: sys
--- ```yaml
--- Summary: sys库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_sys_doc.c
--- Demo: 
--- Video: https://www.bilibili.com/video/BV1194y1o7q2
--- Tag: LUAT_USE_GPIO
--- ```
sys = {}

--- Task协程等待指定时长
---@param timeout number 等待时长,单位毫秒,必须大于0,否则无效
---@return any #1 通常为nil,除非主动被唤醒(通常不会)
--- ```lua
--- sys.taskInit(function()
---     while 1 do
---         sys.wait(500)
---     end
--- end)
--- ```
function sys.wait(timeout) end

--- Task协程等待指定时长或者特定的topic
---@param topic string 事件topic
---@param timeout number 等待时长,单位毫秒,必须大于0,否则无效
---@return boolean #1 如果是超时,返回false,否则返回true
---@return any #2 对应topic的内容
--- ```lua
--- sys.taskInit(function()
---     // do something
---     local result, data = sys.waitUntil("NET_READY", 30000)
---     // do something else
--- end)
--- ```
function sys.waitUntil(topic, timeout) end

--- 创建一个Task协程
---@param func function 待执行的函数,可以是匿名函数, 也可以是local或全局函数
---@param arg1 any 需要传递的参数1,可选
---@param arg2 any 需要传递的参数2,可选
---@param argN any 需要传递的参数N,可选
---@return task #1 协程对象
--- ```lua
--- sys.taskInit(function(a, b, c)
---     log.info("task", a, b, c) -- 打印 task A B C
--- end, "A", "B", "N")
--- ```
function sys.taskInit(func, arg1, arg2, argN) end

--- 创建一个定时器.非Task,函数里不能直接sys.waitXXX
---@param func function 待执行的函数,可以是匿名函数, 也可以是local或全局函数
---@param timeout number 延时时长,单位毫秒
---@param arg1 any 需要传递的参数1,可选
---@param arg2 any 需要传递的参数2,可选
---@param argN any 需要传递的参数N,可选
---@return number #1 定时器id
--- ```lua
--- sys.timerStart(function(a, b, c)
---     log.info("task", a, b, c) -- 1000毫秒后才会执行, 打印 task A B C
--- end, 1000, "A", "B", "N")
--- ```
function sys.timerStart(func, timeout, arg1, arg2, argN) end

--- 创建一个循环定时器.非Task,函数里不能直接sys.waitXXX
---@param func function 待执行的函数,可以是匿名函数, 也可以是local或全局函数
---@param timeout number 延时时长,单位毫秒
---@param arg1 any 需要传递的参数1,可选
---@param arg2 any 需要传递的参数2,可选
---@param argN any 需要传递的参数N,可选
---@return number #1 定时器id
--- ```lua
--- sys.timerLoopStart(function(a, b, c)
---     log.info("task", a, b, c) -- 1000毫秒后才会执行, 打印 task A B C
--- end, 1000, "A", "B", "N")
--- ```
function sys.timerLoopStart(func, timeout, arg1, arg2, argN) end

--- 关闭一个定时器.
---@param id number 定时器id
---@return nil #1 无返回值
--- ```lua
--- local tcount = 0
--- local tid 
--- tid = sys.timerLoopStart(function(a, b, c)
---     log.info("task", a, b, c) -- 1000毫秒后才会执行, 打印 task A B C
---     if tcount > 10 then
---         sys.timerStop(tid)
---     end
---     tcount = tcount + 1
--- end, 1000, "A", "B", "N")
--- ```
function sys.timerStop(id) end

--- 关闭同一回调函数的所有定时器.
---@param fnc function fnc回调的函数
---@return nil #1 无返回值
--- ```lua
--- 关闭回调函数为publicTimerCbFnc的所有定时器
--- local function publicTimerCbFnc(tag)
--- log.info("publicTimerCbFnc",tag)
--- end
--- sys.timerStart(publicTimerCbFnc,8000,"first")
--- sys.timerStart(publicTimerCbFnc,8000,"second")
--- sys.timerStart(publicTimerCbFnc,8000,"third")
--- sys.timerStopAll(publicTimerCbFnc)
--- ```
function sys.timerStopAll(fnc) end

--- 往特定topic通道发布一个消息
---@param topic string topic的值
---@param arg1 any 附带的参数1
---@param agr2 any 附带的参数2
---@param argN any 附带的参数N
---@return nil #1 无返回值
--- ```lua
--- sys.publish("BT_READY", false)
--- ```
function sys.publish(topic, arg1, agr2, argN) end

--- 订阅一个topic通道
---@param topic string topic的值
---@param func function 回调函数, 注意, 不能直接使用sys.waitXXX
---@return nil #1 无返回值
--- ```lua
--- local function bt_cb(state)
---     log.info("bt", state)
--- end
--- sys.subscribe("BT_READY", bt_cb)
--- sys.subscribe("BT_READY", function(state)
---     log.info("sys", "Got BT_READY", state)
--- end)
--- ```
function sys.subscribe(topic, func) end

--- 取消订阅topic通道
---@param topic string topic的值
---@param func function 回调函数, 注意, 不能直接使用sys.waitXXX
---@return nil #1 无返回值
--- ```lua
--- local function bt_cb(state)
---     log.info("bt", state)
--- end
--- sys.unsubscribe("BT_READY", bt_cb)
--- ```
function sys.unsubscribe(topic, func) end

--- sys库主循环方法,仅允许在main.lua的末尾调用
---@return nil #1 无返回值. 这个方法几乎不可能返回.
--- ```lua
--- 总是main.lua的结尾一句,将来也许会简化掉
--- sys.run()
--- 之后的代码不会被执行
--- ```
function sys.run() end

--- 等待接收一个目标消息
---@param taskName string 任务名称，用于唤醒任务的id
---@param target string 目标消息，如果为nil，则表示接收到任意消息都会退出
---@param timeout number 超时时间，如果为nil，则表示无超时，永远等待
---@return table #1 成功返回table型的msg，超时返回false
--- ```lua
--- 等待任务
--- sys.waitMsg('a', 'b', 1000)
--- 注意, 本函数会自动注册成全局函数 sys_wait
--- ```
function sys.waitMsg(taskName, target, timeout) end

--- 向目标任务发送一个消息
---@param taskName string 任务名称，用于唤醒任务的id
---@param target any 消息中的参数1，同时也是waitMsg里的target
---@param arg2 any 消息中的参数2
---@param arg3 any 消息中的参数3
---@param arg4 any 消息中的参数4
---@return boolean #1 成功返回true, 否则返回false
--- ```lua
--- 向任务a,目标b发送消息
--- sys.sendMsg('a', 'b')
--- 注意, 本函数会自动注册成全局函数 sys_send
--- ```
function sys.sendMsg(taskName, target, arg2, arg3, arg4) end

--- 创建一个任务线程,在模块最末行调用该函数并注册模块中的任务函数,main.lua导入该模块即可
---@param fun function 任务函数名,用于resume唤醒时调用
---@param taskName string 任务名称,用于唤醒任务的id
---@param cbFun function 接收到非目标消息时的回调函数
---@return number #1 返回该任务的线程号
--- ```lua
--- sys.taskInitEx(task1,'a',callback)
--- ```
function sys.taskInitEx(fun, taskName, cbFun) end

--- 删除由taskInitEx创建的任务线程
---@param taskName string 任务名称,用于唤醒任务的id
--- ```lua
--- sys.taskDel('a')
--- ```
function sys.taskDel(taskName) end

--- 清除指定task的消息队列
---@param taskName string 任务名称
--- ```lua
--- sys.cleanMsg('a')
--- ```
function sys.cleanMsg(taskName) end
