max30102 = {}

--max30102.init(i2c_id,int) - 初始化MAX30102传感器
--传入值：
--int 传感器所在的i2c总线id,默认为0
--int int引脚
--返回值：
--bool 成功返回true, 否则返回nil或者false
--例子：
--if max30102.init(0,pin.PC05) then
--    log.info("max30102", "init ok")
--else
--    log.info("max30102", "init fail")
--end
function max30102.init(i2c_id,int) end

--max30102.get() - 获取心率血氧(大概需要10s时间测量)
--返回值：
--bool 成功返回true, 否则返回nil或者false
--number 心率
--number 血氧
function max30102.get() end

--max30102.shutdown() - 关闭max30102
function max30102.shutdown() end