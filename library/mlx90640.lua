---@meta

--- LuatOS IDE Helper for module: mlx90640
--- ```yaml
--- Summary: 红外测温(MLX90640)
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/mlx90640-library/luat_lib_mlx90640.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_MLX90640
--- ```
mlx90640 = {}

--- FPS1HZ (number)
mlx90640.FPS1HZ = 0

--- FPS2HZ (number)
mlx90640.FPS2HZ = 0

--- FPS4HZ (number)
mlx90640.FPS4HZ = 0

--- FPS8HZ (number)
mlx90640.FPS8HZ = 0

--- FPS16HZ (number)
mlx90640.FPS16HZ = 0

--- FPS32HZ (number)
mlx90640.FPS32HZ = 0

--- FPS64HZ (number)
mlx90640.FPS64HZ = 0

--- 初始化MLX90640传感器
---@param i2c_id number 传感器所在的i2c总线id或者软i2c对象,默认为0
---@param refresh_rate number 传感器的测量速率,默认为4Hz
---@return boolean #1 成功返回true, 否则返回nil或者false
--- ```lua
--- i2c.setup(i2cid,i2c_speed)
--- if mlx90640.init(0,mlx90640.FPS4HZ) then
---     log.info("mlx90640", "init ok")
---     sys.wait(500) -- 稍等片刻
---     while 1 do
---         mlx90640.feed() -- 取一帧数据
---         mlx90640.draw2lcd(0, 0 ,1)-- 需提前把lcd初始化好
---         sys.wait(250) -- 默认是4HZ
---     end
--- else
---     log.info("mlx90640", "init fail")
--- end
--- ```
function mlx90640.init(i2c_id, refresh_rate) end

--- 取一帧数据
function mlx90640.feed() end

--- 获取底层裸数据,浮点数矩阵
---@return table #1 浮点数数据,768个像素对应的温度值
function mlx90640.raw_data() end

--- 获取单一点数据
---@param index number 索引值(0-767)
---@return number #1 单点温度值
function mlx90640.raw_point(index) end

--- 获取外壳温度
---@return number #1 外壳温度
function mlx90640.ta_temp() end

--- 获取最高温度
---@return number #1 最高温度
---@return number #2 最高温度位置
function mlx90640.max_temp() end

--- 获取最低温度
---@return number #1 最低温度
---@return number #2 最低温度位置
function mlx90640.min_temp() end

--- 获取平均温度
---@return number #1 平均温度
function mlx90640.average_temp() end

--- 获取vdd
---@return number #1 当前vdd
function mlx90640.get_vdd() end

--- 绘制到lcd
---@param x number 左上角x坐标
---@param y number 左上角y坐标
---@param fold number 放大倍数,必须为2的指数倍(1,2,4,8,16...)默认为1
---@return boolean #1 成功返回true,否则返回false
function mlx90640.draw2lcd(x, y, fold) end
