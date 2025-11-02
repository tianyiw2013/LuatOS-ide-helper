---@meta

--- LuatOS IDE Helper for module: u8g2
--- ```yaml
--- Summary: u8g2图形处理库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/u8g2/luat_lib_u8g2.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/u8g2
--- Video: 
--- Tag: LUAT_USE_U8G2
--- ```
--- ```lua
--- 注意, 本库只支持普通SPI, 不支持LCD专用SPI
--- 请确保已经正确连接了屏幕, 连接方式请参考demo
--- OLED屏幕, 正确驱动才会显示内容, 不然就是黑屏的
--- ```
u8g2 = {}

--- 上右 (number)
u8g2.DRAW_UPPER_RIGHT = 0

--- 上左 (number)
u8g2.DRAW_UPPER_LEFT = 0

--- 下左 (number)
u8g2.DRAW_LOWER_LEFT = 0

--- 下右 (number)
u8g2.DRAW_LOWER_RIGHT = 0

--- 全部 (number)
u8g2.DRAW_ALL = 0

--- 文本周围没有边框 (number)
u8g2.BTN_BW0 = 0

--- 文本周围的边框，1像素边框宽度 (number)
u8g2.BTN_BW1 = 0

--- 文本周围的边框，2像素边框宽度 (number)
u8g2.BTN_BW2 = 0

--- 文本周围的边框，3像素边框宽度 (number)
u8g2.BTN_BW3 = 0

--- 启用阴影，与框架无间隙 (number)
u8g2.BTN_SHADOW0 = 0

--- 启用阴影，到帧的1像素间隙 (number)
u8g2.BTN_SHADOW1 = 0

--- 启用阴影，到帧的2像素间隙 (number)
u8g2.BTN_SHADOW2 = 0

--- 反转文本 (number)
u8g2.BTN_INV = 0

--- 将文本置于框架内的中心，并将参考位置更改为文本的中心 (number)
u8g2.BTN_HCENTER = 0

--- 在按钮周围绘制第二个1像素框 (number)
u8g2.BTN_XFRAME = 0

--- u8g2显示屏初始化
---@param conf table conf 配置信息,详细配置看下面的例子
---@return number #1 正常初始化1,已经初始化过2,内存不够3,初始化失败返回4
--- ```lua
--- conf配置项说明
--- ic 字符串,主控芯片类型, 支持custom(自定义命令) ssd1306(默认) ssd1309 ssd1322 sh1106 sh1107 sh1108 st7567 uc1701 ssd1306_128x32
--- direction 数值,方向,可选0 90 180 270 默认0
--- mode 字符串,模式,可选i2c_sw:软件i2c i2c_hw:硬件i2c,spi_hw_4pin: 硬件spi
--- i2c_id: 数值,硬件i2c时有效
--- i2c_scl: 数值,软件i2c时时钟线的GPIO编号
--- i2c_sda: 数值软件i2c时数据线的GPIO编号
--- spi_id、spi_res、spi_dc、spi_cs: 数值,硬件spi的SPI编号,复位GPIO编号,DC线的GPIO编号, CS线的GPIO编号
--- x_offset: 数值,X轴偏移量,默认按驱动走, 2023.11.10新增的配置项
--- 初始化硬件i2c的ssd1306
--- u8g2.begin({ic = "ssd1306",direction = 0,mode="i2c_hw",i2c_id=0}) -- direction 可选0 90 180 270
--- 初始化硬件spi的ssd1306
--- u8g2.begin({ic = "ssd1306",direction = 0,mode="spi_hw_4pin",spi_id=0,spi_res=20,spi_dc=21,spi_cs=24}) -- direction 可选0 90 180 270
--- 初始化软件i2c的ssd1306
--- u8g2.begin({ic = "ssd1306",direction = 0,mode="i2c_sw", i2c_scl=1, i2c_sda=4}) -- 通过PA1 SCL / PA4 SDA模拟
--- ```
function u8g2.begin(conf) end

--- 关闭显示屏
--- ```lua
--- 关闭disp,再次使用disp相关API的话,需要重新初始化
--- u8g2.close()
--- ```
function u8g2.close() end

