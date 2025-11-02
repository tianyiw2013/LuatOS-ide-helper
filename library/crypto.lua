---@meta

--- LuatOS IDE Helper for module: crypto
--- ```yaml
--- Summary: 加解密和hash函数
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_crypto.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/crypto
--- Video: 
--- Tag: LUAT_USE_CRYPTO
--- ```
crypto = {}

--- 计算md5值
---@param str string 需要计算的字符串
---@return string #1 计算得出的md5值的hex字符串
--- ```lua
--- 计算字符串"abc"的md5
--- log.info("md5", crypto.md5("abc"))
--- ```
function crypto.md5(str) end

--- 计算hmac_md5值
---@param str string 需要计算的字符串
---@param key string 密钥
---@return string #1 计算得出的hmac_md5值的hex字符串
--- ```lua
--- 计算字符串"abc"的hmac_md5
--- log.info("hmac_md5", crypto.hmac_md5("abc", "1234567890"))
--- ```
function crypto.hmac_md5(str, key) end

--- 计算sha1值
---@param str string 需要计算的字符串
---@return string #1 计算得出的sha1值的hex字符串
--- ```lua
--- 计算字符串"abc"的sha1
--- log.info("sha1", crypto.sha1("abc"))
--- ```
function crypto.sha1(str) end

--- 计算hmac_sha1值
---@param str string 需要计算的字符串
---@param key string 密钥
---@return string #1 计算得出的hmac_sha1值的hex字符串
--- ```lua
--- 计算字符串"abc"的hmac_sha1
--- log.info("hmac_sha1", crypto.hmac_sha1("abc", "1234567890"))
--- ```
function crypto.hmac_sha1(str, key) end

--- 计算sha256值
---@param str string 需要计算的字符串
---@return string #1 计算得出的sha256值的hex字符串
--- ```lua
--- 计算字符串"abc"的sha256
--- log.info("sha256", crypto.sha256("abc"))
--- ```
function crypto.sha256(str) end

--- 计算hmac_sha256值
---@param str string 需要计算的字符串
---@param key string 密钥
---@return string #1 计算得出的hmac_sha256值的hex字符串
--- ```lua
--- 计算字符串"abc"的hmac_sha256
--- log.info("hmac_sha256", crypto.hmac_sha256("abc", "1234567890"))
--- ```
function crypto.hmac_sha256(str, key) end

--- 计算sha512值
---@param str string 需要计算的字符串
---@return string #1 计算得出的sha512值的hex字符串
--- ```lua
--- 计算字符串"abc"的sha512
--- log.info("sha512", crypto.sha512("abc"))
--- ```
function crypto.sha512(str) end

--- 计算hmac_sha512值
---@param str string 需要计算的字符串
---@param key string 密钥
---@return string #1 计算得出的hmac_sha512值的hex字符串
--- ```lua
--- 计算字符串"abc"的hmac_sha512
--- log.info("hmac_sha512", crypto.hmac_sha512("abc", "1234567890"))
--- ```
function crypto.hmac_sha512(str, key) end

--- 对称加密
---@param type string 算法名称, 例如 AES-128-ECB/AES-128-CBC, 可查阅crypto.cipher_list()
---@param padding string 对齐方式, 支持PKCS7/ZERO/ONE_AND_ZEROS/ZEROS_AND_LEN/NONE
---@param str string 需要加密的数据
---@param key string 密钥,需要对应算法的密钥长度
---@param iv string IV值, 非ECB算法需要
---@return string #1 加密后的字符串
--- ```lua
--- 计算AES
--- local data = crypto.cipher_encrypt("AES-128-ECB", "PKCS7", "1234567890123456", "1234567890123456")
--- local data2 = crypto.cipher_encrypt("AES-128-CBC", "PKCS7", "1234567890123456", "1234567890123456", "1234567890666666")
--- ```
function crypto.cipher_encrypt(type, padding, str, key, iv) end

--- 对称解密
---@param type string 算法名称, 例如 AES-128-ECB/AES-128-CBC, 可查阅crypto.cipher_list()
---@param padding string 对齐方式, 支持PKCS7/ZERO/ONE_AND_ZEROS/ZEROS_AND_LEN/NONE
---@param str string 需要解密的数据
---@param key string 密钥,需要对应算法的密钥长度
---@param iv string IV值, 非ECB算法需要
---@return string #1 解密后的字符串
--- ```lua
--- 用AES加密,然后用AES解密
--- local data = crypto.cipher_encrypt("AES-128-ECB", "PKCS7", "1234567890123456", "1234567890123456")
--- local data2 = crypto.cipher_decrypt("AES-128-ECB", "PKCS7", data, "1234567890123456")
--- data的hex为 757CCD0CDC5C90EADBEEECF638DD0000
--- data2的值为 1234567890123456
--- ```
function crypto.cipher_decrypt(type, padding, str, key, iv) end

