lora2 = {}

--lora2.init(ic, loraconfig,spiconfig) - lora初始化
--传入值：
--string lora 型号，当前支持：<br>llcc68<br>sx1268
--table lora配置参数,与具体设备有关
--返回值：
--userdata 若成功会返回lora对象,否则返回nil
--例子：
--spi_lora = spi.deviceSetup(spi_id,pin_cs,0,0,8,10*1000*1000,spi.MSB,1,0)
--lora_device = lora2.init("llcc68",{res = pin_reset,busy = pin_busy,dio1 = pin_dio1},spi_lora)
function lora2.init(ic,loraconfig,spiconfig) end