--- 清屏，清除内存帧缓冲区中的所有像素
--- ```lua
--- 清屏
--- u8g2.ClearBuffer()
--- ```
function u8g2.ClearBuffer() end

--- 将数据更新到屏幕，将存储器帧缓冲区的内容发送到显示器
--- ```lua
--- 把显示数据更新到屏幕
--- u8g2.SendBuffer()
--- ```
function u8g2.SendBuffer() end

--- 在显示屏上画一段文字，在显示屏上画一段文字,要调用u8g2.SendBuffer()才会更新到屏 注意:设置坐标为显示字符串左下角坐标
---@param str string 文件内容
---@param x number 横坐标
---@param y number 竖坐标
--- ```lua
--- u8g2.DrawUTF8("wifi is ready", 10, 20)
--- ```
function u8g2.DrawUTF8(str, x, y) end

--- 在提供的文本周围画一个框。这与 DrawUTF8 类似，但为文本添加了一些装饰。要调用u8g2.SendBuffer()才会更新到屏幕 注意:设置坐标为显示字符串左下角坐标
---@param str string 文件内容
---@param x number 横坐标
---@param y number 竖坐标
---@param flags number 标志 多个标志可以与“或”运算符一起使用。
---@param w number 文本的最小宽度。如果为0（或低于文本宽度），则文本宽度将用于框架。
---@param h number 文本前后的额外空间。
---@param v number 文本上下的额外空间。
---@param str any 
--- ```lua
--- u8g2.DrawButtonUTF8("str", 10, 20,u8g2.BTN_BW2,0,2,2)
--- ```
function u8g2.DrawButtonUTF8(str, x, y, flags, w, h, v, str) end

--- 设置字体模式
---@param mode number mode字体模式，启用（1）或禁用（0）透明模式
--- ```lua
--- u8g2.SetFontMode(1)
--- ```
function u8g2.SetFontMode(mode) end

--- 设置字体
---@param font userdata font, u8g2.font_opposansm8 为纯英文8号字体
---@param indentation number indentation, 等宽字体ascii右侧缩进0~127个pixel，等宽字体的ascii字符可能在右侧有大片空白，用户可以选择删除部分。留空或者超过127则直接删除右半边, 非等宽字体无效
--- ```lua
--- 设置为中文字体,对之后的drawStr有效
--- u8g2.SetFont(u8g2.font_opposansm12)
--- font参数，根据模组的固件的不同，可能的取值有
--- 英文类 
--- font_opposansm10 font_opposansm12 font_opposansm16 
--- font_opposansm18 font_opposansm20 font_opposansm22 font_opposansm24 font_opposansm32
--- 中文类 u8g2.font_opposansm12_chinese 为12x12全中文
--- font_opposansm16_chinese font_opposansm24_chinese font_opposansm32_chinese 可选
--- ```
function u8g2.SetFont(font, indentation) end

--- 获取显示屏高度
---@return number #1 显示屏高度
--- ```lua
--- u8g2.GetDisplayHeight()
--- ```
function u8g2.GetDisplayHeight() end

--- 获取显示屏宽度
---@return number #1 显示屏宽度
--- ```lua
--- u8g2.GetDisplayWidth()
--- ```
function u8g2.GetDisplayWidth() end

--- 为所有绘图功能分配绘图颜色。
---@param c number c为颜色值 0没有色 1有色 2与底色xor
--- ```lua
--- u8g2.SetDrawColor(0)
--- ```
function u8g2.SetDrawColor(c) end

--- 画一个点.
---@param x number X位置.
---@param y number Y位置.
--- ```lua
--- u8g2.DrawPixel(20, 5)
--- ```
function u8g2.DrawPixel(x, y) end

--- 在两点之间画一条线.
---@param x0 number 第一个点的X位置.
---@param y0 number 第一个点的Y位置.
---@param x1 number 第二个点的X位置.
---@param y1 number 第二个点的Y位置.
--- ```lua
--- u8g2.DrawLine(20, 5, 5, 32)
--- ```
function u8g2.DrawLine(x0, y0, x1, y1) end