--- 计算CRC16
---@param method string CRC16模式（"IBM","MAXIM","USB","MODBUS","CCITT","CCITT-FALSE","X25","XMODEM","DNP","USER-DEFINED"）
---@param data string 字符串或者zbuff对象
---@param poly number poly值,默认0x0000,范围0-0xFFFF
---@param initial number initial值,默认0x0000,范围0-0xFFFF
---@param finally number finally值,默认0x0000,范围0-0xFFFF
---@param inReversem outReverse number 输入反转,1反转,默认0不反转
---@return number #1 对应的CRC16值
--- ```lua
--- 计算字符串的CRC16
--- local crc = crypto.crc16("dfadfasfdsafdasf")
--- 使用zbuff时,会计算used之后的全部数据,建议使用前seek(0)
--- local zbuff = zbuff.create("dfadfasfdsafdasf")
--- zbuff:seek(0)
--- crc = crypto.crc16(zbuff)
--- ```
function crypto.crc16(method, data, poly, initial, finally, inReversem outReverse) end

--- 直接计算modbus的crc16值
---@param data string 数据
---@param start number 初始化值,默认0xFFFF
---@return number #1 对应的CRC16值
--- ```lua
--- 计算CRC16 modbus
--- local crc = crypto.crc16_modbus(data)
--- 2023.11.06 新增初始值设置
--- crc = crypto.crc16_modbus(data, 0xFFFF)
--- ```
function crypto.crc16_modbus(data, start) end

--- 计算crc32值
---@param data string 数据
---@param start number 初始化值,默认0xFFFFFFFF
---@param poly number crc多项式，可选，默认0x04C11DB7
---@param endv number 结束值,可选，默认0xFFFFFFFF，计算结果异或结束值才是最终输出值
---@return number #1 对应的CRC32值
--- ```lua
--- 计算CRC32
--- local crc = crypto.crc32(data)
--- start和poly可选, 是 2025.4.14 新增的参数
--- local crc = crypto.crc32(data, 0xFFFFFFFF, 0x04C11DB7, 0xFFFFFFFF) --等同于crypto.crc32(data)
--- ```
function crypto.crc32(data, start, poly, endv) end

--- 计算crc8值
---@param data string 数据
---@param poly number crc多项式，可选，如果不写，将忽略除了数据外所有参数
---@param start number crc初始值，可选，默认0
---@param revert boolean 是否需要逆序处理，默认否
---@return number #1 对应的CRC8值
--- ```lua
--- 计算CRC8
--- local crc = crypto.crc8(data)
--- local crc = crypto.crc8(data, 0x31, 0xff, false)
--- ```
function crypto.crc8(data, poly, start, revert) end

--- 计算crc7值
---@param data string 数据
---@param poly number crc多项式，可选，默认0xE5
---@param start number crc初始值，可选，默认0x00
---@return number #1 对应的CRC7值
--- ```lua
--- 计算CRC7, 本API于2023.10.07新增
--- local crc = crypto.crc7(data)
--- local crc = crypto.crc7(data, 0x31, 0xff)
--- ```
function crypto.crc7(data, poly, start) end

--- 生成真随机数
---@param len number 数据长度
---@return string #1 指定随机数字符串
--- ```lua
--- 生成32位随机数ir
--- local r = crypto.trng(4)
--- local _, ir = pack.unpack(r, "I")
--- ```
function crypto.trng(len) end

--- 计算TOTP动态密码的结果
---@param secret string 网站提供的密钥（就是BASE32编码后的结果）
---@param time number 可选，时间戳，默认当前时间
---@return number #1 计算得出的六位数结果 计算失败返回nil
--- ```lua
--- 使用当前系统时间计算
--- local otp = crypto.totp("asdfassdfasdfass")
--- ```
function crypto.totp(secret, time) end

--- 将数据进行base64编码
---@param data string 待编码的数据
---@return string #1 编码后的数据
--- ```lua
--- 本函数与 string.toBase64 是同一个
--- local data = "123"
--- local bdata = crypto.base64_encode(data)
--- log.info("base64", "encode", data, bdata)
--- data = crypto.base64_decode(data)
--- log.info("base64", "decode", data, bdata)
--- ```
function crypto.base64_encode(data) end

--- 将数据进行base64解码
---@param data string 待解码的数据
---@return string #1 解码后的数据
--- ```lua
--- 本函数与 string.fromBase64 是同一个
--- local data = "123"
--- local bdata = crypto.base64_encode(data)
--- log.info("base64", "encode", data, bdata)
--- data = crypto.base64_decode(data)
--- log.info("base64", "decode", data, bdata)
--- ```
function crypto.base64_decode(data) end

