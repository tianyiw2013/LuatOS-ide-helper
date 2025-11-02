---@meta

--- LuatOS IDE Helper for module: gtfont
--- ```yaml
--- Summary: 高通字库芯片
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/gtfont/luat_lib_gtfont.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_GTFONT
--- ```
--- ```lua
--- 已测试字体芯片型号 GT5SLCD1E-1A
--- 如需要支持其他型号,请报issue
--- ```
gtfont = {}

--- 初始化高通字体芯片
---@param spi_device userdata 仅支持spi device 生成的指针数据
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- 特别提醒: 使用本库的任何代码,都需要额外的高通字体芯片 !!
--- 没有额外芯片是跑不了的!!
--- gtfont.init(spi_device)
--- ```
function gtfont.init(spi_device) end
