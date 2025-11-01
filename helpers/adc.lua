adc = {}

--adc.open(id) - 打开adc通道
--传入值：
--int 通道id,与具体设备有关,通常从0开始
--返回值：
--boolean 打开结果
--例子：
---- 打开adc通道4,并读取
--if adc.open(4) then
--    log.info("adc", adc.read(4)) -- 返回值有2个, 原始值和计算值,通常只需要后者
--    log.info("adc", adc.get(4))  -- 返回值有1个, 仅计算值
--end
--adc.close(4) -- 若需要持续读取, 则不需要close, 功耗会高一点.
function adc.open(id) end

--adc.setRange(range) - 设置ADC的测量范围，注意这个和具体芯片有关，目前只支持air105/Air780E系列
--传入值：
--int range参数,与具体设备有关,比如air105填adc.ADC_RANGE_1_8和adc.ADC_RANGE_3_6
--return nil
--例子：
---- 本函数要在调用adc.open之前就调用, 之后调用无效!!!
--
---- 关闭air105内部分压
--adc.setRange(adc.ADC_RANGE_1_8)
---- 打开air105内部分压
--adc.setRange(adc.ADC_RANGE_3_6)
--
--
---- EC618系列(Air780E等)/EC718E系列(Air780EP/Air780EPV等)支持以下2种
--adc.setRange(adc.ADC_RANGE_1_2) -- 关闭分压
--adc.setRange(adc.ADC_RANGE_3_8) -- 启用分压
function adc.setRange(range) end

--adc.read(id) - 读取adc通道
--传入值：
--int 通道id,与具体设备有关,通常从0开始
--返回值：
--int 原始值,一般没用,可以直接抛弃
--int 从原始值换算得出的实际值，通常单位是mV
--例子：
---- 打开adc通道2,并读取
--if adc.open(2) then
--    -- 这里使用的是adc.read会返回2个值, 推荐走adc.get函数,直接取实际值
--    log.info("adc", adc.read(2))
--end
--adc.close(2)
function adc.read(id) end

--adc.get(id) - 获取adc计算值
--传入值：
--int 通道id,与具体设备有关,通常从0开始
--返回值：
--int 单位通常是mV, 部分通道会返回温度值,单位千分之一摄氏度. 若读取失败,会返回-1
--例子：
---- 本API 在 2022.10.01后编译的固件可用
---- 打开adc通道2,并读取
--if adc.open(2) then
--    log.info("adc", adc.get(2))
--end
--adc.close(2) -- 按需关闭
function adc.get(id) end

--adc.close(id) - 关闭adc通道
--传入值：
--int 通道id,与具体设备有关,通常从0开始
--例子：
---- 打开adc通道2,并读取
--if adc.open(2) then
--    log.info("adc", adc.read(2))
--end
--adc.close(2)
function adc.close(id) end