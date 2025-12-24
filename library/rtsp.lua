---@meta

--- LuatOS IDE Helper for module: rtsp
--- ```yaml
--- Summary: RTSP 直播推流
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/rtsp/binding/luat_lib_rtsp.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_RTSP
--- ```
--- ```lua
--- RTSP推流示例
--- local rtsp = rtsp.create("rtsp://example.com:554/stream")
--- rtsp:setCallback(function(state, ...)
---     if state == rtsp.STATE_CONNECTED then
---         print("已连接到推流服务器")
---     elseif state == rtsp.STATE_PLAYING then
---         print("已开始推流")
---     elseif state == rtsp.STATE_ERROR then
---         print("出错:", ...)
---     end
--- end)
--- rtsp:connect()
--- 开始处理
--- rtsp:start()
--- 30秒后停止
--- sys.wait(30000)
--- rtsp:stop()
--- 断开连接
--- rtsp:disconnect()
--- rtsp:destroy()
--- ```
rtsp = {}

--- 创建RTSP推流上下文
---@param url string url RTSP服务器地址, 格式: rtsp://host:port/stream
---@return userdata #1 RTSP上下文对象
--- ```lua
--- local rtsp = rtsp.create("rtsp://example.com:554/stream")
--- ```
function rtsp.create(url) end

--- 设置RTSP状态回调函数
---@param func function func 回调函数, 参数为 (state, ...)
---@return nil #1 无返回值
--- ```lua
--- rtsp:setCallback(function(state, ...)
---     if state == rtsp.STATE_IDLE then
---         print("空闲状态")
---     elseif state == rtsp.STATE_CONNECTING then
---         print("正在连接")
---     elseif state == rtsp.STATE_OPTIONS then
---         print("发送OPTIONS")
---     elseif state == rtsp.STATE_DESCRIBE then
---         print("发送DESCRIBE")
---     elseif state == rtsp.STATE_SETUP then
---         print("发送SETUP")
---     elseif state == rtsp.STATE_PLAY then
---         print("发送PLAY请求")
---     elseif state == rtsp.STATE_PLAYING then
---         print("正在推流")
---     elseif state == rtsp.STATE_DISCONNECTING then
---         print("正在断开")
---     elseif state == rtsp.STATE_ERROR then
---         print("错误:", ...)
---     end
--- end)
--- ```
function rtsp:setCallback(func) end

--- 连接到RTSP服务器
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- local ok = rtsp:connect()
--- if ok then
---     print("连接请求已发送")
--- else
---     print("连接失败")
--- end
--- ```
function rtsp:connect() end

--- 断开RTSP连接
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- rtsp:disconnect()
--- ```
function rtsp:disconnect() end

--- 处理RTSP事件
---@return nil #1 无返回值
--- ```lua
--- rtsp:start()
--- ```
function rtsp:start() end

--- 停止处理RTSP事件
---@return nil #1 无返回值
--- ```lua
--- rtsp:stop()
--- ```
function rtsp:stop() end

--- 获取RTSP连接状态
---@return number #1 当前状态值
--- ```lua
--- local state = rtsp:getState()
--- if state == rtsp.STATE_CONNECTED then
---     print("已连接")
--- elseif state == rtsp.STATE_PLAYING then
---     print("正在推流")
--- end
--- ```
function rtsp:getState() end

--- 设置H.264 SPS参数
---@param sps_data string sps_data 或
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- local sps = string.fromBinary("\x67\x42...") -- H.264 SPS数据
--- rtsp:setSPS(sps)
--- ```
function rtsp:setSPS(sps_data) end

--- 设置H.264 PPS参数
---@param pps_data string pps_data 或
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- local pps = string.fromBinary("\x68\xCB...") -- H.264 PPS数据
--- rtsp:setPPS(pps)
--- ```
function rtsp:setPPS(pps_data) end

--- 推送H.264视频帧
---@param frame_data string frame_data 或
---@param timestamp userdata frame_data H.264编码的视频帧数据
---@return number #1 成功时返回已发送或已入队的字节数, 失败返回负数
--- ```lua
--- 持续推送H.264帧
--- local frame_data = ... -- 获取H.264帧数据
--- local timestamp = sys.now() % 0x100000000
--- local ret = rtsp:pushFrame(frame_data, timestamp)
--- if ret >= 0 then
---     print("已发送", ret, "字节")
--- else
---     print("发送失败:", ret)
--- end
--- ```
function rtsp:pushFrame(frame_data, timestamp) end

--- 获取RTSP统计信息
---@return table #1 统计信息表
--- ```lua
--- local stats = rtsp:getStats()
--- print("已发送字节数:", stats.bytes_sent)
--- print("已发送视频帧数:", stats.video_frames_sent)
--- print("已发送RTP包数:", stats.rtp_packets_sent)
--- ```
function rtsp:getStats() end

--- 销毁RTSP上下文，释放所有资源
---@return nil #1 无返回值
--- ```lua
--- rtsp:destroy()
--- ```
function rtsp:destroy() end
