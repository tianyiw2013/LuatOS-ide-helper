pin = {}

--pin.get(name) - 获取管脚对应的GPIO号, 可简写为  pin.PA01 , 推荐使用简写
--传入值：
--name 管脚的名称, 例如PA01, PB12
--返回值：
--int 对应的GPIO号,如果不存在则返回-1,并打印警告信息
--例子：
---- 以下三个语句完全等价, 若提示pin这个库不存在,要么固件版本低,请升级底层固件, 要么就是不需要这个库
---- PA12, GPIO12, 设置为输出, 而且低电平.
--gpio.setup(12, 0)
--gpio.setup(pin.PA12, 0) -- 推荐使用
--gpio.setup(pin.get("PA12"), 0) -- 不推荐, 太长^_^
function pin.get(name) end