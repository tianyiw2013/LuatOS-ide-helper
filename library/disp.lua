---@meta

--- LuatOS IDE Helper for module: disp
--- ```yaml
--- Summary: disp库(已废弃)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/u8g2/luat_lib_disp.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/u8g2
--- Video: 
--- Tag: LUAT_USE_DISP
--- ```
--- ```lua
--- disp库已合并到u8g2库,API等价
--- ```
disp = {}

--- 显示屏初始化,请使用u8g2库
---@param conf table conf 配置信息
---@return number #1 正常初始化1,已经初始化过2,内存不够3,初始化失败返回4
--- ```lua
--- disp库的所有API均已合并到u8g2库
--- disp库已经映射为u8g2库,所有API均代理到u8g2,请查阅u8g2库的API
--- ```
function disp.init(conf) end
