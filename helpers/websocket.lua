websocket = {}

--websocket.create(adapter, url, keepalive, use_ipv6) - websocket客户端创建
--传入值：
--int 适配器序号, 参考socket库的常量,默认为nil,会选择平台自带的方式
--string 连接字符串,参考usage
--int 心跳间隔,默认60秒. 2024.4.28新增
--boolean 是否使用ipv6,默认false. 2024.6.17新增
--返回值：
--userdata 若成功会返回websocket客户端实例,否则返回nil
--例子：
---- 普通TCP链接
--wsc = websocket.create(nil,"ws://air32.cn/abc")
---- 加密TCP链接
--wsc = websocket.create(nil,"wss://air32.cn/abc")
function websocket.create(adapter,url,keepalive,use_ipv6) end