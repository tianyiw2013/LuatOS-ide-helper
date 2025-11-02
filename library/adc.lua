---@meta

--- LuatOS IDE Helper for module: adc
--- ```yaml
--- Summary: 模数转换
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_adc.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/adc
--- Video: 
--- Tag: LUAT_USE_ADC
--- ```
--- ```lua
--- 本库可读取硬件adc通道, 也支持读取CPU温度和VBAT供电电源(若模块支持的话)
--- 读取CPU温度, 单位为0.001摄氏度, 是内部温度, 非环境温度
--- adc.open(adc.CH_CPU)
--- local temp = adc.get(adc.CH_CPU)
--- adc.close(adc.CH_CPU)
--- 读取VBAT供电电压, 单位为mV
--- adc.open(adc.CH_VBAT)
--- local vbat = adc.get(adc.CH_VBAT)
--- adc.close(adc.CH_VBAT)
--- 物理ADC通道请查阅adc.get或者adc.read的注释
--- ```
adc = {}

--- air105的ADC分压电阻开启，范围0~3.76V (number)
adc.ADC_RANGE_3_6 = 0

--- air105的ADC分压电阻关闭，范围0~1.88V (number)
adc.ADC_RANGE_1_8 = 0

--- air780E开启ADC0,1分压电阻，范围0~3.8V，将要废弃，不建议使用 (number)
adc.ADC_RANGE_3_8 = 0

--- air780E关闭ADC0,1分压电阻，范围0~1.2V，将要废弃，不建议使用 (number)
adc.ADC_RANGE_1_2 = 0

--- ADC开启内部分压后所能到达最大量程，由具体芯片决定 (number)
adc.ADC_RANGE_MAX = 0

--- ADC关闭内部分压后所能到达最大量程，由具体芯片决定 (number)
adc.ADC_RANGE_MIN = 0

--- CPU内部温度的通道id (number)
adc.CH_CPU = 0

--- VBAT供电电压的通道id (number)
adc.CH_VBAT = 0

--- ADC1 (如存在多个adc可利用此常量使用多ADC 例如 adc.open(ADC1+2) 打开ADC1 channel 2) (number)
adc.T1 = 0

--- ADC2 (如存在多个adc可利用此常量使用多ADC 例如 adc.open(ADC2+3) 打开ADC2 channel 3) (number)
adc.T2 = 0

--- 打开adc通道
---@param id number 通道id,与具体设备有关,通常从0开始
---@return boolean #1 打开结果
--- ```lua
--- 打开adc通道4,并读取
--- if adc.open(4) then
---     log.info("adc", adc.read(4)) -- 返回值有2个, 原始值和计算值,通常只需要后者
---     log.info("adc", adc.get(4))  -- 返回值有1个, 仅计算值
--- end
--- adc.close(4) -- 若需要持续读取, 则不需要close, 功耗会高一点.
--- ```
function adc.open(id) end

--- 设置ADC的测量范围，注意这个和具体芯片有关，目前只支持air105/Air780EXXX系列
---@param range number range参数,与具体设备有关,比如air105填adc.ADC_RANGE_1_8和adc.ADC_RANGE_3_6
---@return nil #1 无返回值
--- ```lua
--- 本函数要在调用adc.open之前就调用, 之后调用无效!!!
--- 关闭air105内部分压
--- adc.setRange(adc.ADC_RANGE_1_8)
--- 打开air105内部分压
--- adc.setRange(adc.ADC_RANGE_3_6)
--- Air780EXXX支持多种，但是建议用以下2种
--- adc.setRange(adc.ADC_RANGE_MIN) -- 关闭分压
--- adc.setRange(adc.ADC_RANGE_MAX) -- 启用分压
--- ```
function adc.setRange(range) end

--- 读取adc通道
---@param id number 通道id,与具体设备有关,通常从0开始
---@return number #1 原始值,一般没用,可以直接抛弃
---@return number #2 从原始值换算得出的实际值，通常单位是mV
--- ```lua
--- 打开adc通道2,并读取
--- if adc.open(2) then
--- 这里使用的是adc.read会返回2个值, 推荐走adc.get函数,直接取实际值
---     log.info("adc", adc.read(2))
--- end
--- adc.close(2)
--- ```
function adc.read(id) end

--- 获取adc计算值
---@param id number 通道id,与具体设备有关,通常从0开始
---@return number #1 单位通常是mV, 部分通道会返回温度值,单位千分之一摄氏度. 若读取失败,会返回-1
--- ```lua
--- 本API 在 2022.10.01后编译的固件可用
--- 打开adc通道2,并读取
--- if adc.open(2) then
---     log.info("adc", adc.get(2))
--- end
--- adc.close(2) -- 按需关闭
--- ```
function adc.get(id) end

--- 关闭adc通道
---@param id number 通道id,与具体设备有关,通常从0开始
--- ```lua
--- 打开adc通道2,并读取
--- if adc.open(2) then
---     log.info("adc", adc.read(2))
--- end
--- adc.close(2)
--- ```
function adc.close(id) end
