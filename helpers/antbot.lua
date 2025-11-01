antbot = {}

--antbot.init() - 初始化
--返回值：
--int 0:成功 其他值为失败
--例子：
--
---- 初始化蚂蚁链的底层适配
--antbot.init()
function antbot.init() end

--antbot.app_sta_get() - 获取客户端状态
--返回值：
--int 状态码
function antbot.app_sta_get() end

--antbot.version_get() - 获取SDK版本号
--返回值：
--string 版本号,如果获取失败返回nil
function antbot.version_get() end

--antbot.asset_register(asset_id, asset_type, asset_dataver) - asset资源注册
--传入值：
--string asset_id 资源ID
--string asset_type 资源类型
--string asset_dataver 资源数据版本
--返回值：
--int 0:成功 其他值为失败
function antbot.asset_register(asset_id,asset_type,asset_dataver) end

--antbot.asset_data_publish(data) - asset资源发布
--传入值：
--string data 资源数据
--返回值：
--int 0:成功 其他值为失败
function antbot.asset_data_publish(data) end

--antbot.device_status_get() - 获取设备状态
--返回值：
--int 设备状态
function antbot.device_status_get() end

--antbot.asset_status_get(asset_id) - 获取assset状态
--传入值：
--string asset_id 资源ID
--返回值：
--int 资源状态
function antbot.asset_status_get(asset_id) end

--antbot.channel_switch(cmd) - 切换channel
--传入值：
--int 0 - 关闭, 1 - 开启
--返回值：
--int 0:成功 其他值为失败
function antbot.channel_switch(cmd) end

--antbot.config_set(config) - 配置设备
--传入值：
--string config 配置内容
--返回值：
--int 0:成功 其他值为失败
function antbot.config_set(config) end

--antbot.config_get() - 获取设备配置
--返回值：
--string 配置内容
function antbot.config_get() end