---@meta

--- LuatOS IDE Helper for module: string
--- ```yaml
--- Summary: 字符串操作函数
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../lua/src/lstrlib_exts.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/string
--- Video: 
--- Tag: LUAT_USE_GPIO
--- ```
string = {}

--- 将字符串转成HEX
---@param str string 需要转换的字符串
---@param separator string 分隔符, 默认为""
---@return string #1 HEX字符串
---@return number #2 HEX字符串的长度
--- ```lua
--- string.toHex("\1\2\3") --> "010203" 6
--- string.toHex("123abc") --> "313233616263" 12
--- string.toHex("123abc", " ") --> "31 32 33 61 62 63 " 12
--- ```
function string.toHex(str, separator) end

--- 将HEX转成字符串
---@param hex string hex,16进制组成的串
---@return string #1 字符串
--- ```lua
--- string.fromHex("010203")       -->  "\1\2\3"
--- string.fromHex("313233616263") -->  "123abc"
--- ```
function string.fromHex(hex) end

--- 按照指定分隔符分割字符串
---@param str string 输入字符串
---@param delimiter string 分隔符,可选,默认 ","
---@param keepEmtry boolean 是否保留空白片段,默认为false,不保留. 2023.4.11之后的固件可用
---@return table #1 分割后的字符串表
--- ```lua
--- local tmp = string.split("123,233333,122")
--- log.info("tmp", json.encode(tmp))
--- local tmp = ("123,456,789"):split(',') --> {'123','456','789'}
--- log.info("tmp", json.encode(tmp))
--- 保留空片段, 2023.4.11之后的固件可用
--- local str = "/tmp//def/1234/"
--- local tmp = str:split("/", true) 
--- log.info("str.split", #tmp, json.encode(tmp))
--- ```
function string.split(str, delimiter, keepEmtry) end

--- 返回字符串tonumber的转义字符串(用来支持超过31位整数的转换)
---@param str string 输入字符串
---@return string #1 转换后的二进制字符串
---@return number #2 转换了多少个字符
--- ```lua
--- string.toValue("123456") --> "\1\2\3\4\5\6"  6
--- string.toValue("123abc") --> "\1\2\3\a\b\c"  6
--- ```
function string.toValue(str) end

--- 将字符串进行url编码转换
---@param data string 需要转换的字符串,必须填
---@param mode number url编码的转换标准,默认0, PHP标准, 1是RFC3986标准, -1是自定义标准
---@param space number 空格的处理方式 0:' '转化为'+' 1:' '转换为"%20". 仅mode为-1时有效
---@param str_check string str_check:不需要转换的字符,组成的字符串. 仅mode为-1时有效
---@return string #1 返回转换后的字符串
--- ```lua
--- mode可选值
---   -1 :自定义标准.为-1时,才会有后面的space和str_check
---   0 :默认标准php
---   1 :RFC3986标准,和默认的相比就是' '的转换方式不一样
--- 这个参数不存在,按0:默认标准php处理
--- 将字符串进行url编码转换
--- log.info(string.urlEncode("123 abc+/"))            -->> "123+abc%2B%2F"
--- log.info(string.urlEncode("123 abc+/",1))            -->> "123%20abc%2B%2F"
--- log.info(string.urlEncode("123 abc+/",-1,1,"/"))    -->> "123%20abc%2B/"
--- log.info(string.urlEncode("123 abc+/",-1,0,"/"))    -->> "123+abc%2B/"
--- log.info(string.urlEncode("123 abc+/",-1,0,"/ "))    -->> "123 abc%2B/"
--- ```
function string.urlEncode(data, mode, space, str_check) end

--- 将字符串进行base64编码
---@param str string 需要转换的字符串
---@return string #1 解码后的字符串,如果解码失败会返回空字符串
function string.toBase64(str) end

--- 将字符串进行base64解码
---@param str string 需要转换的字符串
---@return string #1 解码后的字符串,如果解码失败会返回空字符串
function string.fromBase64(str) end

--- 将字符串进行base32编码
---@param str string 需要转换的字符串
---@return string #1 解码后的字符串,如果解码失败会返回0长度字符串
function string.toBase32(str) end

--- 将字符串进行base32解码
---@param str string 需要转换的字符串
---@return string #1 解码后的字符串,如果解码失败会返回0长度字符串
function string.fromBase32(str) end

--- 判断字符串前缀
---@param str string 需要检查的字符串
---@param prefix string 前缀字符串
---@return boolean #1 真为true, 假为false
--- ```lua
--- local str = "abc"
--- log.info("str", str:startsWith("a"))
--- log.info("str", str:startsWith("b"))
--- ```
function string.startsWith(str, prefix) end

--- 判断字符串后缀
---@param str string 需要检查的字符串
---@param suffix string 后缀字符串
---@return boolean #1 真为true, 假为false
--- ```lua
--- local str = "abc"
--- log.info("str", str:endsWith("c"))
--- log.info("str", str:endsWith("b"))
--- ```
function string.endsWith(str, suffix) end

--- 裁剪字符串,去除头尾的空格
---@param str string 需要处理的字符串
---@param ltrim boolean 清理前缀,默认为true
---@param rtrim boolean 清理后缀,默认为true
---@return string #1 清理后的字符串
--- ```lua
--- local str = "\r\nabc\r\n"
--- log.info("str", string.trim(str)) -- 打印 "abc"
--- log.info("str", str:trim())       -- 打印 "abc"
--- log.info("str", #string.trim(str, false, true)) -- 仅裁剪后缀,所以长度是5
--- ```
function string.trim(str, ltrim, rtrim) end