--- 在x,y位置画一个半径为rad的空心圆.
---@param x0 number 圆心位置
---@param y0 number 圆心位置
---@param rad number 圆半径.
---@param opt number 选择圆的部分或全部. 默认全画 可选 u8g2.DRAW_UPPER_RIGHT  u8g2.DRAW_UPPER_LEFT  u8g2.DRAW_LOWER_LEFT  u8g2.DRAW_LOWER_RIGHT  u8g2.DRAW_ALL
--- ```lua
--- u8g2.DrawCircle(60,30,8,u8g2.DRAW_ALL)
--- ```
function u8g2.DrawCircle(x0, y0, rad, opt) end

--- 在x,y位置画一个半径为rad的实心圆.
---@param x0 number 圆心位置
---@param y0 number 圆心位置
---@param rad number 圆半径.
---@param opt number 选择圆的部分或全部. 默认全画 可选 u8g2.DRAW_UPPER_RIGHT  u8g2.DRAW_UPPER_LEFT  u8g2.DRAW_LOWER_LEFT  u8g2.DRAW_LOWER_RIGHT  u8g2.DRAW_ALL
--- ```lua
--- u8g2.DrawDisc(60,30,8,u8g2.DRAW_ALL)
--- ```
function u8g2.DrawDisc(x0, y0, rad, opt) end

--- 在x,y位置画一个半径为rad的空心椭圆.
---@param x0 number 圆心位置
---@param y0 number 圆心位置
---@param rx number 椭圆大小
---@param ry number 椭圆大小
---@param opt number 选择圆的部分或全部. 默认全画 可选 u8g2.DRAW_UPPER_RIGHT  u8g2.DRAW_UPPER_LEFT  u8g2.DRAW_LOWER_LEFT  u8g2.DRAW_LOWER_RIGHT  u8g2.DRAW_ALL
--- ```lua
--- u8g2.DrawEllipse(60,30,8,u8g2.DRAW_ALL)
--- ```
function u8g2.DrawEllipse(x0, y0, rx, ry, opt) end

--- 在x,y位置画一个半径为rad的实心椭圆.
---@param x0 number 圆心位置
---@param y0 number 圆心位置
---@param rx number 椭圆大小
---@param ry number 椭圆大小
---@param opt number 选择圆的部分或全部. 默认全画 可选 u8g2.DRAW_UPPER_RIGHT  u8g2.DRAW_UPPER_LEFT  u8g2.DRAW_LOWER_LEFT  u8g2.DRAW_LOWER_RIGHT  u8g2.DRAW_ALL
--- ```lua
--- u8g2.DrawFilledEllipse(60,30,8,15)
--- ```
function u8g2.DrawFilledEllipse(x0, y0, rx, ry, opt) end

--- 从x / y位置（左上边缘）开始绘制一个框（填充的框）.
---@param x number 左上边缘的X位置
---@param y number 左上边缘的Y位置
---@param w number 盒子的宽度
---@param h number 盒子的高度
--- ```lua
--- u8g2.DrawBox(3,7,25,15)
--- ```
function u8g2.DrawBox(x, y, w, h) end

--- 从x / y位置（左上边缘）开始绘制一个框（空框）.
---@param x number 左上边缘的X位置
---@param y number 左上边缘的Y位置
---@param w number 盒子的宽度
---@param h number 盒子的高度
--- ```lua
--- u8g2.DrawFrame(3,7,25,15)
--- ```
function u8g2.DrawFrame(x, y, w, h) end

--- 绘制一个从x / y位置（左上边缘）开始具有圆形边缘的填充框/框架.
---@param x number 左上边缘的X位置
---@param y number 左上边缘的Y位置
---@param w number 盒子的宽度
---@param h number 盒子的高度
---@param r number 四个边缘的半径
--- ```lua
--- u8g2.DrawRBox(3,7,25,15)
--- ```
function u8g2.DrawRBox(x, y, w, h, r) end

