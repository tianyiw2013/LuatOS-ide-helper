fastlz = {}

--fastlz.compress(data, level) - 快速压缩
--传入值：
--string 待压缩的数据, 少于400字节的数据不建议压缩, 且压缩后的数据不能大于32k
--int 压缩级别,默认1, 可选1或者2, 2的压缩比更高(有时候)
--返回值：
--string 若压缩成功,返回数据字符串, 否则返回nil
--例子：
---- 注意, 压缩过程的内存消耗如下
---- 系统内存, 固定32k
---- lua内存, 原始数据的大小的1.05倍,最小占用1024字节.
function fastlz.compress(data,level) end

--fastlz.uncompress(data, maxout) - 快速解压
--传入值：
--string 待解压的数据
--int 解压后的最大大小, 默认是4k, 可按需调整
--返回值：
--string 若解压成功,返回数据字符串, 否则返回nil
function fastlz.uncompress(data,maxout) end