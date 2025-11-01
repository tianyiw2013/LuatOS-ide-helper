crypto = {}

--crypto.md5(str) - 计算md5值
--传入值：
--string 需要计算的字符串
--返回值：
--string 计算得出的md5值的hex字符串
--例子：
---- 计算字符串"abc"的md5
--log.info("md5", crypto.md5("abc"))
function crypto.md5(str) end

--crypto.hmac_md5(str, key) - 计算hmac_md5值
--传入值：
--string 需要计算的字符串
--string 密钥
--返回值：
--string 计算得出的hmac_md5值的hex字符串
--例子：
---- 计算字符串"abc"的hmac_md5
--log.info("hmac_md5", crypto.hmac_md5("abc", "1234567890"))
function crypto.hmac_md5(str,key) end

--crypto.sha1(str) - 计算sha1值
--传入值：
--string 需要计算的字符串
--返回值：
--string 计算得出的sha1值的hex字符串
--例子：
---- 计算字符串"abc"的sha1
--log.info("sha1", crypto.sha1("abc"))
function crypto.sha1(str) end

--crypto.hmac_sha1(str, key) - 计算hmac_sha1值
--传入值：
--string 需要计算的字符串
--string 密钥
--返回值：
--string 计算得出的hmac_sha1值的hex字符串
--例子：
---- 计算字符串"abc"的hmac_sha1
--log.info("hmac_sha1", crypto.hmac_sha1("abc", "1234567890"))
function crypto.hmac_sha1(str,key) end

--crypto.sha256(str) - 计算sha256值
--传入值：
--string 需要计算的字符串
--返回值：
--string 计算得出的sha256值的hex字符串
--例子：
---- 计算字符串"abc"的sha256
--log.info("sha256", crypto.sha256("abc"))
function crypto.sha256(str) end

--crypto.hmac_sha256(str, key) - 计算hmac_sha256值
--传入值：
--string 需要计算的字符串
--string 密钥
--返回值：
--string 计算得出的hmac_sha256值的hex字符串
--例子：
---- 计算字符串"abc"的hmac_sha256
--log.info("hmac_sha256", crypto.hmac_sha256("abc", "1234567890"))
function crypto.hmac_sha256(str,key) end

--crypto.sha512(str) - 计算sha512值
--传入值：
--string 需要计算的字符串
--返回值：
--string 计算得出的sha512值的hex字符串
--例子：
---- 计算字符串"abc"的sha512
--log.info("sha512", crypto.sha512("abc"))
function crypto.sha512(str) end

--crypto.hmac_sha512(str, key) - 计算hmac_sha512值
--传入值：
--string 需要计算的字符串
--string 密钥
--返回值：
--string 计算得出的hmac_sha512值的hex字符串
--例子：
---- 计算字符串"abc"的hmac_sha512
--log.info("hmac_sha512", crypto.hmac_sha512("abc", "1234567890"))
function crypto.hmac_sha512(str,key) end

--crypto.cipher_encrypt(type, padding, str, key, iv) - 对称加密
--传入值：
--string 算法名称, 例如 AES-128-ECB/AES-128-CBC, 可查阅crypto.cipher_list()
--string 对齐方式, 支持PKCS7/ZERO/ONE_AND_ZEROS/ZEROS_AND_LEN/NONE
--string 需要加密的数据
--string 密钥,需要对应算法的密钥长度
--string IV值, 非ECB算法需要
--返回值：
--string 加密后的字符串
--例子：
---- 计算AES
--local data = crypto.cipher_encrypt("AES-128-ECB", "PKCS7", "1234567890123456", "1234567890123456")
--local data2 = crypto.cipher_encrypt("AES-128-CBC", "PKCS7", "1234567890123456", "1234567890123456", "1234567890666666")
function crypto.cipher_encrypt(type,padding,str,key,iv) end

--crypto.cipher_decrypt(type, padding, str, key, iv) - 对称解密
--传入值：
--string 算法名称, 例如 AES-128-ECB/AES-128-CBC, 可查阅crypto.cipher_list()
--string 对齐方式, 支持PKCS7/ZERO/ONE_AND_ZEROS/ZEROS_AND_LEN/NONE
--string 需要解密的数据
--string 密钥,需要对应算法的密钥长度
--string IV值, 非ECB算法需要
--返回值：
--string 解密后的字符串
--例子：
---- 用AES加密,然后用AES解密
--local data = crypto.cipher_encrypt("AES-128-ECB", "PKCS7", "1234567890123456", "1234567890123456")
--local data2 = crypto.cipher_decrypt("AES-128-ECB", "PKCS7", data, "1234567890123456")
---- data的hex为 757CCD0CDC5C90EADBEEECF638DD0000
---- data2的值为 1234567890123456
function crypto.cipher_decrypt(type,padding,str,key,iv) end

