---@meta

--- LuatOS IDE Helper for module: natp
--- ```yaml
--- Summary: 网络地址端口转换(开发中)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/network/ulwip/binding/luat_lib_napt.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_NAPT
--- ```
--- ```lua
--- 开发中, 请关注 https://github.com/wendal/xt804-spinet
--- ```
napt = {}

--- 初始化NAPT
---@param adapter number adapter 目标网卡索引, 默认是socket.LWIP_AP, 这里指内网
---@return nil #1 无返回值
function napt.init(adapter) end

--- 重建MAC包
---@param buff userdata 待处理的MAC包,必须是zbuff对象
---@param is_inet boolean 来源是不是内网
---@param adapter number 目标网络适配器的索引, 例如socket.LWIP_GP
---@return boolean #1 成功返回true,失败返回false
function napt.rebuild(buff, is_inet, adapter) end

--- 检查和清理NAT表
---@return nil #1 无返回值
--- ```lua
--- 两次check之间没有数据包的映射记录,会被清理
--- ```
function napt.check() end
