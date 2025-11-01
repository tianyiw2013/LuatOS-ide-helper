camera = {}

--camera.init(InitReg_or_cspi_id, cspi_speed, mode, is_msb, rx_bit, seq_type, is_ddr, only_y, scan_mode, w, h) - 初始化摄像头
--传入值：
--table/integer 如果是table,则是DVP摄像头的配置见demo/camera/AIR105,同时忽略后续参数;如果是数字,则是camera spi总线序号
--int camera spi总线速度
--int camera spi模式,0~3
--int 字节的bit顺序是否是msb,0否1是
--int 同时接收bit数,1,2,4
--int byte序列,0~1
--int 双边沿采样配置,0不启用,其他值根据实际SOC决定
--int 只接收Y分量，0不启用，1启用，扫码必须启用，否则会失败
--int 工作模式，camera.AUTO自动,camera.SCAN扫码
--int 摄像头宽度
--int 摄像头高度
--返回值：
--int/false 成功返回camera_id，失败返回false
--例子：
--camera_id = camera.init(GC032A_InitReg)--屏幕输出rgb图像
----初始化后需要start才开始输出/扫码
--camera.start(camera_id)--开始指定的camera
function camera.init(InitReg_or_cspi_id,cspi_speed,mode,is_msb,rx_bit,seq_type,is_ddr,only_y,scan_mode,w,h) end

--camera.on(id, event, func) - 注册摄像头事件回调
--传入值：
--int camera id, camera 0写0, camera 1写1
--string 事件名称
--function 回调方法
--返回值：
--nil 无返回值
--例子：
--camera.on(0, "scanned", function(id, str)
----id int camera id
----str 多种类型 false 摄像头没有正常工作，true 拍照模式下拍照成功并保存完成， int 原始数据模式下本次返回的数据大小， string 扫码模式下扫码成功后的解码值
--    print(id, str)
--end)
function camera.on(id,event,func) end

--camera.start(id) - 开始指定的camera
--传入值：
--int camera id,例如0
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--camera.start(0)
function camera.start(id) end

--camera.stop(id) - 停止指定的camera
--传入值：
--int camera id,例如0
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--camera.stop(0)
function camera.stop(id) end

--camera.close(id) - 关闭指定的camera，释放相应的IO资源
--传入值：
--int camera id,例如0
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--camera.close(0)
function camera.close(id) end

--camera.capture(id, save_path, quality) - camera拍照
--传入值：
--int camera id,例如0
--string/zbuff/nil save_path,文件保存路径，空则写在上次路径里，默认是/capture.jpg，如果是zbuff，则将图片保存在buff内不写入文件系统
--int quality, jpeg压缩质量，1最差，占用空间小，3最高，占用空间最大而且费时间，默认1
--返回值：
--boolean 成功返回true,否则返回false,真正完成后通过camera.on设置的回调函数回调接收到的长度
--例子：
--camera.capture(0)
function camera.capture(id,save_path,quality) end

--camera.video(id, w, h, out_path) - camera输出视频流到USB
--传入值：
--int camera id,例如0
--int 宽度
--int 高度
--int 输出路径，目前只能用虚拟串口0
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--camera.video(0, 320, 240, uart.VUART_0)
function camera.video(id,w,h,out_path) end

--camera.startRaw(id, w, h, buff) - 启动camera输出原始数据到用户的zbuff缓存区，输出1fps后会停止，并通过camera.on设置的回调函数回调接收到的长度，如果需要再次输出，请调用camera.getRaw
--传入值：
--int camera id,例如0
--int 宽度
--int 高度
--zbuff 用于存放数据的缓存区，大小必须不小于w X h X 2 byte
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--camera.startRaw(0, 320, 240, buff)
function camera.startRaw(id,w,h,buff) end

--camera.getRaw(id) - 再次启动camera输出原始数据到用户的zbuff缓存区，输出1fps后会停止，并通过camera.on设置的回调函数回调接收到的长度，如果需要再次输出，请继续调用本API
--传入值：
--int camera id,例如0
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--camera.getRaw(0)
function camera.getRaw(id) end

--camera.preview(id, onoff) - 启停camera预览功能，直接输出到LCD上，只有硬件支持的SOC可以运行
--传入值：
--int camera id,例如0
--boolean true开启，false停止
--返回值：
--boolean 成功返回true,否则返回false
--例子：
--camera.preview(1, true)
function camera.preview(id,onoff) end