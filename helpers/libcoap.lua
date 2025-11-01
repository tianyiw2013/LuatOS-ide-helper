libcoap = {}

--libcoap.new(code, uri, headers, payload) - 创建一个coap数据包
--传入值：
--int coap的code, 例如libcoap.GET/libcoap.POST/libcoap.PUT/libcoap.DELETE
--string 目标URI,必须填写, 不需要加上/开头
--table 请求头,类似于http的headers,可选
--string 请求体,类似于http的body,可选
--返回值：
--userdata coap数据包
--例子：
---- 创建一个请求服务器time的数据包
--local coapdata = libcoap.new(libcoap.GET, "time")
--local data = coapdata:rawdata()
function libcoap.new(code,uri,headers,payload) end

--libcoap.parse(str) - 解析coap数据包
--传入值：
--string coap数据包
--返回值：
--userdata coap数据包,如果解析失败会返回nil
--例子：
---- 解析服务器传入的数据包
--local coapdata = libcoap.parse(indata)
--log.info("coapdata", coapdata:hcode(), coapdata:data())
function libcoap.parse(str) end