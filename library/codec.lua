---@meta

--- LuatOS IDE Helper for module: codec
--- ```yaml
--- Summary: 多媒体-编解码
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/multimedia/luat_lib_multimedia_codec.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/multimedia
--- Video: 
--- Tag: LUAT_USE_MEDIA
--- ```
codec = {}

--- MP3格式 (number)
codec.MP3 = 0

--- WAV格式 (number)
codec.WAV = 0

--- AMR-NB格式，一般意义上的AMR (number)
codec.AMR = 0

--- AMR-WB格式 (number)
codec.AMR_WB = 0

--- codec 电压: 3.3V (number)
codec.VDDA_3V3 = 0

--- codec 电压: 1.8V (number)
codec.VDDA_1V8 = 0

--- G711 μ-law格式 (number)
codec.ULAW = 0

--- G711 A-law格式 (number)
codec.ALAW = 0

--- 创建编解码用的codec
---@param type number 多媒体类型，目前支持codec.MP3 codec.AMR
---@param isDecoder boolean 是否是解码器，true解码器，false编码器，默认true，是解码器
---@param quality number 编码等级，部分bsp有内部编解码器，可能需要提前输入编解码等级，不知道的就填7
---@return userdata #1 成功返回一个数据结构,否则返回nil
--- ```lua
--- 目前支持：
--- codec.MP3 解码
--- codec.AMR 编码+解码
--- codec.AMR_WB 编码(部分BSP支持，例如Air780EHM,Air8000)+解码
--- codec.WAV WAV本身就是PCM数据，无需编解码
--- codec.ULAW codec.ALAW 编码+解码
--- 创建解码器
--- local decoder = codec.create(codec.MP3)--创建一个mp3的decoder
--- 创建编码器
--- local encoder = codec.create(codec.AMR, false)--创建一个amr的encoder
--- 创建编码器
--- local encoder = codec.create(codec.AMR_WB, false, 8)--创建一个amr-wb的encoder，编码等级默认8
--- ```
function codec.create(type, isDecoder, quality) end

--- decoder从文件中解析出音频信息
---@param decoder userdata 解码用的decoder
---@param file_path string 文件路径
---@return boolean #1 是否成功解析
---@return number #2 音频格式
---@return number #3 声音通道数
---@return number #4 采样频率
---@return number #5 采样位数
---@return boolean #6 是否有符号
--- ```lua
--- local result, audio_format, num_channels, sample_rate, bits_per_sample, is_signed= codec.info(coder, "xxx")
--- ```
function codec.info(decoder, file_path) end

--- decoder从文件中解析出原始音频数据，比如从MP3文件里解析出PCM数据，这里的文件路径已经在codec.info传入，不需要再次传入
---@param decoder userdata 解码用的decoder
---@param out_buff zbuff 存放输出数据的zbuff，空间必须不少于16KB
---@param size number 最少解码出多少字节的音频数据,默认16384
---@return boolean #1 是否成功解析
--- ```lua
--- 大内存设备
--- local buff = zbuff.create(16*1024)
--- local result = codec.data(coder, buff, 8192)
--- 小内存设备
--- local buff = zbuff.create(8*1024)
--- local result = codec.data(coder, buff, 4096)
--- ```
function codec.data(decoder, out_buff, size) end

--- 编码音频数据，由于flash和ram空间一般比较有限，除了部分bsp有内部amr编码功能以外只支持amr-nb编码
---@param coder userdata codec.create创建的编解码用的coder
---@param in_buffer zbuff 输入的数据,zbuff形式,从0到used
---@param out_buffer zbuff 输出的数据,zbuff形式,自动添加到buff的尾部,如果空间大小不足,会自动扩展,但是会额外消耗时间,甚至会失败,所以尽量一开始就给足空间
---@param mode number amr_nb的编码等级 0~7(即 MR475~MR122)值越大消耗的空间越多,音质越高,默认0 amr_wb的编码等级 0~8,值越大消耗的空间越多,音质越高,默认0
---@return boolean #1 成功返回true,失败返回false
--- ```lua
--- codec.encode(amr_coder, inbuf, outbuf, codec.AMR_)
--- ```
function codec.encode(coder, in_buffer, out_buffer, mode) end

--- 释放编解码用的coder
---@param coder coder codec.create创建的编解码用的coder
--- ```lua
--- codec.release(coder)
--- ```
function codec.release(coder) end
