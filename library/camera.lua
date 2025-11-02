---@meta

--- LuatOS IDE Helper for module: camera
--- ```yaml
--- Summary: 摄像头
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/camera/luat_lib_camera.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/camera
--- Video: 
--- Tag: LUAT_USE_CAMERA
--- ```
camera = {}

--- 摄像头工作在自动模式 (number)
camera.AUTO = 0

--- 摄像头工作在扫码模式，只输出Y分量 (number)
camera.SCAN = 0

--- 摄像头类型，USB (number)
camera.USB = 0

--- 摄像头类型，DVP (number)
camera.DVP = 0

--- 摄像头预览，画面不旋转 (number)
camera.ROTATE_0 = 0

--- 摄像头预览，画面旋转90度 (number)
camera.ROTATE_90 = 0

--- 摄像头预览，画面旋转270度 (number)
camera.ROTATE_270 = 0

--- H264编码器初始化QP值 (number)
camera.CONF_H264_QP_INIT = 0

--- H264编码器I的最大QP值 (number)
camera.CONF_H264_QP_I_MAX = 0

--- H264编码器P的最大QP值 (number)
camera.CONF_H264_QP_P_MAX = 0

--- H264编码器IMB_BITS值 (number)
camera.CONF_H264_IMB_BITS = 0

--- H264编码器PMB_BITS值 (number)
camera.CONF_H264_PMB_BITS = 0

--- 是否启动摄像头预览功能，默认开启 (number)
camera.CONF_PREVIEW_ENABLE = 0

--- 摄像头预览画面的旋转角度 (number)
camera.CONF_PREVIEW_ROTATE = 0

--- 初始化摄像头
---@param InitReg_or_cspi_id table|integer 如果是table,则是DVP摄像头的配置见demo/camera/dvp_camera,同时忽略后续参数;如果是数字,则是camera spi总线序号
---@param cspi_speed number camera spi总线速度
---@param mode number camera spi模式,0~3
---@param is_msb number 字节的bit顺序是否是msb,0否1是
---@param rx_bit number 同时接收bit数,1,2,4
---@param seq_type number byte序列,0~1
---@param is_ddr number 双边沿采样配置,0不启用,其他值根据实际SOC决定
---@param only_y number 只接收Y分量，0不启用，1启用，扫码必须启用，否则会失败
---@param scan_mode number 工作模式，camera.AUTO自动,camera.SCAN扫码
---@param w number 摄像头宽度
---@param h number 摄像头高度
---@return number|false #1 成功返回camera_id，失败返回false
--- ```lua
--- camera_id = camera.init(GC032A_InitReg)--屏幕输出rgb图像
--- 初始化后需要start才开始输出/扫码
--- camera.start(camera_id)--开始指定的camera
--- ```
function camera.init(InitReg_or_cspi_id, cspi_speed, mode, is_msb, rx_bit, seq_type, is_ddr, only_y, scan_mode, w, h) end

--- 注册摄像头事件回调
---@param id number camera id, camera 0写0, camera 1写1
---@param event string 事件名称
---@param func function 回调方法
---@return nil #1 无返回值
--- ```lua
--- camera.on(0, "scanned", function(id, event)
--- id int camera id
--- event 多种类型，详见下表
---     print(id, event)
--- end)
--- [[
--- event可能出现的值有
---   boolean型 false   摄像头没有正常工作，检查硬件和软件配置
---   boolean型 true    拍照模式下拍照成功并保存完成，可以读取照片文件数据进一步处理，比如读出数据上传
---   int型 原始图像大小 RAW模式下，采集完一帧图像后回调，回调值为图像数据大小，可以对传入的zbuff做进一步处理，比如读出数据上传
---   string型  扫码结果 扫码模式下扫码成功一次，并且回调解码值，可以对回调值做进一步处理，比如打印到LCD上
--- ]]
--- ```
function camera.on(id, event, func) end

--- 开始指定的camera
---@param id number camera id,例如0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- camera.start(0)
--- ```
function camera.start(id) end

--- 停止指定的camera
---@param id number camera id,例如0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- camera.stop(0)
--- ```
function camera.stop(id) end

