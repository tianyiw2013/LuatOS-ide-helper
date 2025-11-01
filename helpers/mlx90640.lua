mlx90640 = {}

--mlx90640.init(i2c_id,refresh_rate) (注意:2023.5.15之后使用此接口,用户需要自行初始化i2c接口) - 初始化MLX90640传感器
--传入值：
--int 传感器所在的i2c总线id或者软i2c对象,默认为0
--int 传感器的测量速率,默认为4Hz
--返回值：
--bool 成功返回true, 否则返回nil或者false
--例子：
--i2c.setup(i2cid,i2c_speed)
--if mlx90640.init(0,mlx90640.FPS4HZ) then
--    log.info("mlx90640", "init ok")
--    sys.wait(500) -- 稍等片刻
--    while 1 do
--        mlx90640.feed() -- 取一帧数据
--        mlx90640.draw2lcd(0, 0 ,1)-- 需提前把lcd初始化好
--        sys.wait(250) -- 默认是4HZ
--    end
--else
--    log.info("mlx90640", "init fail")
--end
function mlx90640.init(i2c_id,refresh_rate) end

--mlx90640.feed() - 取一帧数据
function mlx90640.feed() end

--mlx90640.raw_data() - 获取底层裸数据,浮点数矩阵
--返回值：
--table 浮点数数据,768个像素对应的温度值
function mlx90640.raw_data() end

--mlx90640.raw_point(index) - 获取单一点数据
--传入值：
--int 索引值(0-767)
--返回值：
--number 单点温度值
function mlx90640.raw_point(index) end

--mlx90640.ta_temp() - 获取外壳温度
--返回值：
--number 外壳温度
function mlx90640.ta_temp() end

--mlx90640.max_temp() - 获取最高温度
--返回值：
--number 最高温度
--number 最高温度位置
function mlx90640.max_temp() end

--mlx90640.min_temp() - 获取最低温度
--返回值：
--number 最低温度
--number 最低温度位置
function mlx90640.min_temp() end

--mlx90640.average_temp() - 获取平均温度
--返回值：
--number 平均温度
function mlx90640.average_temp() end

--mlx90640.get_vdd() - 获取vdd
--返回值：
--number vdd
function mlx90640.get_vdd() end

--mlx90640.draw2lcd(x, y, fold) - 绘制到lcd
--传入值：
--int 左上角x坐标
--int 左上角y坐标
--int 放大倍数,必须为2的指数倍(1,2,4,8,16...)默认为1
--返回值：
--bool 成功返回true,否则返回false
function mlx90640.draw2lcd(x,y,fold) end