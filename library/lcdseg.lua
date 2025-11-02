---@meta

--- LuatOS IDE Helper for module: lcdseg
--- ```yaml
--- Summary: 段式lcd
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_lcdseg.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_LCDSEG
--- ```
lcdseg = {}

--- 没偏置电压(bias) (number)
lcdseg.BIAS_STATIC = 0

--- 1/2偏置电压(bias) (number)
lcdseg.BIAS_ONEHALF = 0

--- 1/3偏置电压(bias) (number)
lcdseg.BIAS_ONETHIRD = 0

--- 1/4偏置电压(bias) (number)
lcdseg.BIAS_ONEFOURTH = 0

--- 100%占空比(duty) (number)
lcdseg.DUTY_STATIC = 0

--- 1/2占空比(duty) (number)
lcdseg.DUTY_ONEHALF = 0

--- 1/3占空比(duty) (number)
lcdseg.DUTY_ONETHIRD = 0

--- 1/4占空比(duty) (number)
lcdseg.DUTY_ONEFOURTH = 0

--- 1/5占空比(duty) (number)
lcdseg.DUTY_ONEFIFTH = 0

--- 1/6占空比(duty) (number)
lcdseg.DUTY_ONESIXTH = 0

--- 1/7占空比(duty) (number)
lcdseg.DUTY_ONESEVENTH = 0

--- 1/8占空比(duty) (number)
lcdseg.DUTY_ONEEIGHTH = 0

--- 初始化lcdseg库
---@param bias number bias值,通常为 1/3 bias, 对应 lcdseg.BIAS_ONETHIRD
---@param duty number duty值,通常为 1/4 duty, 对应 lcdseg.DUTY_ONEFOURTH
---@param vlcd number 电压, 单位100mV, 例如2.7v写27. air103支持的值有 27/29/31/33
---@param com_number number COM脚的数量, 取决于具体模块, air103支持1-4
---@param fresh_rate number 刷新率,通常为60, 对应60HZ
---@param com_mark number COM启用与否的掩码, 默认为0xFF,全部启用.若只启用COM0/COM1, 则0x03
---@param seg_mark number seg启用与否的掩码, 默认为0xFFFFFFFF,即全部启用. 若只启用前16个, 0xFFFF
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- 初始化lcdseg
--- if lcdseg.setup(lcdseg.BIAS_ONETHIRD, lcdseg.DUTY_ONEFOURTH, 33, 4, 60) then
---     lcdseg.enable(1)
---     lcdseg.seg_set(0, 1, 1)
---     lcdseg.seg_set(2, 0, 1)
---     lcdseg.seg_set(3, 31, 1)
--- end
--- ```
function lcdseg.setup(bias, duty, vlcd, com_number, fresh_rate, com_mark, seg_mark) end

--- 启用或禁用lcdseg库
---@param en number 1启用,0禁用
---@return boolean #1 成功与否
function lcdseg.enable(en) end

--- 启用或禁用lcdseg的输出
---@param en number 1启用,0禁用
---@return boolean #1 成功与否
function lcdseg.power(en) end

--- 设置具体一个段码的状态
---@param com number COM号
---@param seg number seg号 要更改的字段的位索引
---@param en number 1启用,0禁用
---@return boolean #1 成功与否
function lcdseg.seg_set(com, seg, en) end
