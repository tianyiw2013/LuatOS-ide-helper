---@meta

--- LuatOS IDE Helper for module: httpsrv
--- ```yaml
--- Summary: http服务端
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/network/httpsrv/src/luat_lib_httpsrv.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/wlan
--- Video: 
--- Tag: LUAT_USE_HTTPSRV
--- ```
httpsrv = {}

--- 启动并监听一个http端口
---@param port number 端口号
---@param func function 回调函数
---@param adapter number 网络适配器编号, 默认是平台自带的网络协议栈
---@return boolean #1 成功返回true, 否则返回false
--- ```lua
--- 监听80端口
--- httpsrv.start(80, function(client, method, uri, headers, body)
--- method 是字符串, 例如 GET POST PUT DELETE
--- uri 也是字符串 例如 / /api/abc
--- headers table类型
--- body 字符串
---     log.info("httpsrv", method, uri, json.encode(headers), body)
---     if uri == "/led/1" then
---         LEDA(1)
---         return 200, {}, "ok"
---     elseif uri == "/led/0" then
---         LEDA(0)
---         return 200, {}, "ok"
---     end
--- 返回值的约定 code, headers, body
--- 若没有返回值, 则默认 404, {} ,""
---     return 404, {}, "Not Found" .. uri
--- end)
--- 关于静态文件
--- 情况1: / , 映射为 /index.html
--- 情况2: /abc.html , 先查找 /abc.html, 不存在的话查找 /abc.html.gz
--- 若gz存在, 会自动以压缩文件进行响应, 绝大部分浏览器支持.
--- 当前默认查找 /luadb/xxx 下的文件,暂不可配置
--- ```
function httpsrv.start(port, func, adapter) end

--- 停止http服务
---@param port，no_used number 端口号
---@param adapter nil 固定写nil
---@return boolean #1 成功返回true, 否则返回false
--- ```lua
--- httpsrv.stop(SERVER_PORT,nil,socket.LWIP_AP)
--- ```
function httpsrv.stop(port，no_used, adapter) end
