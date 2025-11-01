sm = {}

--sm.sm2encrypt(pkx,pky,data, mode, mode2) - sm2算法加密
--传入值：
--string 公钥x,必选. HEX字符串
--string 公钥y,必选. HEX字符串
--string 待计算的数据,必选,最长32字节, 非HEX字符串
--boolean 输出模式,默认false. false-GMSSL默认格式DER, true-网站兼容模式
--boolean 标准版本,默认false. false-C1C3C2新国际, true-C1C2C3老国际
--返回值：
--string 加密后的字符串, 原样输出,未经HEX转换. 若加密失败会返回nil或空字符串
--例子：
---- 提示 mode/mode2 参数是 2023.10.17 新增
---- 由于SM2在各平台的实现都有差异,用法务必参考demo
function sm.sm2encrypt(pkx,pky,data,mode,mode2) end

--sm.sm2decrypt(private,data,mode,mode2) - sm2算法解密
--传入值：
--string 私钥,必选,HEX字符串
--string 待计算的数据,必选,原始数据,非HEX字符串
--boolean 输出模式,默认false. false-GMSSL默认格式DER, true-网站兼容模式
--boolean 标准版本,默认false. false-C1C3C2新国际, true-C1C2C3老国际
--返回值：
--string 解密后的字符串,未经HEX转换.若解密失败会返回nil或空字符串
--例子：
---- 提示 mode/mode2 参数是 2023.10.17 新增
---- 由于SM2在各平台的实现都有差异,用法务必参考demo
function sm.sm2decrypt(private,data,mode,mode2) end

--sm.sm3(data) - sm3算法,算HASH值
--传入值：
--string 待计算的数据,必选
--返回值：
--string 对应的hash值
--例子：
--local encodeStr = gmssl.sm3("lqlq666lqlq946")
--log.info("testsm.sm3update",string.toHex(encodeStr))
function sm.sm3(data) end

--sm.sm3hmac(data, key) - sm3算法,算HASH值,但带HMAC
--传入值：
--string 待计算的数据,必选
--string 密钥
--返回值：
--string 对应的hash值
--例子：
--local encodeStr = gmssl.sm3hmac("lqlq666lqlq946", "123")
--log.info("testsm.sm3update",string.toHex(encodeStr))
function sm.sm3hmac(data,key) end

--sm.sm2sign(private,data,id) - sm2算法签名
--传入值：
--string 私钥,必选,HEX字符串
--string 待计算的数据,必选,原始数据,非HEX字符串
--string id值,非HEX字符串,可选,默认值"1234567812345678"
--返回值：
--string 前面字符串,未经HEX转换.若签名失败会返回nil
--例子：
---- 本API于 2023.10.19 新增
---- 具体用法请查阅demo
function sm.sm2sign(private,data,id) end

--sm.sm2verify(pkx, pky, data, id, sig) - sm2算法验签
--传入值：
--string 公钥X,必选,HEX字符串
--string 公钥Y,必选,HEX字符串
--string 待计算的数据,必选,原始数据,非HEX字符串
--string id值,非HEX字符串,可选,默认值"1234567812345678"
--string 签名数据,必须64字节,非HEX字符串
--返回值：
--boolean 验证成功返回true,否则返回nil
--例子：
---- 本API于 2023.10.19 新增
---- 具体用法请查阅demo
function sm.sm2verify(pkx,pky,data,id,sig) end