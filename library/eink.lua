---@meta

--- LuatOS IDE Helper for module: eink
--- ```yaml
--- Summary: 墨水屏操作库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/eink/luat_lib_eink.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/eink
--- Video: 
--- Tag: LUAT_USE_EINK
--- ```
eink = {}

--- 1.02寸d (number)
eink.MODEL_1in02d = 0

--- 1.54寸 (number)
eink.MODEL_1in54 = 0

--- 1.54寸_V2 (number)
eink.MODEL_1in54_V2 = 0

--- 1.54寸b (number)
eink.MODEL_1in54b = 0

--- 1.54寸b_V2 (number)
eink.MODEL_1in54b_V2 = 0

--- 1.54寸_V3 (number)
eink.MODEL_1in54_V3 = 0

--- 1.54寸c (number)
eink.MODEL_1in54c = 0

--- 1.54寸三色屏152*152 (number)
eink.MODEL_1in54r = 0

--- 2.13寸 (number)
eink.MODEL_2in13 = 0

--- 2.13寸bc (number)
eink.MODEL_2in13bc = 0

--- 2.13寸d (number)
eink.MODEL_2in13d = 0

--- 2.13寸V2 (number)
eink.MODEL_2in13_V2 = 0

--- 2.13寸b_V3 (number)
eink.MODEL_2in54b_V3 = 0

--- 2.66寸 (number)
eink.MODEL_2in66 = 0

--- 2.66寸b (number)
eink.MODEL_2in66b = 0

--- 2.7寸 (number)
eink.MODEL_2in7 = 0

--- 2.7寸b (number)
eink.MODEL_2in7b = 0

--- 2.9寸 (number)
eink.MODEL_2in9 = 0

--- 2.9寸_V2 (number)
eink.MODEL_2in9_V2 = 0

--- 2.9寸bc (number)
eink.MODEL_2in9bc = 0

--- 2.9寸b_V3 (number)
eink.MODEL_2in9b_V3 = 0

--- 2.9寸d (number)
eink.MODEL_2in9d = 0

--- 3.52寸 (number)
eink.MODEL_3in52 = 0

--- 3.7寸 (number)
eink.MODEL_3in7 = 0

--- 3.7寸 (number)
eink.MODEL_3in7_U = 0

--- 4.2寸 (number)
eink.MODEL_4in2 = 0

--- 4.2寸V2(ssd1683) (number)
eink.MODEL_4in2V2 = 0

--- 4.2寸b (number)
eink.MODEL_4in2bc = 0

--- 4.2寸V2 (number)
eink.MODEL_4in2b_V2 = 0

--- 5.65寸f (number)
eink.MODEL_5in65f = 0

--- 5.83寸 (number)
eink.MODEL_5in83 = 0

--- 5.83寸bc (number)
eink.MODEL_5in83bc = 0

--- 5.83寸V2 (number)
eink.MODEL_5in83_V2 = 0

--- 5.83寸bV2 (number)
eink.MODEL_5in83b_V2 = 0

--- 7.5寸 (number)
eink.MODEL_7in5 = 0

--- 7.5寸HD (number)
eink.MODEL_7in5_HD = 0

--- 7.5寸V2 (number)
eink.MODEL_7in5_V2 = 0

--- 7.5寸bc (number)
eink.MODEL_7in5bc = 0

--- 7.5寸b_HD (number)
eink.MODEL_7in5b_HD = 0

--- 7.5寸b_V2 (number)
eink.MODEL_7in5b_V2 = 0

--- 12号字体 (font)
eink.font_opposansm12 = 0

--- 16号字体 (font)
eink.font_opposansm16 = 0

--- 18号字体 (font)
eink.font_opposansm18 = 0

--- 20号字体 (font)
eink.font_opposansm20 = 0

--- 22号字体 (font)
eink.font_opposansm22 = 0

--- 24号字体 (font)
eink.font_opposansm24 = 0

--- 32号字体 (font)
eink.font_opposansm32 = 0

--- 12号中文字体 (font)
eink.font_opposansm12_chinese = 0

--- 14号中文字体 (font)
eink.font_opposansm14_chinese = 0

--- 16号中文字体 (font)
eink.font_opposansm16_chinese = 0

--- 18号中文字体 (font)
eink.font_opposansm18_chinese = 0

