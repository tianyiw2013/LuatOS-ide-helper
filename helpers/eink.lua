eink = {}

--eink.init(tp, args,spi_device) - eink显示屏初始化
--传入值：
--number eink类型，当前支持：https://wiki.luatos.com/api/eink.html#id1
--table 附加参数,与具体设备有关：<br>pin_busy（busy）<br>port：spi端口,例如0,1,2...如果为device方式则为"device"<br>pin_dc：eink数据/命令选择引脚<br>pin_rst：eink复位引脚
--userdata spi设备,当port = "device"时有效
--例子：
---- 初始化spi0的eink.MODEL_4in2bc) 注意:eink初始化之前需要先初始化spi
--spi_eink = spi.deviceSetup(0,20,0,0,8,20000000,spi.MSB,1,1)
--log.info("eink.init",
--eink.init(eink.MODEL_4in2bc,{port = "device",pin_dc = 17, pin_pwr = 7,pin_rst = 19,direction = 2,w = 160,h = 80,xoffset = 1,yoffset = 26},spi_eink))
function eink.init(tp,args,spi_device) end

--eink.setup(full, spiid, pin_busy, pin_reset, pin_dc, pin_cs) - 初始化eink
--传入值：
--int 全屏刷新0,局部刷新1,默认是全屏刷新
--int 所在的spi,默认是0
--int Busy 忙信号管脚
--int Reset 复位管脚
--int DC 数据命令选择管脚
--int CS 使能管脚
--返回值：
--boolean 成功返回true,否则返回false
function eink.setup(full,spiid,pin_busy,pin_reset,pin_dc,pin_cs) end

--eink.sleep() - 进入休眠模式，再次使用时需要重新初始化
function eink.sleep() end

--eink.clear(color, force) - 清除绘图缓冲区，默认不会马上刷新到设备
--传入值：
--number color 可选，默认1。刷屏颜色
--bool force 可选，默认false。如果为true则马上清屏
--返回值：
--nil 无返回值
function eink.clear(color,force) end

--eink.setWin(width, height, rotate) - 设置窗口
--传入值：
--int width  宽度
--int height 高度
--int rotate 显示方向,0/1/2/3, 相当于旋转0度/90度/180度/270度
--返回值：
--nil 无返回值
function eink.setWin(width,height,rotate) end

--eink.getWin() - 获取窗口信息
--返回值：
--int width  宽
--int height 高
--int rotate 旋转方向
function eink.getWin() end

--eink.setFont(font) - 设置字体
--传入值：
--userdata 字体
--例子：
---- 设置为字体,对之后的print有效
--eink.setFont(eink.font_opposansm12_chinese)
function eink.setFont(font) end

--eink.print(x, y, str, colored) - 绘制字符串
--传入值：
--int x坐标
--int y坐标
--string 字符串
--int 颜色, 可以是0或者1, 默认是0
--返回值：
--nil 无返回值
--例子：
---- 先设置字体, 然后写字
---- 可用字体取决于具体的固件, 如果没有你想要的大小,可以云编译一份自定义固件
---- font_opposansm8_chinese
---- font_opposansm10_chinese
---- font_opposansm12_chinese
---- font_opposansm14_chinese
---- font_opposansm16_chinese
--eink.setFont(eink.font_opposansm12_chinese)
--eink.print(10, 20, "LuatOS")
function eink.print(x,y,str,colored) end

--eink.show(x, y, noClear) - 将缓冲区图像输出到屏幕
--传入值：
--int x 输出的x坐标,默认0
--int y 输出的y坐标,默认0
--bool 可选，默认false。如果为true则不进行清屏，直接刷上新内容
--返回值：
--nil 无返回值
function eink.show(x,y,noClear) end

--eink.draw(buff, buff2, noclear) - 直接输出数据到屏幕,支持双色数据
--传入值：
--userdata zbuff指针
--userdata zbuff指针
--bool 可选，默认false。如果为true则不进行清屏，直接刷上新内容
--返回值：
--nil 无返回值
function eink.draw(buff,buff2,noclear) end

--eink.line(x, y, x2, y2, colored) - 缓冲区绘制线
--传入值：
--int 起点x坐标
--int 起点y坐标
--int 终点x坐标
--int 终点y坐标
--返回值：
--nil 无返回值
--例子：
--eink.line(0, 0, 10, 20, 0)
function eink.line(x,y,x2,y2,colored) end

