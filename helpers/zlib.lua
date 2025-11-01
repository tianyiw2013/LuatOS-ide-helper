zlib = {}

--zlib.c(input_file,output_file) - zlib压缩(需要大约270k内存，大部分mcu不支持)
--传入值：
--string input_file  输入文件
--string output_file 输出文件
--返回值：
--bool 正常返回 ture  失败返回 false
--例子：
--zlib.c("/sd/1.txt","/sd/zlib")
function zlib.c(input_file,output_file) end

--zlib.d(input_file,output_file) - zlib解压缩(需要大约18k内存，大部分mcu都支持)
--传入值：
--string input_file  输入文件
--string output_file 输出文件
--返回值：
--bool 正常返回 ture  失败返回 false
--例子：
--zlib.d("/sd/zlib","/sd/1.txt")
function zlib.d(input_file,output_file) end