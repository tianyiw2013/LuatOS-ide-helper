local coapdata = {}

--coapdata:msgid() - 获取coap数据包的msgid
--返回值：
--int coap数据包的msgid
--例子：
---- 解析服务器传入的数据包
--local coapdata = libcoap.parse(indata)
--log.info("coapdata", coapdata:msgid())
function coapdata:msgid() end

--coapdata:token() - 获取coap数据包的token
--返回值：
--string coap数据包的token
--例子：
---- 解析服务器传入的数据包
--local coapdata = libcoap.parse(indata)
--log.info("coapdata", coapdata:token())
function coapdata:token() end

--coapdata:rawdata() - 获取coap数据包的二进制数据,用于发送到服务器
--返回值：
--string coap数据包的二进制数据
--例子：
---- 解析服务器传入的数据包
--local coapdata = libcoap.new(libcoap.GET, "time")
--netc:send(coapdata:rawdata())
function coapdata:rawdata() end

--coapdata:code() - 获取coap数据包的code
--返回值：
--int coap数据包的code
--例子：
---- 解析服务器传入的数据包
--local coapdata = libcoap.parse(indata)
--log.info("coapdata", coapdata:code())
function coapdata:code() end

--coapdata:hcode() - 获取coap数据包的http code, 比coap原始的code要友好
--返回值：
--int coap数据包的http code,例如200,205,404
--例子：
---- 解析服务器传入的数据包
--local coapdata = libcoap.parse(indata)
--log.info("coapdata", coapdata:hcode())
function coapdata:hcode() end

--coapdata:type(t) - 获取coap数据包的type, 例如libcoap.CON/NON/ACK/RST
--传入值：
--int 新的type值,可选
--返回值：
--int coap数据包的type
--例子：
---- 解析服务器传入的数据包
--local coapdata = libcoap.parse(indata)
--log.info("coapdata", coapdata:type())
function coapdata:type(t) end

--coapdata:data() - 获取coap数据包的data
--返回值：
--string coap数据包的data
--例子：
---- 解析服务器传入的数据包
--local coapdata = libcoap.parse(indata)
--log.info("coapdata", coapdata:data())
function coapdata:data() end