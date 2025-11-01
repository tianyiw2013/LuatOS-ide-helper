disp = {}

--disp.init(conf) - 显示屏初始化,请使用u8g2库
--传入值：
--table conf 配置信息
--返回值：
--int 正常初始化1,已经初始化过2,内存不够3,初始化失败返回4
--例子：
---- disp库的所有API均已合并到u8g2库
---- disp库已经映射为u8g2库,所有API均代理到u8g2,请查阅u8g2库的API
function disp.init(conf) end