--- 获取当前固件支持的cipher列表
---@return table #1 本固件支持的cipher列表,字符串数组
--- ```lua
--- 本API于2022.07.27添加
--- local ciphers = crypto.cipher_list()
--- if ciphers then
---     log.info("crypto", "ciphers list", json.encode(ciphers))
--- end
--- ```
function crypto.cipher_list() end

--- 获取当前固件支持的cipher suites列表
---@return table #1 本固件支持的cipher suites列表,字符串数组
--- ```lua
--- 本API于2022.11.16添加
--- local suites = crypto.cipher_suites()
--- if suites then
---     log.info("crypto", "ciphers suites", json.encode(suites))
--- end
--- ```
function crypto.cipher_suites() end

--- 计算文件的hash值(md5/sha1/sha256及hmac形式)
---@param tp string hash类型, 大小字母, 例如 "MD5" "SHA1" "SHA256"
---@param path string 文件路径, 例如 /luadb/logo.jpg
---@param hmac string hmac值,可选
---@return string #1 HEX过的hash值,若失败会无返回值
--- ```lua
--- 无hmac的hash值
--- log.info("md5", crypto.md_file("MD5", "/luadb/logo.jpg"))
--- log.info("sha1", crypto.md_file("SHA1", "/luadb/logo.jpg"))
--- log.info("sha256", crypto.md_file("SHA256", "/luadb/logo.jpg"))
--- 带hmac的hash值
--- log.info("hmac_md5", crypto.md_file("MD5", "/luadb/logo.jpg", "123456"))
--- log.info("hmac_sha1", crypto.md_file("SHA1", "/luadb/logo.jpg", "123456"))
--- log.info("hmac_sha256", crypto.md_file("SHA256", "/luadb/logo.jpg", "123456"))
--- ```
function crypto.md_file(tp, path, hmac) end

--- 计算数据的hash值(md5/sha1/sha256及hmac形式)
---@param tp string hash类型, 大小字母, 例如 "MD5" "SHA1" "SHA256"
---@param data string 待处理的数据
---@param hmac string hmac值,可选
---@return string #1 HEX过的hash值,若失败会无返回值
--- ```lua
--- 无hmac的hash值
--- log.info("md5", crypto.md("MD5", "1234567890"))
--- log.info("sha1", crypto.md("SHA1", "1234567890"))
--- log.info("sha256", crypto.md("SHA256", "1234567890"))
--- 带hmac的hash值
--- log.info("hmac_md5", crypto.md("MD5", "1234567890", "123456"))
--- log.info("hmac_sha1", crypto.md("SHA1", "1234567890", "123456"))
--- log.info("hmac_sha256", crypto.md("SHA256", "1234567890", "123456"))
--- ```
function crypto.md(tp, data, hmac) end

--- 创建流式hash用的stream
---@param tp string hash类型, 大写字母, 例如 "MD5" "SHA1" "SHA256"
---@return userdata #1 成功返回一个数据结构,否则返回nil
--- ```lua
--- 无hmac的hash stream
--- local md5_stream = crypto.hash_init("MD5")
--- local sha1_stream = crypto.hash_init("SHA1")
--- local sha256_stream = crypto.hash_init("SHA256")
--- 带hmac的hash stream
--- local md5_stream = crypto.hash_init("MD5", "123456")
--- local sha1_stream = crypto.hash_init("SHA1", "123456")
--- local sha256_stream = crypto.hash_init("SHA256", "123456")
--- ```
function crypto.hash_init(tp) end

--- 流式hash更新数据
---@param stream userdata crypto.hash_init()创建的stream, 必选
---@param data string 待计算的数据,必选
---@return nil #1 无返回值
--- ```lua
--- crypto.hash_update(stream, "OK")
--- ```
function crypto.hash_update(stream, data) end

--- 获取流式hash校验值并释放创建的stream
---@param stream userdata crypto.hash_init()创建的stream,必选
---@return string #1 成功返回计算得出的流式hash值的hex字符串，失败无返回
--- ```lua
--- local hashResult = crypto.hash_finish(stream)
--- ```
function crypto.hash_finish(stream) end

--- 计算checksum校验和
---@param data string 待计算的数据,必选
---@param mode number 模式,累加模式, 0 - 异或, 1 - 累加, 默认为0
---@return number #1 checksum值,校验和
--- ```lua
--- 本函数在 2022.12.28 添加
--- 单纯计算checksum值
--- local ck = crypto.checksum("OK")
--- log.info("checksum", "ok", string.format("%02X", ck))
--- 第二个参数mode在2023.5.23日添加
--- ```
function crypto.checksum(data, mode) end
