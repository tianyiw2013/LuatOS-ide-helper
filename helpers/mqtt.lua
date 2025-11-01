mqtt = {}

--mqtt.create(adapter,host,port,ssl,isipv6) - mqtt客户端创建
--传入值：
--int 适配器序号, 只能是socket.ETH0, socket.STA, socket.AP,如果不填,会选择平台自带的方式,然后是最后一个注册的适配器
--string 服务器地址,可以是域名, 也可以是ip
--int 端口号
--bool/table 是否为ssl加密连接,默认不加密,true为无证书最简单的加密，table为有证书的加密 <br>server_cert 服务器ca证书数据 <br>client_cert 客户端证书数据 <br>client_key 客户端私钥加密数据 <br>client_password 客户端私钥口令数据 <br>verify 是否强制校验 0不校验/1可选校验/2强制校验 默认2
--bool/table bool 是否为ipv6，默认不是  table mqtt扩展参数, ipv6 是否为ipv6, rxSize 接收缓冲区大小
--返回值：
--userdata 若成功会返回mqtt客户端实例,否则返回nil
--例子：
---- 普通TCP链接
--mqttc = mqtt.create(nil,"120.55.137.106", 1884)
---- 普通TCP链接,mqtt接收缓冲区4096
--mqttc = mqtt.create(nil,"120.55.137.106", 1884, nil, {rxSize = 4096})
---- 加密TCP链接,不验证服务器证书
--mqttc = mqtt.create(nil,"120.55.137.106", 8883, true)
---- 加密TCPTCP链接,单服务器证书验证
--mqttc = mqtt.create(nil,"120.55.137.106", 8883, {server_cert=io.readFile("/luadb/ca.crt")})
---- 加密TCPTCP链接,单服务器证书验证, 但可选认证
--mqttc = mqtt.create(nil,"120.55.137.106", 8883, {server_cert=io.readFile("/luadb/ca.crt"), verify=1})
---- 加密TCPTCP链接,双向证书验证
--mqttc = mqtt.create(nil,"120.55.137.106", 8883, {
--                    server_cert=io.readFile("/luadb/ca.crt"),
--                    client_cert=io.readFile("/luadb/client.pem"),
--                    client_key="123456",
--                    client_password="123456",
--                    })
function mqtt.create(adapter,host,port,ssl,isipv6) end