--- 绘制一个从x / y位置（左上边缘）开始具有圆形边缘的空框/框架.
---@param x number 左上边缘的X位置
---@param y number 左上边缘的Y位置
---@param w number 盒子的宽度
---@param h number 盒子的高度
---@param r number 四个边缘的半径
--- ```lua
--- u8g2.DrawRFrame(3,7,25,15)
--- ```
function u8g2.DrawRFrame(x, y, w, h, r) end

--- 绘制一个三角形（实心多边形）.
---@param x0 number 点0X位置
---@param y0 number 点0Y位置
---@param x1 number 点1X位置
---@param y1 number 点1Y位置
---@param x2 number 点2X位置
---@param y2 number 点2Y位置
--- ```lua
--- u8g2.DrawTriangle(20,5, 27,50, 5,32)
--- ```
function u8g2.DrawTriangle(x0, y0, x1, y1, x2, y2) end

--- 定义位图函数是否将写入背景色
---@param mode number mode字体模式，启用（1）或禁用（0）透明模式
--- ```lua
--- u8g2.SetBitmapMode(1)
--- ```
function u8g2.SetBitmapMode(mode) end

--- 绘制位图
---@param x number X坐标
---@param y number y坐标
---@param w number 位图宽
---@param h number 位图高
---@param data number 位图数据,每一位代表一个像素
--- ```lua
--- 取模使用PCtoLCD2002软件即可
--- 在(0,0)为左上角,绘制 16x16 "今" 的位图
--- u8g2.DrawXBM(0, 0, 16,16, string.char(
---     0x80,0x00,0x80,0x00,0x40,0x01,0x20,0x02,0x10,0x04,0x48,0x08,0x84,0x10,0x83,0x60,
---     0x00,0x00,0xF8,0x0F,0x00,0x08,0x00,0x04,0x00,0x04,0x00,0x02,0x00,0x01,0x80,0x00
--- ))
--- ```
function u8g2.DrawXBM(x, y, w, h, data) end

--- 缓冲区绘制QRCode
---@param x number x坐标
---@param y number y坐标
---@param str string 二维码的内容
---@param size number 显示大小 (注意:二维码生成大小与要显示内容和纠错等级有关,生成版本为1-40(对应 21x21 - 177x177)的不定大小,如果和设置大小不同会自动在指定的区域中间显示二维码,如二维码未显示请查看日志提示)
---@return nil #1 无返回值
function u8g2.DrawDrcode(x, y, str, size) end

--- 调整屏幕对比度
---@param contrast number 对比度（取值范围与IC有关，如st7567为0-63）
---@return nil #1 无返回值
function u8g2.SetContrast(contrast) end

--- 使用gtfont显示gb2312字符串
---@param str string str 显示字符串
---@param size number size 字体大小 (支持16-192号大小字体)
---@param x number x 横坐标
---@param y number y 竖坐标
--- ```lua
--- u8g2.drawGtfontGb2312("啊啊啊",32,0,0)
--- ```
function u8g2.drawGtfontGb2312(str, size, x, y) end

--- 使用gtfont显示UTF8字符串
---@param str string str 显示字符串
---@param size number size 字体大小 (支持16-192号大小字体)
---@param x number x 横坐标
---@param y number y 竖坐标
--- ```lua
--- u8g2.drawGtfontUtf8("啊啊啊",32,0,0)
--- ```
function u8g2.drawGtfontUtf8(str, size, x, y) end

--- 获取底层图像缓冲区
---@param buff userdata zbuff实例,空间要大于等于底层buff的大小
---@return number #1 成功返回buff大小,否则返回nil
--- ```lua
--- 本函数在u8g2初始化之后才能调用
--- 获取大小
--- local sz = u8g2.CopyBuffer()
--- 拷贝底层buff
--- local buff = zbuff.create(sz)
--- u8g2.CopyBuffer(buff)
--- ```
function u8g2.CopyBuffer(buff) end

--- 设置省电模式
---@param is_enable boolean 启用与否. true 启用, false禁用
---@return nil #1 无返回值
--- ```lua
--- 本API于2023.11.02新增
--- 开启省电
--- u8g2.SetPowerSave(true)
--- 关闭省电
--- u8g2.SetPowerSave(false)
--- ```
function u8g2.SetPowerSave(is_enable) end
