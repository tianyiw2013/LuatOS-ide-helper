sys = {}

--发布内部消息，存储在内部消息队列中
--返回值：
--无
--例子：
--publish("NET_STATUS_IND")
function sys.publish(...) end

--软件重启
--返回值：
--无
--例子：
--sys.restart('程序超时软件重启')
function sys.restart(r) end

--run()从底层获取core消息并及时处理相关消息，查询定时器并调度各注册成功的任务线程运行和挂起
--返回值：
--无
--例子：
--sys.run()
function sys.run() end

--设置“lua脚本运行出错时，是否回退原始烧写版本”的功能开关。如果没有调用此接口设置，默认回滚
--返回值：
--nil
--例子：
--sys.setRollBack(true)
--sys.setRollBack(false)
function sys.setRollBack(flag, secs) end

--订阅消息
--返回值：
--无
--例子：
--subscribe("NET_STATUS_IND", callback)
function sys.subscribe(id, callback) end

--创建一个任务线程,在模块最末行调用该函数并注册模块中的任务函数，main.lua导入该模块即可
--返回值：
--co  返回该任务的线程号
--例子：
--sys.taskInit(task1,'a','b')
function sys.taskInit(fun, ...) end

--判断某个定时器是否处于开启状态
--返回值：
--number 开启状态返回true，否则nil
function sys.timerIsActive(val, ...) end

--开启一个循环定时器
--返回值：
--number 定时器ID，如果失败，返回nil
function sys.timerLoopStart(fnc, ms, ...) end

--开启一个定时器
--返回值：
--number 定时器ID，如果失败，返回nil
function sys.timerStart(fnc, ms, ...) end

--关闭定时器
--返回值：
--无
--例子：
--timerStop(1)
function sys.timerStop(val, ...) end

--关闭同一回调函数的所有定时器
--返回值：
--无
--例子：
--timerStopAll(cbFnc)
function sys.timerStopAll(fnc) end

--取消订阅消息
--返回值：
--无
--例子：
--unsubscribe("NET_STATUS_IND", callback)
function sys.unsubscribe(id, callback) end

--Task任务延时函数，只能用于任务函数中
--返回值：
--定时结束返回nil,被其他线程唤起返回调用线程传入的参数
--例子：
--sys.wait(30)
function sys.wait(ms) end

--Task任务的条件等待函数（包括事件消息和定时器消息等条件），只能用于任务函数中。
--返回值：
--result 接收到消息返回true，超时返回false
--例子：
--result, data = sys.waitUntil("SIM_IND", 120000)
function sys.waitUntil(id, ms) end

--Task任务的条件等待函数扩展（包括事件消息和定时器消息等条件），只能用于任务函数中。
--返回值：
--message 接收到消息返回message，超时返回false
--例子：
--result, data = sys.waitUntilExt("SIM_IND", 120000)
function sys.waitUntilExt(id, ms) end

--sys.wait(timeout) - Task协程等待指定时长
--传入值：
--int 等待时长,单位毫秒,必须大于0,否则无效
--返回值：
--any 通常为nil,除非主动被唤醒(通常不会)
--例子：
--sys.taskInit(function()
--    while 1 do
--        sys.wait(500)
--    end
--end)
function sys.wait(timeout) end

--sys.waitUntil(topic, timeout) - Task协程等待指定时长或者特定的topic
--传入值：
--string 事件topic
--int 等待时长,单位毫秒,必须大于0,否则无效
--返回值：
--boolean 如果是超时,返回false,否则返回true
--any 对应topic的内容
--例子：
--sys.taskInit(function()
--    // do something
--    local result, data = sys.waitUntil("NET_READY", 30000)
--    // do something else
--end)
function sys.waitUntil(topic,timeout) end

--sys.taskInit(func, arg1, arg2, argN) - 创建一个Task协程
--传入值：
--function 待执行的函数,可以是匿名函数, 也可以是local或全局函数
--any 需要传递的参数1,可选 
--any 需要传递的参数2,可选 
--any 需要传递的参数N,可选 
--返回值：
--task 协程对象
--例子：
--sys.taskInit(function(a, b, c)
--    log.info("task", a, b, c) -- 打印 task A B C
--end, "A", "B", "N")
function sys.taskInit(func,arg1,arg2,argN) end

