---@meta

--- LuatOS IDE Helper for module: iotauth
--- ```yaml
--- Summary: IoT鉴权库, 用于生成各种云平台的参数
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/iotauth/luat_lib_iotauth.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/iotauth
--- Video: 
--- Tag: LUAT_USE_IOTAUTH
--- ```
iotauth = {}

--- 阿里云物联网平台三元组生成
---@param product_key string product_key
---@param device_name string device_name
---@param device_secret string device_secret
---@param method string method 加密方式,"hmacmd5" "hmacsha1" "hmacsha256" 可选,默认"hmacmd5"
---@param cur_timestamp number cur_timestamp 可选 默认为 32472115200(2999-01-01 0:0:0)
---@return string #1 mqtt三元组 client_id
---@return string #2 mqtt三元组 user_name
---@return string #3 mqtt三元组 password
--- ```lua
--- local client_id,user_name,password = iotauth.aliyun("123456789","abcdefg","Y877Bgo8X5owd3lcB5wWDjryNPoB")
--- print(client_id,user_name,password)
--- ```
function iotauth.aliyun(product_key, device_name, device_secret, method, cur_timestamp) end

--- 中国移动物联网平台三元组生成
---@param produt_id string produt_id 产品id
---@param device_name string device_name 设备名称
---@param key string key  设备密钥或者项目的acess_key
---@param method string method 加密方式,"md5" "sha1" "sha256" 可选,默认"md5"
---@param cur_timestamp number 时间戳, 不用填
---@param version string version 可选 默认"2018-10-31"
---@return string #1 mqtt三元组 client_id
---@return string #2 mqtt三元组 user_name
---@return string #3 mqtt三元组 password
--- ```lua
--- OneNet平台官网: https://open.iot.10086.cn/
--- OneNet有多种版本, 注意区分, 一般来说produt_id纯数字就是老版本, 否则就是新版本
--- 新版OneNET平台, 产品id是英文字母字符串
--- 对应demo/onenet/studio
--- local produt_id = "Ck2AF9QD2K"
--- local device_name = "test"
--- local device_key = "KuF3NT/jUBJ62LNBB/A8XZA9CqS3Cu79B/ABmfA1UCw="
--- local client_id,user_name,password = iotauth.onenet(produt_id, device_name, device_key)
--- log.info("onenet.new", client_id,user_name,password)
--- 旧版OneNET平台, 产品id是数字字符串. 2024.1.29新增
--- 对应demo/onenet/old_mqtt
--- local produt_id = "12342334"
--- local device_name = "test"
--- local access_key = "adfasdfadsfadsf="
--- local client_id,user_name,password = iotauth.onenet(produt_id, device_name, access_key, nil, nil, nil, "products/" .. produt_id)
--- log.info("onenet.old", client_id,user_name,password)
--- ```
function iotauth.onenet(produt_id, device_name, key, method, cur_timestamp, version) end

--- 华为物联网平台三元组生成
---@param device_id string device_id
---@param device_secret string device_secret
---@param cur_timestamp number cur_timestamp 可选 如不填则不校验时间戳
---@return string #1 mqtt三元组 client_id
---@return string #2 mqtt三元组 user_name
---@return string #3 mqtt三元组 password
--- ```lua
--- local client_id,user_name,password = iotauth.iotda("6203cc94c7fb24029b110408_88888888","123456789")
--- print(client_id,user_name,password)
--- ```
function iotauth.iotda(device_id, device_secret, cur_timestamp) end

--- 腾讯联网平台三元组生成
---@param product_id string 产品id,创建项目后可以查看到,类似于LD8S5J1L07
---@param device_name string 设备名称,例如设备的imei号
---@param device_secret string 设备密钥,创建设备后,查看设备详情可得到
---@param method string method 加密方式,"sha1" "sha256" 可选,默认"sha256"
---@param cur_timestamp number cur_timestamp 可选 默认为 32472115200(2999-01-01 0:0:0)
---@param sdk_appid string sdk_appid 可选 默认为"12010126"
---@return string #1 mqtt三元组 client_id
---@return string #2 mqtt三元组 user_name
---@return string #3 mqtt三元组 password
--- ```lua
--- local client_id,user_name,password = iotauth.qcloud("LD8S5J1L07","test","acyv3QDJrRa0fW5UE58KnQ==")
--- print(client_id,user_name,password)
--- ```
function iotauth.qcloud(product_id, device_name, device_secret, method, cur_timestamp, sdk_appid) end

--- 涂鸦联网平台三元组生成
---@param device_id string device_id
---@param device_secret string device_secret
---@param cur_timestamp number cur_timestamp 可选 默认7258089600(2200-01-01 0:0:0)
---@return string #1 mqtt三元组 client_id
---@return string #2 mqtt三元组 user_name
---@return string #3 mqtt三元组 password
--- ```lua
--- local client_id,user_name,password = iotauth.tuya("6c95875d0f5ba69607nzfl","fb803786602df760")
--- print(client_id,user_name,password)
--- ```
function iotauth.tuya(device_id, device_secret, cur_timestamp) end

--- 百度物联网平台三元组生成
---@param iot_core_id string iot_core_id
---@param device_key string device_key
---@param device_secret string device_secret
---@param method string method 加密方式,"MD5" "SHA256" 可选,默认"MD5"
---@param cur_timestamp number cur_timestamp 可选 如不填则不校验时间戳
---@return string #1 mqtt三元组 client_id
---@return string #2 mqtt三元组 user_name
---@return string #3 mqtt三元组 password
--- ```lua
--- local client_id,user_name,password = iotauth.baidu("abcd123","mydevice","ImSeCrEt0I1M2jkl")
--- print(client_id,user_name,password)
--- ```
function iotauth.baidu(iot_core_id, device_key, device_secret, method, cur_timestamp) end
