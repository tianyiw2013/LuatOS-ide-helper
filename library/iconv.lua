---@meta

--- LuatOS IDE Helper for module: iconv
--- ```yaml
--- Summary: iconv操作
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/iconv/luat_lib_iconv.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/iconv
--- Video: 
--- Tag: LUAT_USE_ICONV
--- ```
iconv = {}
ic = {}

--- 打开相应字符编码转换函数
---@param tocode string 释义：目标编码格式<br>取值：gb2312/ucs2/ucs2be/utf8
---@param fromcode string 释义：源编码格式<br>取值：gb2312/ucs2/ucs2be/utf8
---@return userdata #1 编码转换函数的转换句柄,若不存在会返回nil
--- ```lua
--- unicode大端编码 转化为 utf8编码
--- local ic = iconv.open("utf8", "ucs2be")
--- ```
function iconv.open(tocode, fromcode) end

--- 字符编码转换
---@param inbuf string 释义：待转换字符串
---@return number #1 释义：返回编码转换后的结果<br>取值：0成功,-1失败
--- ```lua
--- unicode大端编码 转化为 utf8编码
--- function ucs2beToUtf8(ucs2s)
---     local ic = iconv.open("utf8", "ucs2be")
---     return ic:iconv(ucs2s)
--- end
--- ```
function ic:iconv(inbuf) end

--- 关闭字符编码转换
---@param cd userdata iconv.open返回的句柄
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- 关闭字符编码转换
--- local cd = iconv.open("utf8", "ucs2be")
--- iconv.close(cd)
--- ```
function iconv.close(cd) end
