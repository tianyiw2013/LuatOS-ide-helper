---@meta

--- LuatOS IDE Helper for module: miniz
--- ```yaml
--- Summary: 简易zlib压缩
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/miniz/luat_lib_miniz.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_MINIZ
--- ```
--- ```lua
--- 准备好数据
--- local bigdata = "123jfoiq4hlkfjbnasdilfhuqwo;hfashfp9qw38hrfaios;hfiuoaghfluaeisw"
--- 压缩之, 压缩得到的数据是zlib兼容的,其他语言可通过zlib相关的库进行解压
--- local cdata = miniz.compress(bigdata) 
--- lua 的 字符串相当于有长度的char[],可存放包括0x00的一切数据
--- if cdata then
--- 检查压缩前后的数据大小
---     log.info("miniz", "before", #bigdata, "after", #cdata)
---     log.info("miniz", "cdata as hex", cdata:toHex())
--- 解压, 得到原文
---     local udata = miniz.uncompress(cdata)
---     log.info("miniz", "udata", udata)
--- end
--- ```
miniz = {}

--- 压缩参数,是否写入zlib头部数据,compress函数的默认值 (number)
miniz.WRITE_ZLIB_HEADER = 0

--- 压缩/解压参数,是否计算/校验adler-32 (number)
miniz.COMPUTE_ADLER32 = 0

--- 压缩参数,是否快速greedy处理, 默认使用较慢的处理模式 (number)
miniz.GREEDY_PARSING_FLAG = 0

--- 压缩参数,是否快速初始化压缩器 (number)
miniz.NONDETERMINISTIC_PARSING_FLAG = 0

--- 压缩参数, 仅扫描RLE (number)
miniz.RLE_MATCHES = 0

--- 压缩参数,过滤少于5次的字符 (number)
miniz.FILTER_MATCHES = 0

--- 压缩参数,是否禁用优化过的Huffman表 (number)
miniz.FORCE_ALL_STATIC_BLOCKS = 0

--- 压缩参数,是否只要raw块 (number)
miniz.FORCE_ALL_RAW_BLOCKS = 0

--- 解压参数,是否处理zlib头部,uncompress函数的默认值 (number)
miniz.PARSE_ZLIB_HEADER = 0

--- 解压参数,是否还有更多数据,仅流式解压可用,暂不支持 (number)
miniz.HAS_MORE_INPUT = 0

--- 解压参数,解压区间是否够全部数据,,仅流式解压可用,暂不支持 (number)
miniz.USING_NON_WRAPPING_OUTPUT_BUF = 0

--- 解压参数,是否强制校验adler-32 (number)
miniz.COMPUTE_ADLER32 = 0

--- 快速压缩,需要165kb的系统内存和32kb的LuaVM内存
---@param data string 待压缩的数据, 少于400字节的数据不建议压缩, 且压缩后的数据不能大于32k.
---@param flags flags 压缩参数,默认是 miniz.WRITE_ZLIB_HEADER , 即写入zlib头部
---@return string #1 若压缩成功,返回数据字符串, 否则返回nil
--- ```lua
--- local bigdata = "123jfoiq4hlkfjbnasdilfhuqwo;hfashfp9qw38hrfaios;hfiuoaghfluaeisw"
--- local cdata = miniz.compress(bigdata)
--- if cdata then
---     log.info("miniz", "before", #bigdata, "after", #cdata)
---     log.info("miniz", "cdata as hex", cdata:toHex())
--- end
--- ```
function miniz.compress(data, flags) end

--- 快速解压,需要32kb的LuaVM内存
---@param data string 待解压的数据, 解压后的数据不能大于32k
---@param flags flags 解压参数,默认是 miniz.PARSE_ZLIB_HEADER , 即解析zlib头部
---@return string #1 若解压成功,返回数据字符串, 否则返回nil
--- ```lua
--- local bigdata = "123jfoiq4hlkfjbnasdilfhuqwo;hfashfp9qw38hrfaios;hfiuoaghfluaeisw"
--- local cdata = miniz.compress(bigdata)
--- if cdata then
---     log.info("miniz", "before", #bigdata, "after", #cdata)
---     log.info("miniz", "cdata as hex", cdata:toHex())
---     local udata = miniz.uncompress(cdata)
---     log.info("miniz", "udata", udata)
--- end
--- ```
function miniz.uncompress(data, flags) end