--- 20号中文字体 (font)
eink.font_opposansm20_chinese = 0

--- 22号中文字体 (font)
eink.font_opposansm22_chinese = 0

--- 24号中文字体 (font)
eink.font_opposansm24_chinese = 0

--- 32号中文字体 (font)
eink.font_opposansm32_chinese = 0

--- eink显示屏初始化
---@param tp number eink类型，当前支持型号请查阅常量定义
---@param args table 附加参数
---@param spi_device userdata spi设备,当port = "device"时有效
--- ```lua
--- 初始化spi0的eink.MODEL_4in2bc) 注意:eink初始化之前需要先初始化spi
--- spi_eink = spi.deviceSetup(0,20,0,0,8,20000000,spi.MSB,1,1)
--- log.info("eink.init",
--- eink.init(eink.MODEL_4in2bc,{port = "device",pin_dc = 17, pin_pwr = 7,pin_rst = 19,direction = 2,w = 160,h = 80,xoffset = 1,yoffset = 26},spi_eink))
--- args参数说明
--- port：spi端口,例如0,1,2...如果为device方式则为字符串"device"
--- pin_dc：eink数据/命令选择引脚
--- pin_rst：eink复位引脚
--- pin_busy：eink忙引脚
--- mode：1全屏模式,0局部刷新模式,可选,默认全屏模式
--- ```
function eink.init(tp, args, spi_device) end

--- 初始化eink
---@param full number 全屏刷新0,局部刷新1,默认是全屏刷新
---@param spiid number 所在的spi,默认是0
---@param pin_busy number Busy 忙信号管脚
---@param pin_reset number Reset 复位管脚
---@param pin_dc number DC 数据命令选择管脚
---@param pin_cs number CS 使能管脚
---@return boolean #1 成功返回true,否则返回false
function eink.setup(full, spiid, pin_busy, pin_reset, pin_dc, pin_cs) end

--- 进入休眠模式，再次使用时需要重新初始化
function eink.sleep() end

--- 清除绘图缓冲区，默认不会马上刷新到设备
---@param color number color 可选，默认1。刷屏颜色
---@param force boolean force 可选，默认false。如果为true则马上清屏
---@return nil #1 无返回值
function eink.clear(color, force) end

--- 设置窗口
---@param width number width  宽度
---@param height number height 高度
---@param rotate number rotate 显示方向,0/1/2/3, 相当于旋转0度/90度/180度/270度
---@return nil #1 无返回值
function eink.setWin(width, height, rotate) end

--- 获取窗口信息
---@return number #1 width  宽
---@return number #2 height 高
---@return number #3 rotate 旋转方向
function eink.getWin() end

--- 设置字体
---@param font userdata 字体
--- ```lua
--- 设置为字体,对之后的print有效
--- eink.setFont(eink.font_opposansm12_chinese)
--- ```
function eink.setFont(font) end

--- 绘制字符串
---@param x number x坐标
---@param y number y坐标
---@param str string 字符串
---@param colored number 颜色, 可以是0或者1, 默认是0
---@return nil #1 无返回值
--- ```lua
--- 注意, 本库只支持普通SPI, 不支持LCD专用SPI
--- 请确保已经正确连接了屏幕, 连接方式请参考demo
--- 先设置字体, 然后写字
--- 可用字体取决于具体的固件, 如果没有你想要的大小, 请联系销售人员定制
--- font_opposansm8_chinese
--- font_opposansm10_chinese
--- font_opposansm12_chinese
--- font_opposansm14_chinese
--- font_opposansm16_chinese
--- eink.setFont(eink.font_opposansm12_chinese)
--- eink.print(10, 20, "LuatOS")
--- ```
function eink.print(x, y, str, colored) end

--- 将缓冲区图像输出到屏幕
---@param x number x 输出的x坐标,默认0
---@param y number y 输出的y坐标,默认0
---@param noClear boolean 可选，默认false。如果为true则不进行清屏，直接刷上新内容
---@return nil #1 无返回值
function eink.show(x, y, noClear) end

--- 直接输出数据到屏幕,支持双色数据
---@param buff userdata zbuff指针
---@param buff2 userdata zbuff指针
---@param noclear boolean 可选，默认false。如果为true则不进行清屏，直接刷上新内容
---@return nil #1 无返回值
function eink.draw(buff, buff2, noclear) end

