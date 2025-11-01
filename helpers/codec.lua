codec = {}

--codec.create(type, isDecoder, quality) - 创建编解码用的codec
--传入值：
--int 多媒体类型，目前支持codec.MP3 codec.AMR
--boolean 是否是解码器，true解码器，false编码器，默认true，是解码器
--int 编码等级，部分bsp有内部编码器，可能需要提前输入编码等级，比如air780ep的内部amr编码器
--返回值：
--userdata 成功返回一个数据结构,否则返回nil
--例子：
---- 创建解码器
--local decoder = codec.create(codec.MP3)--创建一个mp3的decoder
---- 创建编码器
--local encoder = codec.create(codec.AMR, false)--创建一个amr的encoder
---- 创建编码器
--local encoder = codec.create(codec.AMR_WB, false, 8)--创建一个amr-wb的encoder，编码等级默认8
function codec.create(type,isDecoder,quality) end

--codec.info(decoder, file_path) - decoder从文件中解析出音频信息
--传入值：
--userdata 解码用的decoder
--string 文件路径
--返回值：
--boolean 是否成功解析
--int 音频格式
--int 声音通道数
--int 采样频率
--int 采样位数
--boolean 是否有符号
--例子：
--local result, audio_format, num_channels, sample_rate, bits_per_sample, is_signed= codec.info(coder, "xxx")
function codec.info(decoder,file_path) end

--codec.data(decoder, out_buff) - decoder从文件中解析出原始音频数据，比如从MP3文件里解析出PCM数据，这里的文件路径已经在codec.info传入，不需要再次传入
--传入值：
--userdata 解码用的decoder
--zbuff 存放输出数据的zbuff，空间必须不少于16KB
--int 最少解码出多少字节的音频数据,默认16384
--返回值：
--boolean 是否成功解析
--例子：
---- 大内存设备
--local buff = zbuff.create(16*1024)
--local result = codec.data(coder, buff)
---- 小内存设备
--local buff = zbuff.create(8*1024)
--local result = codec.data(coder, buff, 4096)
function codec.data(decoder,out_buff) end

--codec.encode(coder, in_buffer, out_buffer, mode) - 编码音频数据，由于flash和ram空间一般比较有限，除了部分bsp有内部amr编码功能，目前只支持amr-nb编码
--传入值：
--userdata codec.create创建的编解码用的coder
--zbuff 输入的数据,zbuff形式,从0到used
--zbuff 输出的数据,zbuff形式,自动添加到buff的尾部,如果空间大小不足,会自动扩展,但是会额外消耗时间,甚至会失败,所以尽量一开始就给足空间
--int amr_nb的编码等级 0~7(即 MR475~MR122)值越大消耗的空间越多,音质越高,默认0 amr_wb的编码等级 0~8,值越大消耗的空间越多,音质越高,默认0
--返回值：
--boolean 成功返回true,失败返回false
--例子：
--codec.encode(amr_coder, inbuf, outbuf, codec.AMR_)
function codec.encode(coder,in_buffer,out_buffer,mode) end

--codec.release(coder) - 释放编解码用的coder
--传入值：
--coder codec.create创建的编解码用的coder
--例子：
--codec.release(coder)
function codec.release(coder) end