--- 关闭指定的camera，释放相应的IO资源
---@param id number camera id,例如0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- camera.close(0)
--- ```
function camera.close(id) end

--- camera拍照
---@param id number camera id,例如0
---@param save_path string|zbuff|nil save_path,文件保存路径，空则写在上次路径里，默认是/capture.jpg，如果是zbuff，则将图片保存在buff内不写入文件系统
---@param quality number quality, jpeg压缩质量, 见下面的使用说明
---@param x number x, 裁剪起始横坐标，从x列开始
---@param y number y, 裁剪起始纵坐标，从y行开始
---@param w number w, 裁剪后的宽度
---@param h number h, 裁剪后的高度
---@return boolean #1 成功返回true,否则返回false,真正完成后通过camera.on设置的回调函数回调接收到的长度
--- ```lua
--- 保存到文件,质量为80
--- camera.capture(0, "/capture.jpg", 80)
--- 保存到内存文件系统
--- camera.capture(0, "/ram/123.jpg", 80)
--- 保存到zbuff,质量为80
--- camera.capture(0, buff, 80)
--- jpeg压缩质量,请使用 50 - 95 之间的数值
--- 为保持兼容性, 质量值1/2/3, 分别对应 90/95/99
--- ```
function camera.capture(id, save_path, quality, x, y, w, h) end

--- camera输出视频流到USB
---@param id number camera id,例如0
---@param w number 宽度
---@param h number 高度
---@param out_path number 输出路径，目前只能用虚拟串口0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- camera.video(0, 320, 240, uart.VUART_0)
--- ```
function camera.video(id, w, h, out_path) end

--- 启动camera输出原始数据到用户的zbuff缓存区，输出1fps后会停止，并通过camera.on设置的回调函数回调接收到的长度，如果需要再次输出，请调用camera.getRaw
---@param id number camera id,例如0
---@param w number 宽度
---@param h number 高度
---@param buff zbuff 用于存放数据的缓存区，大小必须不小于w X h X 2 byte
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- camera.startRaw(0, 320, 240, buff)
--- ```
function camera.startRaw(id, w, h, buff) end

--- 再次启动camera输出原始数据到用户的zbuff缓存区，输出1fps后会停止，并通过camera.on设置的回调函数回调接收到的长度，如果需要再次输出，请继续调用本API
---@param id number camera id,例如0
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- camera.getRaw(0)
--- ```
function camera.getRaw(id) end

--- 启停camera预览功能，直接输出到LCD上，只有硬件支持的SOC可以运行，启动预览前必须调用lcd.int等api初始化LCD，预览时自动选择已经初始化过的lcd。
---@param id number camera id,例如0
---@param onoff boolean true开启，false停止
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- camera.preview(1, true)
--- ```
function camera.preview(id, onoff) end

--- 配置摄像头参数
---@param id number camera id,例如0
---@param key number 配置项的id
---@param value number 配置项的值
---@return nil #1 当前无返回值
--- ```lua
--- 本函数于 2025.3.17 新增, 当前仅Air8101可用
--- camera.config(0, camera.CONF_H264_QP_INIT, 16)
--- camera.config(0, camera.CONF_H264_QP_I_MAX, 16)
--- camera.config(0, camera.CONF_H264_QP_P_MAX, 8)
--- camera.config(0, camera.CONF_H264_IMB_BITS, 3)
--- camera.config(0, camera.CONF_H264_PMB_BITS, 1)
--- ```
function camera.config(id, key, value) end

--- 对于无法用GPIO控制camera pwdn脚的平台，手动控制camera pwdn脚拉高或者拉低,2025/9/6启用
---@param id number camera id,例如0
---@param level number pwdn脚电平，1高电平，0低电平
--- ```lua
--- camera pwdn脚低电平
--- camera.pwdn_pin(camera_id, 0)
--- ```
function camera.pwdn_pin(id, level) end

--- 对于无法用GPIO控制camera reset脚的平台，手动控制camera reset脚拉高或者拉低,2025/9/6启用
---@param level number camera id,例如0
--- ```lua
--- camera reset脚高电平
--- camera.reset_pin(camera_id, 1)
--- ```
function camera.reset_pin(level) end
