---@meta

--- LuatOS IDE Helper for module: sms
--- ```yaml
--- Summary: 短信
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/sms/binding/luat_lib_sms.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/sms
--- Video: 
--- Tag: LUAT_USE_SMS
--- ```
--- ```lua
--- 注意, Air780E/Air600E/Air780EG/Air780EG均不支持电信卡的短信!!
--- 意思是, 当上述模块搭配电信SIM卡, 无法从模块发出短信, 也无法在模块接收短信
--- 如果是联通卡或者移动卡, 均可收取短信, 但实名制的卡才能发送短信
--- ```
sms = {}

--- 异步发送短信
---@param phone string 电话号码,必填
---@param msg string 短信内容,必填
---@param auto_phone_fix boolean 是否自动处理电话号号码的格式,默认是按短信内容和号码格式进行自动判断, 设置为false可禁用
---@return boolean #1 成功返回true,否则返回false或nil
function sms.send(phone, msg, auto_phone_fix) end

--- 同步发送短信
---@param phone string 电话号码,必填
---@param msg string 短信内容,必填
---@param auto_phone_fix boolean 是否自动处理电话号号码的格式,默认是按短信内容和号码格式进行自动判断, 设置为false可禁用
---@return boolean #1 异步等待结果 成功返回true, 否则返回false或nil
function sms.sendLong(phone, msg, auto_phone_fix) end

--- 设置新SMS的回调函数
---@param func function 回调函数, 3个参数, num, txt, metas
---@return nil #1 传入是函数就能成功,无返回值
--- ```lua
--- sms.setNewSmsCb(function(num, txt, metas)
--- num 手机号码
--- txt 文本内容
--- metas 短信的元数据,例如发送的时间,长短信编号
--- 注意, 长短信会自动合并成一条txt
---     log.info("sms", num, txt, metas and json.encode(metas) or "")
--- end)
--- ```
function sms.setNewSmsCb(func) end

--- 设置长短信的自动合并功能
---@param mode boolean 是否自动合并,true为自动合并,为默认值
---@return boolean #1 设置后的值
--- ```lua
--- 禁用长短信的自动合并, 一般不需要禁用
--- sms.autoLong(false)
--- ```
function sms.autoLong(mode) end

--- 清除长短信缓存
---@return number #1 清理掉的片段数量
--- ```lua
--- sms.clearLong()
--- ```
function sms.clearLong() end