--- 缓冲区绘制线
---@param x number 起点x坐标
---@param y number 起点y坐标
---@param x2 number 终点x坐标
---@param y2 number 终点y坐标
---@param colored any 
---@return nil #1 无返回值
--- ```lua
--- eink.line(0, 0, 10, 20, 0)
--- ```
function eink.line(x, y, x2, y2, colored) end

--- 缓冲区绘制矩形
---@param x number 左上顶点x坐标
---@param y number 左上顶点y坐标
---@param x2 number 右下顶点x坐标
---@param y2 number 右下顶点y坐标
---@param colored number 默认是0
---@param fill number 是否填充,默认是0,不填充
---@return nil #1 无返回值
--- ```lua
--- eink.rect(0, 0, 10, 20)
--- eink.rect(0, 0, 10, 20,0, 1) -- Filled
--- ```
function eink.rect(x, y, x2, y2, colored, fill) end

--- 缓冲区绘制圆形
---@param x number 圆心x坐标
---@param y number 圆心y坐标
---@param radius number 半径
---@param colored number 默认是0
---@param fill number 是否填充,默认是0,不填充
---@return nil #1 无返回值
--- ```lua
--- eink.circle(0, 0, 10)
--- eink.circle(0, 0, 10, 1, 1) -- Filled
--- ```
function eink.circle(x, y, radius, colored, fill) end

--- 缓冲区绘制QRCode
---@param x number x坐标
---@param y number y坐标
---@param str string 二维码的内容
---@param size number 显示大小 (注意:二维码生成大小与要显示内容和纠错等级有关,生成版本为1-40(对应 21x21 - 177x177)的不定大小,如果和设置大小不同会自动在指定的区域中间显示二维码,如二维码未显示请查看日志提示)
---@return nil #1 无返回值
function eink.qrcode(x, y, str, size) end

--- 缓冲区绘制电池
---@param x number x坐标
---@param y number y坐标
---@param bat number 电池电压,单位毫伏
---@return nil #1 无返回值
function eink.bat(x, y, bat) end

--- 设置墨水屏驱动型号
---@param m number 型号名称, 例如 eink.model(eink.MODEL_1in54_V2)
---@return nil #1 无返回值
function eink.model(m) end

--- 绘制位图
---@param x number X坐标
---@param y number y坐标
---@param w number 位图宽
---@param h number 位图高
---@param data number 位图数据,每一位代表一个像素
--- ```lua
--- 取模使用PCtoLCD2002软件即可
--- 在(0,0)为左上角,绘制 16x16 "今" 的位图
--- eink.drawXbm(0, 0, 16,16, string.char(
---     0x80,0x00,0x80,0x00,0x40,0x01,0x20,0x02,0x10,0x04,0x48,0x08,0x84,0x10,0x83,0x60,
---     0x00,0x00,0xF8,0x0F,0x00,0x08,0x00,0x04,0x00,0x04,0x00,0x02,0x00,0x01,0x80,0x00
--- ))
--- ```
function eink.drawXbm(x, y, w, h, data) end

--- 切换颜色画板, 适合多色墨水屏
---@param index number 颜色索引, 黑色为0, 红色为1
--- ```lua
--- 仅适合多色墨水屏, 对单色墨水屏(只有黑白)的无效
--- eink.setCtx(1)
--- 切换后, 所有drawXXX都会操作在指定颜色的画板
--- ```
function eink.setCtx(index) end

--- 异步方式，使用此方式需要先 require("sysplus") 之后 eink.clear().wait() eink.show().wait()进行刷屏
---@param index number 1 使用异步
--- ```lua
--- eink.async(1)
---     spi_eink = spi.deviceSetup(spi_id,pin_cs,0,0,8,20*1000*1000,spi.MSB,1,1)
---     eink.init(eink.MODEL_1in54,
---             {port = "device",pin_dc = pin_dc, pin_busy = pin_busy,pin_rst = pin_reset},
---             spi_eink)
---     eink.setWin(200, 200, 0)
---     sys.wait(100)
---     log.info("e-paper 1.54", "Testing Go")
---     eink.print(30, 20, "LuatOS-AIR780E",0x00)
---     eink.show().wait()
---     log.info("e-paper 1.54", "Testing End")
--- ```
function eink.async(index) end