--crypto.crc16(method, data, poly, initial, finally, inReversem outReverse) - 计算CRC16
--传入值：
--string CRC16模式（"IBM","MAXIM","USB","MODBUS","CCITT","CCITT-FALSE","X25","XMODEM","DNP","USER-DEFINED"）
--string 字符串
--int poly值
--int initial值
--int finally值
--int 输入反转,1反转,默认0不反转
--int 输入反转,1反转,默认0不反转
--返回值：
--int 对应的CRC16值
--例子：
---- 计算CRC16
--local crc = crypto.crc16("")
function crypto.crc16(method,data,poly,initial,finally,inReversemoutReverse) end

--crypto.crc16_modbus(data, start) - 直接计算modbus的crc16值
--传入值：
--string 数据
--int 初始化值,默认0xFFFF
--返回值：
--int 对应的CRC16值
--例子：
---- 计算CRC16 modbus
--local crc = crypto.crc16_modbus(data)
---- 2023.11.06 新增初始值设置
--crc = crypto.crc16_modbus(data, 0xFFFF)
function crypto.crc16_modbus(data,start) end

--crypto.crc32(data) - 计算crc32值
--传入值：
--string 数据
--返回值：
--int 对应的CRC32值
--例子：
---- 计算CRC32
--local crc = crypto.crc32(data)
function crypto.crc32(data) end

--crypto.crc8(data, poly, start, revert) - 计算crc8值
--传入值：
--string 数据
--int crc多项式，可选，如果不写，将忽略除了数据外所有参数
--int crc初始值，可选，默认0
--boolean 是否需要逆序处理，默认否
--返回值：
--int 对应的CRC8值
--例子：
---- 计算CRC8
--local crc = crypto.crc8(data)
--local crc = crypto.crc8(data, 0x31, 0xff, false)
function crypto.crc8(data,poly,start,revert) end

--crypto.crc7(data, poly, start) - 计算crc7值
--传入值：
--string 数据
--int crc多项式，可选，默认0xE5
--int crc初始值，可选，默认0x00
--返回值：
--int 对应的CRC7值
--例子：
---- 计算CRC7, 本API于2023.10.07新增
--local crc = crypto.crc7(data)
--local crc = crypto.crc7(data, 0x31, 0xff)
function crypto.crc7(data,poly,start) end

--crypto.trng(len) - 生成真随机数
--传入值：
--int 数据长度
--返回值：
--string 指定随机数字符串
--例子：
---- 生成32位随机数ir
--local r = crypto.trng(4)
--local _, ir = pack.unpack(r, "I")
function crypto.trng(len) end

--crypto.totp(secret,time) - 计算TOTP动态密码的结果
--传入值：
--string 网站提供的密钥（就是BASE32编码后的结果）
--int 可选，时间戳，默认当前时间
--返回值：
--int 计算得出的六位数结果 计算失败返回nil
--例子：
----使用当前系统时间计算
--local otp = crypto.totp("asdfassdfasdfass")
function crypto.totp(secret,time) end

--crypto.base64_encode(data) - 将数据进行base64编码
--传入值：
--string 待编码的数据
--返回值：
--string 编码后的数据
--例子：
---- 本函数与 string.toBase64 是同一个
--local data = "123"
--local bdata = crypto.base64_encode(data)
--log.info("base64", "encode", data, bdata)
--data = crypto.base64_decode(data)
--log.info("base64", "decode", data, bdata)
function crypto.base64_encode(data) end

--crypto.base64_decode(data) - 将数据进行base64解码
--传入值：
--string 待解码的数据
--返回值：
--string 解码后的数据
--例子：
---- 本函数与 string.fromBase64 是同一个
--local data = "123"
--local bdata = crypto.base64_encode(data)
--log.info("base64", "encode", data, bdata)
--data = crypto.base64_decode(data)
--log.info("base64", "decode", data, bdata)
function crypto.base64_decode(data) end

--crypto.cipher_list() - 获取当前固件支持的cipher列表
--返回值：
--table 本固件支持的cipher列表,字符串数组
--例子：
---- 本API于2022.07.27添加
--local ciphers = crypto.cipher_list()
--if ciphers then
--    log.info("crypto", "ciphers list", json.encode(ciphers))
--end
function crypto.cipher_list() end

