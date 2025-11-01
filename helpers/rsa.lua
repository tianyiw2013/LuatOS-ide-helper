rsa = {}

--rsa.encrypt(key, data) - RSA加密
--传入值：
--string 公钥数据,仅支持PEM格式
--string 待加密数据, 不能超过公钥位数的一半, 例如 2048bit的公钥, 只能加密128字节的数据
--返回值：
--string 加密成功后的数据,若失败会返回nil
--例子：
---- 下面代码中的 "abc" 是待加密数据
--local res = rsa.encrypt((io.readFile("/luadb/public.pem")), "abc")
---- 打印结果
--log.info("rsa", "encrypt", res and #res or 0, res and res:toHex() or "")
function rsa.encrypt(key,data) end

--rsa.decrypt(key, data, pwd) - RSA解密
--传入值：
--string 私钥数据,仅支持PEM格式
--string 待解密数据
--string 私钥的密码,可选
--返回值：
--string 解密成功后的数据,若失败会返回nil
--例子：
---- 注意, 解密通常很慢, 建议在服务器端进行
---- res 是待解密的数据
--local dst = rsa.decrypt((io.readFile("/luadb/privkey.pem")), res, "")
--log.info("rsa", "decrypt", dst and #dst or 0, dst and dst:toHex() or "")
function rsa.decrypt(key,data,pwd) end

--rsa.verify(key, md, hash, sig) - RSA验签
--传入值：
--string 公钥数据,仅支持PEM格式
--int 签名模式, 例如 rsa.MD_SHA1 , rsa.MD_SHA256
--string hash数据, 如果是HEX字符串,记得fromHex转二进制数据
--string sig数据, 如果是HEX字符串,记得fromHex转二进制数据
--返回值：
--bool 有效返回true,否则为false,出错返回nil
--例子：
--local ret = rsa.verify((io.readFile("/luadb/public.pem")), rsa.MD_SHA1, hash, sig)
--log.info("rsa", "verify", ret)
function rsa.verify(key,md,hash,sig) end

--rsa.sign(key, md, hash, pwd) - RSA签名
--传入值：
--string 私钥数据,仅支持PEM格式
--int 签名模式, 例如 rsa.MD_SHA1 , rsa.MD_SHA256
--string hash数据, 如果是HEX字符串,记得fromHex转二进制数据
--string 私钥密码, 可选
--返回值：
--string 成功返回sig数据, 否则返回nil
--例子：
--local sig = rsa.sign((io.readFile("/luadb/privkey.pem")), rsa.MD_SHA1, hash, "")
--log.info("rsa", "sign", sig and #sig or 0, sig and sig:toHex() or "")
function rsa.sign(key,md,hash,pwd) end