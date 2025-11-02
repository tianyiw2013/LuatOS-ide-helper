---@meta

--- LuatOS IDE Helper for module: cc
--- ```yaml
--- Summary: VoLTE通话功能
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/cc/luat_lib_cc.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/cc
--- Video: 
--- Tag: LUAT_USE_VOLTE
--- ```
--- ```lua
--- 选型手册上支持VoLTE通话功能的模组支持
--- ```
cc = {}

--- 获取最后一次通话的号码
---@return string #1 获取最后一次通话的号码
function cc.lastNum() end

--- 拨打电话
---@param sim_id number sim_id
---@param number string 电话号码
---@return boolean #1 拨打电话成功与否
function cc.dial(sim_id, number) end

--- 挂断电话
---@param sim_id number sim_id
function cc.hangUp(sim_id) end

--- 接听电话
---@param sim_id number sim_id
---@return boolean #1 接听电话成功与否
function cc.accept(sim_id) end

--- 初始化电话功能
---@param multimedia_id number multimedia_id 多媒体id
---@return boolean #1 成功与否
function cc.init(multimedia_id) end

--- 录音通话
---@param on_off boolean 开启关闭通话录音功能，false或者nil关闭，其他开启
---@param upload_zbuff1 zbuff 上行数据保存区1,zbuff创建时的空间容量必须是640的倍数,下同
---@param upload_zbuff2 zbuff 上行数据保存区2,和上行数据保存区1组成双缓冲区
---@param download_zbuff1 zbuff 下行数据保存区1
---@param download_zbuff2 zbuff 下行数据保存区2,和下行数据保存区1组成双缓冲区
---@return boolean #1 成功与否，如果处于通话状态，会失败
--- ```lua
--- buff1 = zbuff.create(6400,0,zbuff.HEAP_AUTO)
--- buff2 = zbuff.create(6400,0,zbuff.HEAP_AUTO)
--- buff3 = zbuff.create(6400,0,zbuff.HEAP_AUTO)
--- buff4 = zbuff.create(6400,0,zbuff.HEAP_AUTO)
--- cc.on("record", function(type, buff_point)
---  log.info(type, buff_point) -- type==true是下行数据，false是上行数据 buff_point指示双缓存中返回了哪一个
--- end)
--- cc.record(true, buff1, buff2, buff3, buff4)
--- ```
function cc.record(on_off, upload_zbuff1, upload_zbuff2, download_zbuff1, download_zbuff2) end

--- 获取当前通话质量
---@return number #1 1为低音质(8K)，2为高音质(16k)，0没有在通话
function cc.quality() end

--- 注册通话回调
---@param event string 事件名称 音频录音数据为"record"
---@param func function 回调方法
---@return nil #1 无返回值
--- ```lua
--- cc.on("record", function(type, buff_point)
---  log.info(type, buff_point) -- type==true是下行数据，false是上行数据 buff_point指示双缓存中返回了哪一个
--- end)
--- ```
function cc.on(event, func) end
