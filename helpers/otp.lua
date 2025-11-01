otp = {}

--otp.read(zone, offset, len) - 读取指定OTP区域读取数据
--传入值：
--int 区域, 通常为0/1/2/3, 与具体硬件相关
--int 偏移量
--int 读取长度, 单位字节, 必须是4的倍数, 不能超过4096字节
--返回值：
--string 成功返回字符串, 否则返回nil
--例子：
--
--local otpdata = otp.read(0, 0, 64)
--if otpdata then
--    log.info("otp", otpdata:toHex())
--end
function otp.read(zone,offset,len) end

--otp.write(zone, data, offset) - 往指定OTP区域写入数据
--传入值：
--int 区域, 通常为0/1/2/3, 与具体硬件相关
--string 数据, 长度必须是4个倍数
--int 偏移量
--返回值：
--booL 成功返回true,否则返回false
function otp.write(zone,data,offset) end

--otp.erase(zone) - 擦除指定OTP区域
--传入值：
--int 区域, 通常为0/1/2/3, 与具体硬件相关
--返回值：
--bool 成功返回true,否则返回false
function otp.erase(zone) end

--otp.lock(zone) - 锁定OTP区域. 特别注意!!一旦加锁即无法解锁,OTP变成只读!!!
--返回值：
--bool 成功返回true,否则返回false
function otp.lock(zone) end