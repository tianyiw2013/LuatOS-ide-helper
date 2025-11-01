miniz = {}

--miniz.compress(data, flags) - 快速压缩,需要165kb的系统内存和32kb的LuaVM内存
--传入值：
--string 待压缩的数据, 少于400字节的数据不建议压缩, 且压缩后的数据不能大于32k.
--flags 压缩参数,默认是 miniz.WRITE_ZLIB_HEADER , 即写入zlib头部
--返回值：
--string 若压缩成功,返回数据字符串, 否则返回nil
--例子：
--
--local bigdata = "123jfoiq4hlkfjbnasdilfhuqwo;hfashfp9qw38hrfaios;hfiuoaghfluaeisw"
--local cdata = miniz.compress(bigdata)
--if cdata then
--    log.info("miniz", "before", #bigdata, "after", #cdata)
--    log.info("miniz", "cdata as hex", cdata:toHex())
--end
function miniz.compress(data,flags) end

--miniz.uncompress(data, flags) - 快速解压,需要32kb的LuaVM内存
--传入值：
--string 待解压的数据, 解压后的数据不能大于32k
--flags 解压参数,默认是 miniz.PARSE_ZLIB_HEADER , 即解析zlib头部
--返回值：
--string 若解压成功,返回数据字符串, 否则返回nil
--例子：
--
--local bigdata = "123jfoiq4hlkfjbnasdilfhuqwo;hfashfp9qw38hrfaios;hfiuoaghfluaeisw"
--local cdata = miniz.compress(bigdata)
--if cdata then
--    log.info("miniz", "before", #bigdata, "after", #cdata)
--    log.info("miniz", "cdata as hex", cdata:toHex())
--
--    local udata = miniz.uncompress(cdata)
--    log.info("miniz", "udata", udata)
--end
function miniz.uncompress(data,flags) end