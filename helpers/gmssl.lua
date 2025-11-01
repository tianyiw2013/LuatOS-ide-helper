gmssl = {}

--gmssl.sm4encrypt(mode,padding,originStr,password) - SM4加密算法
--传入值：
--string 加密模式, CBC或ECB   
--string 填充方式, NONE/ZERO/PKCS5/PKCS7
--string 加密的字符串
--string 密钥
--string 偏移量
--返回值：
--string 加密后的数据
--例子：
--local originStr = "SM4 ECB ZeroPadding test"
----加密模式：ECB；填充方式：ZeroPadding；密钥：1234567890123456；密钥长度：128 bit
--local encodeStr = gmssl.sm4encrypt("ECB","ZERO",originStr,"1234567890123456")
--print(originStr,"encrypt",string.toHex(encodeStr))
--log.info("testsm.decrypt",gmssl.sm4decrypt("ECB","ZERO",encodeStr,"1234567890123456"))
--
--originStr = "SM4 ECB Pkcs5Padding test"
----加密模式：ECB；填充方式：Pkcs5Padding；密钥：1234567890123456；密钥长度：128 bit
--encodeStr = gmssl.sm4encrypt("ECB","PKCS5",originStr,"1234567890123456")
--print(originStr,"encrypt",string.toHex(encodeStr))
--log.info("testsm.decrypt",gmssl.sm4decrypt("ECB","PKCS5",encodeStr,"1234567890123456"))
--
--originStr = "SM4 CBC Pkcs5Padding test"
----加密模式：CBC；填充方式：Pkcs5Padding；密钥：1234567890123456；密钥长度：256 bit；偏移量：1234567890666666
--encodeStr = gmssl.sm4encrypt("CBC","PKCS5",originStr,"1234567890123456","1234567890666666")
--print(originStr,"encrypt",string.toHex(encodeStr))
--log.info("testsm.decrypt",gmssl.sm4decrypt("CBC","PKCS5",encodeStr,"1234567890123456","1234567890666666"))
function gmssl.sm4encrypt(mode,padding,originStr,password) end

--gmssl.sm4decrypt(mode,padding,encodeStr,password) - SM4解密算法
--传入值：
--string 加密模式, CBC或ECB   
--string 填充方式, NONE/ZERO/PKCS5/PKCS7
--string 已加密的字符串
--string 密钥
--string 偏移量
--返回值：
--string 解密的字符串
--例子：
---- 参考gmssl.sm4encrypt
function gmssl.sm4decrypt(mode,padding,encodeStr,password) end