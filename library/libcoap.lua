---@meta

--- LuatOS IDE Helper for module: libcoap
--- ```yaml
--- Summary: coap数据处理
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_libcoap.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/libcoap
--- Video: 
--- Tag: LUAT_USE_COAP
--- ```
libcoap = {}
coapdata = {}

--- 创建一个coap数据包
---@param code number coap的code, 例如libcoap.GET/libcoap.POST/libcoap.PUT/libcoap.DELETE
---@param uri string 目标URI,必须填写, 不需要加上/开头
---@param headers table 请求头,类似于http的headers,可选
---@param payload string 请求体,类似于http的body,可选
---@return userdata #1 coap数据包
--- ```lua
--- 创建一个请求服务器time的数据包
--- local coapdata = libcoap.new(libcoap.GET, "time")
--- local data = coapdata:rawdata()
--- ```
function libcoap.new(code, uri, headers, payload) end

--- 解析coap数据包
---@param str string coap数据包
---@return userdata #1 coap数据包,如果解析失败会返回nil
--- ```lua
--- 解析服务器传入的数据包
--- local coapdata = libcoap.parse(indata)
--- log.info("coapdata", coapdata:hcode(), coapdata:data())
--- ```
function libcoap.parse(str) end

--- 获取coap数据包的msgid
---@return number #1 coap数据包的msgid
--- ```lua
--- 解析服务器传入的数据包
--- local coapdata = libcoap.parse(indata)
--- log.info("coapdata", coapdata:msgid())
--- ```
function coapdata:msgid() end

--- 获取coap数据包的token
---@return string #1 coap数据包的token
--- ```lua
--- 解析服务器传入的数据包
--- local coapdata = libcoap.parse(indata)
--- log.info("coapdata", coapdata:token())
--- ```
function coapdata:token() end

--- 获取coap数据包的二进制数据,用于发送到服务器
---@return string #1 coap数据包的二进制数据
--- ```lua
--- 解析服务器传入的数据包
--- local coapdata = libcoap.new(libcoap.GET, "time")
--- netc:send(coapdata:rawdata())
--- ```
function coapdata:rawdata() end

--- 获取coap数据包的code
---@return number #1 coap数据包的code
--- ```lua
--- 解析服务器传入的数据包
--- local coapdata = libcoap.parse(indata)
--- log.info("coapdata", coapdata:code())
--- ```
function coapdata:code() end

--- 获取coap数据包的http code, 比coap原始的code要友好
---@return number #1 coap数据包的http code,例如200,205,404
--- ```lua
--- 解析服务器传入的数据包
--- local coapdata = libcoap.parse(indata)
--- log.info("coapdata", coapdata:hcode())
--- ```
function coapdata:hcode() end

--- 获取coap数据包的type, 例如libcoap.CON/NON/ACK/RST
---@param t number 新的type值,可选
---@return number #1 coap数据包的type
--- ```lua
--- 解析服务器传入的数据包
--- local coapdata = libcoap.parse(indata)
--- log.info("coapdata", coapdata:type())
--- ```
function coapdata:type(t) end

--- 获取coap数据包的data
---@return string #1 coap数据包的data
--- ```lua
--- 解析服务器传入的数据包
--- local coapdata = libcoap.parse(indata)
--- log.info("coapdata", coapdata:data())
--- ```
function coapdata:data() end
