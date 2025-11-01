string = {}

--接收控制字符，返回ASCII码
--返回值：
--  ASCII码
--例子：
--string.byte("ABCD")  --65
--string.byte("ABCD",4) --68
function string.byte() end

--接收ASCII码，返回对应的控制字符
--返回值：
--  字符
--例子：
--string.char(97,98,99,100)   --abcd
function string.char() end

--查找第一个字符串 s 中匹配到的 pattern
--返回值：
--  返回匹配字符具体位置。不存在则返回 nil
--例子：
--string.find("Hello Lua user", "Lua", 1)   --7   9
function string.find() end

--格式化字符串
--返回值：
--  字符串
--例子：
--string.format("the value is:%d",4)   --the value is:4
function string.format() end

--字符串替换
function string.gsub() end

--计算字符串长度
--返回值：
--  字符串长度
--例子：
--string.len("abc")  --3
function string.len() end

--字符串全部转为小写字母
--返回值：
--  小写字母字符串
function string.lower() end

--字符串拷贝
--返回值：
--  字符串
--例子：
--string.rep("abcd",2)   --abcdabcd
function string.rep() end

--字符串反转
--返回值：
--  反转后的字符串
--例子：
--string.reverse("Luat")  --tauL
function string.reverse() end

--按照指定分隔符分割字符串
--返回值：
--分割后的字符串列表
--例子：
--"123,456,789":split(',') -> {'123','456','789'}
function string.split(str, delimiter) end

--字符串全部转为大写字母
--返回值：
--  大写字母字符串
function string.upper() end

--string.toHex(str, separator) - 将字符串转成HEX
--传入值：
--string 需要转换的字符串
--string 分隔符, 默认为""
--返回值：
--string HEX字符串
--number HEX字符串的长度
--例子：
--string.toHex("\1\2\3") --> "010203" 6
--string.toHex("123abc") --> "313233616263" 12
--string.toHex("123abc", " ") --> "31 32 33 61 62 63 " 12
function string.toHex(str,separator) end

--string.fromHex(hex) - 将HEX转成字符串
--传入值：
--string hex,16进制组成的串
--返回值：
--string 字符串
--例子：
--string.fromHex("010203")       -->  "\1\2\3"
--string.fromHex("313233616263") -->  "123abc"
function string.fromHex(hex) end

--string.split(str, delimiter, keepEmtry) - 按照指定分隔符分割字符串
--传入值：
--string 输入字符串
--string 分隔符,可选,默认 ","
--bool 是否保留空白片段,默认为false,不保留. 2023.4.11之后的固件可用
--返回值：
--table 分割后的字符串表
--例子：
--local tmp = string.split("123,233333,122")
--log.info("tmp", json.encode(tmp))
--local tmp = ("123,456,789"):split(',') --> {'123','456','789'}
--log.info("tmp", json.encode(tmp))
--
---- 保留空片段, 2023.4.11之后的固件可用
--local str = "/tmp//def/1234/"
--local tmp = str:split("/", true) 
--log.info("str.split", #tmp, json.encode(tmp))
function string.split(str,delimiter,keepEmtry) end

--string.toValue(str) - 返回字符串tonumber的转义字符串(用来支持超过31位整数的转换)
--传入值：
--string 输入字符串
--返回值：
--string 转换后的二进制字符串
--number 转换了多少个字符
--例子：
--string.toValue("123456") --> "\1\2\3\4\5\6"  6
--string.toValue("123abc") --> "\1\2\3\a\b\c"  6
function string.toValue(str) end

--string.urlEncode(str) - 将字符串进行url编码转换
--传入值：
--string 需要转换的字符串
--int mode:url编码的转换标准,
function string.urlEncode(str) end

--string.toBase64(str) - 将字符串进行base64编码
--传入值：
--string 需要转换的字符串
--返回值：
--string 解码后的字符串,如果解码失败会返回空字符串
function string.toBase64(str) end

--string.fromBase64(str) - 将字符串进行base64解码
--传入值：
--string 需要转换的字符串
--返回值：
--string 解码后的字符串,如果解码失败会返回空字符串
function string.fromBase64(str) end

--string.toBase32(str) - 将字符串进行base32编码
--传入值：
--string 需要转换的字符串
--返回值：
--string 解码后的字符串,如果解码失败会返回0长度字符串
function string.toBase32(str) end

--string.fromBase32(str) - 将字符串进行base32解码
--传入值：
--string 需要转换的字符串
--返回值：
--string 解码后的字符串,如果解码失败会返回0长度字符串
function string.fromBase32(str) end

--string.startsWith(str, prefix) - 判断字符串前缀
--传入值：
--string 需要检查的字符串
--string 前缀字符串
--返回值：
--bool 真为true, 假为false
--例子：
--local str = "abc"
--log.info("str", str:startsWith("a"))
--log.info("str", str:startsWith("b"))
function string.startsWith(str,prefix) end

--string.endsWith(str, suffix) - 判断字符串后缀
--传入值：
--string 需要检查的字符串
--string 后缀字符串
--返回值：
--bool 真为true, 假为false
--例子：
--local str = "abc"
--log.info("str", str:endsWith("c"))
--log.info("str", str:endsWith("b"))
function string.endsWith(str,suffix) end

--string.trim(str, ltrim, rtrim) - 裁剪字符串,去除头尾的空格
--传入值：
--string 需要处理的字符串
--bool 清理前缀,默认为true
--bool 清理后缀,默认为true
--返回值：
--string 清理后的字符串
--例子：
--local str = "\r\nabc\r\n"
--log.info("str", string.trim(str)) -- 打印 "abc"
--log.info("str", str:trim())       -- 打印 "abc"
--log.info("str", #string.trim(str, false, true)) -- 仅裁剪后缀,所以长度是5
function string.trim(str,ltrim,rtrim) end