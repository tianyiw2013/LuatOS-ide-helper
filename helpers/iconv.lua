local iconv = {}

--iconv:iconv(inbuf) - 字符编码转换
--传入值：
--string 释义：待转换字符串
--返回值：
--number 释义：返回编码转换后的结果<br>取值：0成功,-1失败
--例子：
----unicode大端编码 转化为 utf8编码
--function ucs2beToUtf8(ucs2s)
--    local iconv = iconv.open("utf8", "ucs2be")
--    return iconv:iconv(ucs2s)
--end
function iconv:iconv(inbuf) end