--eink.rect(x, y, x2, y2, colored, fill) - 缓冲区绘制矩形
--传入值：
--int 左上顶点x坐标
--int 左上顶点y坐标
--int 右下顶点x坐标
--int 右下顶点y坐标
--int 默认是0
--int 是否填充,默认是0,不填充
--返回值：
--nil 无返回值
--例子：
--eink.rect(0, 0, 10, 20)
--eink.rect(0, 0, 10, 20,0, 1) -- Filled
function eink.rect(x,y,x2,y2,colored,fill) end

--eink.circle(x, y, radius, colored, fill) - 缓冲区绘制圆形
--传入值：
--int 圆心x坐标
--int 圆心y坐标
--int 半径
--int 默认是0
--int 是否填充,默认是0,不填充
--返回值：
--nil 无返回值
--例子：
--eink.circle(0, 0, 10)
--eink.circle(0, 0, 10, 1, 1) -- Filled
function eink.circle(x,y,radius,colored,fill) end

--eink.qrcode(x, y, str, size) - 缓冲区绘制QRCode
--传入值：
--int x坐标
--int y坐标
--string 二维码的内容
--int 显示大小 (注意:二维码生成大小与要显示内容和纠错等级有关,生成版本为1-40(对应 21x21 - 177x177)的不定大小,如果和设置大小不同会自动在指定的区域中间显示二维码,如二维码未显示请查看日志提示)
--返回值：
--nil 无返回值
function eink.qrcode(x,y,str,size) end

--eink.bat(x, y, bat) - 缓冲区绘制电池
--传入值：
--int x坐标
--int y坐标
--int 电池电压,单位毫伏
--返回值：
--nil 无返回值
function eink.bat(x,y,bat) end

--eink.weather_icon(x, y, code) - 缓冲区绘制天气图标
--传入值：
--int x坐标
--int y坐标
--int 天气代号
--返回值：
--nil 无返回值
function eink.weather_icon(x,y,code) end

--eink.model(m) - 设置墨水屏驱动型号
--传入值：
--int 型号名称, 例如 eink.model(eink.MODEL_1in54_V2)
--返回值：
--nil 无返回值
function eink.model(m) end

--eink.drawXbm(x, y, w, h, data) - 绘制位图
--传入值：
--int X坐标
--int y坐标
--int 位图宽
--int 位图高
--int 位图数据,每一位代表一个像素
--例子：
---- 取模使用PCtoLCD2002软件即可
---- 在(0,0)为左上角,绘制 16x16 "今" 的位图
--eink.drawXbm(0, 0, 16,16, string.char(
--    0x80,0x00,0x80,0x00,0x40,0x01,0x20,0x02,0x10,0x04,0x48,0x08,0x84,0x10,0x83,0x60,
--    0x00,0x00,0xF8,0x0F,0x00,0x08,0x00,0x04,0x00,0x04,0x00,0x02,0x00,0x01,0x80,0x00
--))
function eink.drawXbm(x,y,w,h,data) end

--eink.setCtx(index) - 切换颜色画板, 适合多色墨水屏
--传入值：
--int 颜色索引, 黑色为0, 红色为1
--例子：
---- 仅适合多色墨水屏, 对单色墨水屏(只有黑白)的无效
--eink.setCtx(1)
---- 切换后, 所有drawXXX都会操作在指定颜色的画板
function eink.setCtx(index) end

--eink.async(index) - 异步方式，使用此方式需要先 require("sysplus") 之后 eink.clear().wait() eink.show().wait()进行刷屏
--传入值：
--int 1 使用异步
--例子：
--    eink.async(1)
--    spi_eink = spi.deviceSetup(spi_id,pin_cs,0,0,8,20*1000*1000,spi.MSB,1,1)
--    eink.init(eink.MODEL_1in54,
--            {port = "device",pin_dc = pin_dc, pin_busy = pin_busy,pin_rst = pin_reset},
--            spi_eink)
--    eink.setWin(200, 200, 0)
--    sys.wait(100)
--    log.info("e-paper 1.54", "Testing Go")
--    eink.print(30, 20, "LuatOS-AIR780E",0x00)
--    eink.show().wait()
--    log.info("e-paper 1.54", "Testing End")
function eink.async(index) end