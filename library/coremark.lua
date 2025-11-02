---@meta

--- LuatOS IDE Helper for module: coremark
--- ```yaml
--- Summary: 跑分
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/coremark/luat_lib_coremark.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_COREMARK
--- ```
coremark = {}

--- 开始跑分
---@return nil #1 无返回值,结果直接打印在日志中
--- ```lua
--- 大部分情况下, 这个库都不会包含在正式版固件里
--- 跑分的main.lua 应移除硬狗代码, 防止重启
--- 若设备支持自动休眠, 应关闭休眠功能
--- 若设备支持更多的频率运行, 建议设置到最高频率
--- 使用 -O3 比 -O2 -Os 的分数更高, 通常情况下
--- 会一直独占线程到执行完毕, 然后在控制台输出结果
--- coremark.run()
--- 跑分图一乐^_^
--- ```
function coremark.run() end
