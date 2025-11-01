sms = {}

--sms.send(phone, msg, auto_phone_fix) - 发送短信
--传入值：
--string 电话号码,必填
--string 短信内容,必填
--bool 是否自动处理电话号号码的格式,默认是按短信内容和号码格式进行自动判断, 设置为false可禁用
--返回值：
--bool 成功返回true,否则返回false或nil
function sms.send(phone,msg,auto_phone_fix) end

--sms.setNewSmsCb(func) - 设置新SMS的回调函数
--传入值：
--function 回调函数, 3个参数, num, txt, metas
--返回值：
--nil 传入是函数就能成功,无返回值
--例子：
--
--sms.setNewSmsCb(function(num, txt, metas)
--    -- num 手机号码
--    -- txt 文本内容
--    -- metas 短信的元数据,例如发送的时间,长短信编号
--    -- 注意, 长短信会自动合并成一条txt
--    log.info("sms", num, txt, metas and json.encode(metas) or "")
--end)
function sms.setNewSmsCb(func) end

--sms.autoLong(mode) - 设置长短信的自动合并功能
--传入值：
--bool 是否自动合并,true为自动合并,为默认值
--返回值：
--bool 设置后的值
--例子：
---- 禁用长短信的自动合并, 一般不需要禁用
--sms.autoLong(false)
function sms.autoLong(mode) end

--sms.clearLong() - 清除长短信缓存
--返回值：
--int 清理掉的片段数量
--例子：
--sms.clearLong()
function sms.clearLong() end