---@meta

--- LuatOS IDE Helper for module: otp
--- ```yaml
--- Summary: OTP操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_otp.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_OTP
--- ```
--- ```lua
--- --------------------------
--- - 本库已经废弃, 不要使用 ---
--- --------------------------
--- ```
otp = {}

--- 读取指定OTP区域读取数据
---@param zone number 区域, 通常为0/1/2/3, 与具体硬件相关
---@param offset number 偏移量
---@param len number 读取长度, 单位字节, 必须是4的倍数, 不能超过4096字节
---@return string #1 成功返回字符串, 否则返回nil
--- ```lua
--- local otpdata = otp.read(0, 0, 64)
--- if otpdata then
---     log.info("otp", otpdata:toHex())
--- end
--- ```
function otp.read(zone, offset, len) end

--- 往指定OTP区域写入数据
---@param zone number 区域, 通常为0/1/2/3, 与具体硬件相关
---@param data string 数据, 长度必须是4个倍数
---@param offset number 偏移量
---@return boolean #1 成功返回true,否则返回false
function otp.write(zone, data, offset) end

--- 擦除指定OTP区域
---@param zone number 区域, 通常为0/1/2/3, 与具体硬件相关
---@return boolean #1 成功返回true,否则返回false
function otp.erase(zone) end

--- 锁定OTP区域. 特别注意!!一旦加锁即无法解锁,OTP变成只读!!!
---@param zone any 
---@return boolean #1 成功返回true,否则返回false
function otp.lock(zone) end