--sys.timerStart(func, timeout, arg1, arg2, argN) - 创建一个定时器.非Task,函数里不能直接sys.waitXXX
--传入值：
--function 待执行的函数,可以是匿名函数, 也可以是local或全局函数
--int 延时时长,单位毫秒
--any 需要传递的参数1,可选 
--any 需要传递的参数2,可选 
--any 需要传递的参数N,可选 
--返回值：
--int 定时器id
--例子：
--sys.timerStart(function(a, b, c)
--    log.info("task", a, b, c) -- 1000毫秒后才会执行, 打印 task A B C
--end, 1000, "A", "B", "N")
function sys.timerStart(func,timeout,arg1,arg2,argN) end

--sys.timerLoopStart(func, timeout, arg1, arg2, argN) - 创建一个循环定时器.非Task,函数里不能直接sys.waitXXX
--传入值：
--function 待执行的函数,可以是匿名函数, 也可以是local或全局函数
--int 延时时长,单位毫秒
--any 需要传递的参数1,可选 
--any 需要传递的参数2,可选 
--any 需要传递的参数N,可选 
--返回值：
--int 定时器id
--例子：
--sys.timerLoopStart(function(a, b, c)
--    log.info("task", a, b, c) -- 1000毫秒后才会执行, 打印 task A B C
--end, 1000, "A", "B", "N")
function sys.timerLoopStart(func,timeout,arg1,arg2,argN) end

--sys.timerStop(id) - 关闭一个定时器.
--传入值：
--int 定时器id
--返回值：
--nil 无返回值
--例子：
--local tcount = 0
--local tid 
--tid = sys.timerLoopStart(function(a, b, c)
--    log.info("task", a, b, c) -- 1000毫秒后才会执行, 打印 task A B C
--    if tcount > 10 then
--        sys.timerStop(tid)
--    end
--    tcount = tcount + 1
--end, 1000, "A", "B", "N")
function sys.timerStop(id) end

--sys.timerStopAll(fnc) - 关闭同一回调函数的所有定时器.
--传入值：
--function fnc回调的函数
--返回值：
--nil 无返回值
--例子：
---- 关闭回调函数为publicTimerCbFnc的所有定时器
--local function publicTimerCbFnc(tag)
--log.info("publicTimerCbFnc",tag)
--end
--sys.timerStart(publicTimerCbFnc,8000,"first")
--sys.timerStart(publicTimerCbFnc,8000,"second")
--sys.timerStart(publicTimerCbFnc,8000,"third")
--sys.timerStopAll(publicTimerCbFnc)
function sys.timerStopAll(fnc) end

--sys.publish(topic, arg1, agr2, argN) - 往特定topic通道发布一个消息
--传入值：
--string topic的值
--any 附带的参数1
--any 附带的参数2
--any 附带的参数N
--返回值：
--nil 无返回值
--例子：
--sys.publish("BT_READY", false)
function sys.publish(topic,arg1,agr2,argN) end

--sys.subscribe(topic, func) - 订阅一个topic通道
--传入值：
--string topic的值
--function 回调函数, 注意, 不能直接使用sys.waitXXX
--返回值：
--nil 无返回值
--例子：
--local function bt_cb(state)
--    log.info("bt", state)
--end
--sys.subscribe("BT_READY", bt_cb)
--sys.subscribe("BT_READY", function(state)
--    log.info("sys", "Got BT_READY", state)
--end)
function sys.subscribe(topic,func) end

--sys.unsubscribe(topic, func) - 取消订阅topic通道
--传入值：
--string topic的值
--function 回调函数, 注意, 不能直接使用sys.waitXXX
--返回值：
--nil 无返回值
--例子：
--local function bt_cb(state)
--    log.info("bt", state)
--end
--sys.unsubscribe("BT_READY", bt_cb)
function sys.unsubscribe(topic,func) end

--sys.run() - sys库主循环方法,仅允许在main.lua的末尾调用
--返回值：
--nil 无返回值. 这个方法几乎不可能返回.
--例子：
---- 总是main.lua的结尾一句,将来也许会简化掉
--sys.run()
---- 之后的代码不会被执行
function sys.run() end