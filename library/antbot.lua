---@meta

--- LuatOS IDE Helper for module: antbot
--- ```yaml
--- Summary: 蚂蚁链
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/antbot/binding/luat_lib_antbot.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/antbot
--- Video: 
--- Tag: LUAT_USE_ANTBOT
--- ```
--- ```lua
--- Copyright (C) 2015-2023 Ant Group Holding Limited
--- 本模块由蚂蚁链提供实现并开放给用户使用
--- 具体用法请查阅demo,并联系蚂蚁链获取技术支持
--- ```
antbot = {}

--- 初始化
---@return number #1 0:成功 其他值为失败
--- ```lua
--- 初始化蚂蚁链的底层适配
--- antbot.init()
--- ```
function antbot.init() end

--- 获取客户端状态
---@return number #1 状态码
function antbot.app_sta_get() end

--- 获取SDK版本号
---@return string #1 版本号,如果获取失败返回nil
function antbot.version_get() end

--- asset资源注册
---@param asset_id string asset_id 资源ID
---@param asset_type string asset_type 资源类型
---@param asset_dataver string asset_dataver 资源数据版本
---@return number #1 0:成功 其他值为失败
function antbot.asset_register(asset_id, asset_type, asset_dataver) end

--- asset资源发布
---@param data string data 资源数据
---@return number #1 0:成功 其他值为失败
function antbot.asset_data_publish(data) end

--- 获取设备状态
---@return number #1 设备状态
function antbot.device_status_get() end

--- 获取assset状态
---@param asset_id string asset_id 资源ID
---@return number #1 资源状态
function antbot.asset_status_get(asset_id) end

--- 切换channel
---@param cmd number 0 - 关闭, 1 - 开启
---@return number #1 0:成功 其他值为失败
function antbot.channel_switch(cmd) end

--- 配置设备
---@param config string config 配置内容
---@return number #1 0:成功 其他值为失败
function antbot.config_set(config) end

--- 获取设备配置
---@return string #1 配置内容
function antbot.config_get() end
