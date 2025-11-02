---@meta

--- LuatOS IDE Helper for module: wlanraw
--- ```yaml
--- Summary: WLAN数据RAW传输
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/device/wlanraw/binding/luat_lib_wlanraw.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_WLAN_RAW
--- ```
--- ```lua
--- 请查阅 https://github.com/wendal/xt804-spinet
--- ```
wlanraw = {}

--- 初始化WLAN的RAW层
---@param opts table opts 配置参数
---@param cb function 回调函数,形式function(buff, size)
---@return boolean #1 true表示成功,其他失败
--- ```lua
--- 当前仅XT804系列支持, 例如 Air101/Air103/Air601/Air690
--- wlanraw.setup({
---     buffsize = 1600, -- 缓冲区大小, 默认1600字节
---     buffcount = 10, -- 缓冲区数量, 默认8
--- }, cb)
--- ```
function wlanraw.setup(opts, cb) end
