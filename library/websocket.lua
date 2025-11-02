---@meta

--- LuatOS IDE Helper for module: websocket
--- ```yaml
--- Summary: websocket客户端
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/network/websocket/luat_lib_websocket.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/websocket
--- Video: 
--- Tag: LUAT_USE_WEBSOCKET
--- ```
--- ```lua
--- local wsc = nil
--- if websocket then
---     wsc = websocket.create(nil, "ws://echo.airtun.air32.cn/ws/echo")
---     wsc:autoreconn(true, 3000) -- 自动重连机制
---     wsc:on(function(wsc, event, data)
---         log.info("wsc", event, data)
---         if event == "conack" then
---             wsc:send((json.encode({action="echo", device_id=device_id})))
---             sys.publish("wsc_conack")
---         end
---     end)
---     wsc:connect()
--- sys.waitUntil("websocket_conack", 15000)
---     while true do
---         sys.wait(45000)
---         if wsc:ready() then
---             wsc:send((json.encode({action="echo", msg=os.date()})))
---         end
---     end
---     wsc:close()
---     wsc = nil
--- end
--- ```
websocket = {}
wsc = {}

--- 配置是否打开debug信息
---@param onoff boolean 是否打开debug开关
---@return nil #1 无返回值
function wsc:debug(onoff) end

--- websocket客户端创建
---@param adapter number 适配器序号, 参考socket库的常量,默认为nil,会选择平台自带的方式
---@param url string 连接字符串,参考usage
---@param keepalive number 心跳间隔,默认60秒. 2024.4.28新增
---@param use_ipv6 boolean 是否使用ipv6,默认false. 2024.6.17新增
---@return userdata #1 若成功会返回websocket客户端实例,否则返回nil
--- ```lua
--- 普通TCP链接
--- wsc = websocket.create(nil,"ws://air32.cn/abc")
--- 加密TCP链接
--- wsc = websocket.create(nil,"wss://air32.cn/abc")
--- ```
function websocket.create(adapter, url, keepalive, use_ipv6) end

--- 注册websocket回调
---@param cb function cb websocket回调,参数包括websocket_client, event, data, payload
---@return nil #1 无返回值
--- ```lua
--- wsc:on(function(websocket_client, event, data, payload)
--- 打印各种事件
---     log.info("websocket", "event", event, data, payload)
--- end)
--- [[
--- event的值有:
---     conack 连接服务器成功,已经收到websocket协议头部信息,通信已建立
---     recv   收到服务器下发的信息, data, payload 不为nil
---     sent   send函数发送的消息,服务器在TCP协议层已确认收到
---     disconnect 服务器连接已断开
---     error  发生错误, data为错误类型, payload为错误码
--- 其中 sent/disconnect 事件在 2023.04.01 新增
--- ]]
--- ```
function wsc:on(cb) end

--- 连接服务器
---@return boolean #1 发起成功返回true, 否则返回false
--- ```lua
--- 开始建立连接
--- wsc:connect()
--- 本函数仅代表发起成功, 后续仍需根据ready函数判断websocket是否连接正常
--- ```
function wsc:connect() end

--- 自动重连
---@param reconnect boolean 是否自动重连
---@param reconnect_time number 自动重连周期 单位ms 默认3000ms
--- ```lua
--- wsc:autoreconn(true)
--- ```
function wsc:autoreconn(reconnect, reconnect_time) end

--- 发布消息
---@param data string 待发送的数据,必填
---@param fin number 是否为最后一帧,默认1,即马上设置为最后一帧, 也就是单帧发送
---@param opt number 操作码, 默认为字符串帧0, 可选1
---@return boolean #1 成功返回true,否则为false或者nil
--- ```lua
--- 简单发送数据
--- wsc:send("123")
--- 分段发送数据, 最后要用1(即FIN帧结束)
--- wsc:send("123", 0)
--- wsc:send("456", 0)
--- wsc:send("789", 1)
--- ```
function wsc:send(data, fin, opt) end

--- websocket客户端关闭(关闭后资源释放无法再使用)
--- ```lua
--- wsc:close()
--- ```
function wsc:close() end

--- websocket客户端是否就绪
---@return boolean #1 客户端是否就绪
--- ```lua
--- local stat = wsc:ready()
--- ```
function wsc:ready() end

--- 设置额外的headers
---@param headers table|string 可以是table,也可以是字符串
---@return boolean #1 客户端是否就绪
--- ```lua
--- table形式
--- wsc:headers({
---     Auth="Basic ABCDEFGG"
--- })
--- 字符串形式
--- wsc:headers("Auth: Basic ABCDERG\r\n")
--- ```
function wsc:headers(headers) end
