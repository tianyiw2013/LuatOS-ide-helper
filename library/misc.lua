---@meta

--- LuatOS IDE Helper for module: misc
--- ```yaml
--- Summary: 杂项驱动，各种非常规驱动，芯片独有驱动都放在这里
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/misc/binding/luat_lib_misc.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/misc
--- Video: 
--- Tag: LUAT_USE_MISC
--- ```
misc = {}

--- 某个引脚的GPO功能使能
---@param id number id, GPO编号
---@return nil #1 无返回值
--- ```lua
--- misc.gpo_setup(0)
--- ```
function misc.gpo_setup(id) end

--- GPO输出高低电平
---@param id number id, GPO编号
---@param level number level, 1高电平，0低电平
---@return nil #1 无返回值
--- ```lua
--- misc.gpo_output(0,1)
--- ```
function misc.gpo_output(id, level) end

--- 获取GPO输出的电平
---@param id number id, GPO编号
---@return number #1 level, 1高电平，0低电平
--- ```lua
--- misc.gpo_level(0)
--- ```
function misc.gpo_level(id) end
