local mqttc = {}

--mqttc:subscribe(topic, qos) - 订阅主题
--传入值：
--string/table 主题
--int topic为string时生效 0/1/2 默认0
--返回值：
--int 消息id,当qos为1/2时有效, 若底层返回失败,会返回nil
--例子：
---- 订阅单个topic, 且qos=0
--mqttc:subscribe("/luatos/123456", 0)
---- 订阅单个topic, 且qos=1
--mqttc:subscribe("/luatos/12345678", 1)
---- 订阅多个topic, 且使用不同的qos
--mqttc:subscribe({["/luatos/1234567"]=1,["/luatos/12345678"]=2})
function mqttc:subscribe(topic,qos) end

--mqttc:unsubscribe(topic) - 取消订阅主题
--传入值：
--string/table 主题
--例子：
--mqttc:unsubscribe("/luatos/123456")
--mqttc:unsubscribe({"/luatos/1234567","/luatos/12345678"})
function mqttc:unsubscribe(topic) end

--mqttc:debug(onoff) - 配置是否打开debug信息
--传入值：
--boolean 是否打开debug开关
--返回值：
--nil 无返回值
function mqttc:debug(onoff) end

--mqttc:auth(client_id,username,password,cleanSession) - mqtt三元组配置及cleanSession
--传入值：
--string 设备识别id,对于同一个mqtt服务器来说, 通常要求唯一,相同client_id会互相踢下线
--string 账号 可选
--string 密码 可选
--bool 清除session,默认true,可选
--返回值：
--nil 无返回值
--例子：
---- 无账号密码登录,仅clientId
--mqttc:auth("123456789")
---- 带账号密码登录
--mqttc:auth("123456789","username","password")
---- 额外配置cleanSession,不清除
--mqttc:auth("123456789","username","password", false)
---- 无clientId模式, 服务器随机生成id, cleanSession不可配置
--mqttc:auth()
function mqttc:auth(client_id,username,password,cleanSession) end

--mqttc:keepalive(time) - mqtt心跳设置
--传入值：
--int 可选 单位s 默认240s. 最先15,最高600
--返回值：
--nil 无返回值
--例子：
--mqttc:keepalive(30)
function mqttc:keepalive(time) end

--mqttc:on(cb) - 注册mqtt回调
--传入值：
--function cb mqtt回调,参数包括mqtt_client, event, data, payload
--返回值：
--nil 无返回值
--例子：
--mqttc:on(function(mqtt_client, event, data, payload, metas)
--    -- 用户自定义代码
--    log.info("mqtt", "event", event, mqtt_client, data, payload)
--end)
----[[
--event可能出现的值有
--  conack -- 服务器鉴权完成,mqtt连接已经建立, 可以订阅和发布数据了,没有附加数据
--  recv   -- 接收到数据,由服务器下发, data为topic值(string), payload为业务数据(string).metas是元数据(table), 一般不处理. 
--             -- metas包含以下内容
--             -- qos 取值范围0,1,2
--             -- retain 取值范围 0,1
--             -- dup 取值范围 0,1
--  sent   -- 发送完成, qos0会马上通知, qos1/qos2会在服务器应答会回调, data为消息id
--  disconnect -- 服务器断开连接,网络问题或服务器踢了客户端,例如clientId重复,超时未上报业务数据
--  pong   -- 收到服务器心跳应答,没有附加数据
--]]
function mqttc:on(cb) end

--mqttc:connect() - 连接服务器
--返回值：
--boolean 发起成功返回true, 否则返回false
--例子：
---- 开始建立连接
--mqttc:connect()
---- 本函数仅代表发起成功, 后续仍需根据ready函数判断mqtt是否连接正常
function mqttc:connect() end

--mqttc:disconnect() - 断开服务器连接(不会释放资源)
--返回值：
--boolean 发起成功返回true, 否则返回false
--例子：
---- 断开连接
--mqttc:disconnect()
function mqttc:disconnect() end

--mqttc:autoreconn(reconnect, reconnect_time) - 自动重连
--传入值：
--bool 是否自动重连
--int 自动重连周期 单位ms 默认3000ms
--例子：
--mqttc:autoreconn(true)
function mqttc:autoreconn(reconnect,reconnect_time) end

--mqttc:publish(topic, data, qos, retain) - 发布消息
--传入值：
--string 主题,必填
--string 消息,必填,但长度可以是0
--int 消息级别 0/1 默认0
--int 是否存档, 0/1,默认0
--返回值：
--int 消息id, 当qos为1或2时会有效值. 若底层返回是否, 会返回nil
--例子：
--mqttc:publish("/luatos/123456", "123")
function mqttc:publish(topic,data,qos,retain) end

--mqttc:close() - mqtt客户端关闭(关闭后资源释放无法再使用)
--例子：
--mqttc:close()
function mqttc:close() end

--mqttc:ready() - mqtt客户端是否就绪
--返回值：
--bool 客户端是否就绪
--例子：
--local error = mqttc:ready()
function mqttc:ready() end

--mqttc:state() - mqtt客户端状态
--返回值：
--number 客户端状态
--例子：
--local state = mqttc:state()
---- 已知状态:
---- 0: MQTT_STATE_DISCONNECT
---- 1: MQTT_STATE_CONNECTING
---- 2: MQTT_STATE_CONNECTED
---- 3: MQTT_STATE_READY
---- 4: MQTT_STATE_ERROR
function mqttc:state() end

--mqttc:will(topic, payload, qos, retain) - 设置遗嘱消息
--传入值：
--string 遗嘱消息的topic
--string 遗嘱消息的payload
--string 遗嘱消息的qos, 默认0, 可以不填
--string 遗嘱消息的retain, 默认0, 可以不填
--返回值：
--bool 成功返回true,否则返回false
--例子：
---- 要在connect之前调用
--mqttc:will("/xxx/xxx", "xxxxxx")
function mqttc:will(topic,payload,qos,retain) end