--crypto.cipher_suites() - 获取当前固件支持的cipher suites列表
--返回值：
--table 本固件支持的cipher suites列表,字符串数组
--例子：
---- 本API于2022.11.16添加
--local suites = crypto.cipher_suites()
--if suites then
--    log.info("crypto", "ciphers suites", json.encode(suites))
--end
function crypto.cipher_suites() end

--crypto.md_file(tp, path, hmac) - 计算文件的hash值(md5/sha1/sha256及hmac形式)
--传入值：
--string hash类型, 大小字母, 例如 "MD5" "SHA1" "SHA256"
--string 文件路径, 例如 /luadb/logo.jpg
--string hmac值,可选
--返回值：
--string HEX过的hash值,若失败会无返回值
--例子：
--
---- 无hmac的hash值
--log.info("md5", crypto.md_file("MD5", "/luadb/logo.jpg"))
--log.info("sha1", crypto.md_file("SHA1", "/luadb/logo.jpg"))
--log.info("sha256", crypto.md_file("SHA256", "/luadb/logo.jpg"))
--
---- 带hmac的hash值
--log.info("hmac_md5", crypto.md_file("MD5", "/luadb/logo.jpg", "123456"))
--log.info("hmac_sha1", crypto.md_file("SHA1", "/luadb/logo.jpg", "123456"))
--log.info("hmac_sha256", crypto.md_file("SHA256", "/luadb/logo.jpg", "123456"))
function crypto.md_file(tp,path,hmac) end

--crypto.md(tp, data, hmac) - 计算数据的hash值(md5/sha1/sha256及hmac形式)
--传入值：
--string hash类型, 大小字母, 例如 "MD5" "SHA1" "SHA256"
--string 待处理的数据
--string hmac值,可选
--返回值：
--string HEX过的hash值,若失败会无返回值
--例子：
--
---- 无hmac的hash值
--log.info("md5", crypto.md("MD5", "1234567890"))
--log.info("sha1", crypto.md("SHA1", "1234567890"))
--log.info("sha256", crypto.md("SHA256", "1234567890"))
--
---- 带hmac的hash值
--log.info("hmac_md5", crypto.md("MD5", "1234567890", "123456"))
--log.info("hmac_sha1", crypto.md("SHA1", "1234567890", "123456"))
--log.info("hmac_sha256", crypto.md("SHA256", "1234567890", "123456"))
function crypto.md(tp,data,hmac) end

--crypto.hash_init(tp) - 创建流式hash用的stream
--传入值：
--string hash类型, 大写字母, 例如 "MD5" "SHA1" "SHA256"
--string hmac值，可选
--返回值：
--userdata 成功返回一个数据结构,否则返回nil
--例子：
---- 无hmac的hash stream
--local md5_stream = crypto.hash_init("MD5")
--local sha1_stream = crypto.hash_init("SHA1")
--local sha256_stream = crypto.hash_init("SHA256")
--
---- 带hmac的hash stream
--local md5_stream = crypto.hash_init("MD5", "123456")
--local sha1_stream = crypto.hash_init("SHA1", "123456")
--local sha256_stream = crypto.hash_init("SHA256", "123456")
function crypto.hash_init(tp) end

--crypto.hash_update(stream, data) - 流式hash更新数据
--传入值：
--userdata crypto.hash_init()创建的stream, 必选
--string 待计算的数据,必选
--return 无
--例子：
--crypto.hash_update(stream, "OK")
function crypto.hash_update(stream,data) end

--crypto.hash_finish(stream) - 获取流式hash校验值并释放创建的stream
--传入值：
--userdata crypto.hash_init()创建的stream,必选
--返回值：
--string 成功返回计算得出的流式hash值的hex字符串，失败无返回
--例子：
--local hashResult = crypto.hash_finish(stream)
function crypto.hash_finish(stream) end

--crypto.checksum(data, mode) - 计算checksum校验和
--传入值：
--string 待计算的数据,必选
--int 模式,累加模式, 0 - 异或, 1 - 累加, 默认为0
--返回值：
--int checksum值,校验和
--例子：
---- 本函数在 2022.12.28 添加
---- 单纯计算checksum值
--local ck = crypto.checksum("OK")
--log.info("checksum", "ok", string.format("%02X", ck))
---- 第二个参数mode在2023.5.23日添加
function crypto.checksum(data,mode) end