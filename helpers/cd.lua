local cd = {}

--cd:iconv(inbuf)  - 字符编码转换
--传入值：
--string inbuf$输入字符串$例如:ucs2s 
--return number$result$返回编码转换后的结果$0成功,-1失败
--例子：
----unicode大端编码 转化为 utf8编码
--function ucs2beToUtf8(ucs2s)
--    local cd = iconv.open("utf8", "ucs2be")
--    return cd:iconv(ucs2s)
--end
function cd:iconv(inbuf) end