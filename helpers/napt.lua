napt = {}

--napt.init(adapter) - 初始化NAPT
--传入值：
--int adapter 目标网卡索引, 默认是socket.LWIP_AP, 这里指内网
--返回值：
--nil 无返回值
function napt.init(adapter) end

--napt.rebuild(buff, is_inet, adapter) - 重建MAC包
--传入值：
--userdata 待处理的MAC包,必须是zbuff对象
--bool 来源是不是内网
--int 目标网络适配器的索引, 例如socket.LWIP_GP
--返回值：
--bool 成功返回true,失败返回false
function napt.rebuild(buff,is_inet,adapter) end

--napt.check() - 检查和清理NAT表
--传入值：
--return nil
--例子：
---- 两次check之间没有数据包的映射记录,会被清理
function napt.check() end