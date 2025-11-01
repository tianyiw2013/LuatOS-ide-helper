local wsc = {}

--wsc:debug(onoff) - 配置是否打开debug信息
--传入值：
--boolean 是否打开debug开关
--返回值：
--nil 无返回值
function wsc:debug(onoff) end

--wsc:on(cb) - 注册websocket回调
--传入值：
--function cb websocket回调,参数包括websocket_client, event, data, payload
--返回值：
--nil 无返回值
--例子：
--wsc:on(function(websocket_client, event, data, payload)
--    -- 打印各种事件
--    log.info("websocket", "event", event, data, payload)
--end)
----[[
--event的值有:
--    conack 连接服务器成功,已经收到websocket协议头部信息,通信已建立
--    recv   收到服务器下发的信息, data, payload 不为nil
--    sent   send函数发送的消息,服务器在TCP协议层已确认收到
--    disconnect 服务器连接已断开
--
--其中 sent/disconnect 事件在 2023.04.01 新增
--]]
function wsc:on(cb) end

--wsc:connect() - 连接服务器
--返回值：
--boolean 发起成功返回true, 否则返回false
--例子：
---- 开始建立连接
--wsc:connect()
---- 本函数仅代表发起成功, 后续仍需根据ready函数判断websocket是否连接正常
function wsc:connect() end

--wsc:autoreconn(reconnect, reconnect_time) - 自动重连
--传入值：
--bool 是否自动重连
--int 自动重连周期 单位ms 默认3000ms
--例子：
--wsc:autoreconn(true)
function wsc:autoreconn(reconnect,reconnect_time) end

--wsc:send(data, fin, opt) - 发布消息
--传入值：
--string 待发送的数据,必填
--int 是否为最后一帧,默认1,即马上设置为最后一帧, 也就是单帧发送
--int 操作码, 默认为字符串帧0, 可选1
--返回值：
--bool 成功返回true,否则为false或者nil
--例子：
---- 简单发送数据
--wsc:send("123")
---- 分段发送数据, 最后要用1(即FIN帧结束)
--wsc:send("123", 0)
--wsc:send("456", 0)
--wsc:send("789", 1)
function wsc:send(data,fin,opt) end

--wsc:close() - websocket客户端关闭(关闭后资源释放无法再使用)
--例子：
--wsc:close()
function wsc:close() end

--wsc:ready() - websocket客户端是否就绪
--返回值：
--bool 客户端是否就绪
--例子：
--local stat = wsc:ready()
function wsc:ready() end

--wsc:headers(headers) - 设置额外的headers
--传入值：
--table/string 可以是table,也可以是字符串
--返回值：
--bool 客户端是否就绪
--例子：
---- table形式
--wsc:headers({
--    Auth="Basic ABCDEFGG"
--})
---- 字符串形式
--wsc:headers("Auth: Basic ABCDERG\r\n")
function wsc:headers(headers) end