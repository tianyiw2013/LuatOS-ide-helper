---@meta

--- LuatOS IDE Helper for module: pins
--- ```yaml
--- Summary: 管脚外设复用
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/pins/binding/luat_lib_pins.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/pins
--- Video: 
--- Tag: @tag LUAT_USE_PINS
--- ```
--- ```lua
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 请使用LuaTools的可视化工具进行配置,你通常不需要使用这个demo
--- 本库的API属于高级用法, 仅动态配置管脚时使用
--- 本库的API属于高级用法, 仅动态配置管脚时使用
--- 本库的API属于高级用法, 仅动态配置管脚时使用
--- ```
pins = {}

--- 当某种外设允许复用在不同引脚上时，指定某个管脚允许复用成某种外设功能，需要在外设启用前配置好，外设启用时起作用。
---@param pin number 管脚物理编号, 对应模组俯视图下的顺序编号, 例如 67, 68
---@param func string 功能说明, 例如 "GPIO18", "UART1_TX", "UART1_RX", "SPI1_CLK", "I2C1_CLK", 目前支持的外设有"UART","I2C","SPI","PWM","CAN","GPIO","ONEWIRE"
---@return boolean #1 配置成功,返回true, 其他情况均返回false, 并在日志中提示失败原因
--- ```lua
--- 把air780epm的PIN67脚,做GPIO 18用
--- pins.setup(67, "GPIO18")
--- 把air780epm的PIN55脚,做uart2 rx用
--- pins.setup(55, "UART2_RXD")
--- 把air780epm的PIN56脚,做uart2 tx用
--- pins.setup(56, "UART2_TXD")
--- ```
function pins.setup(pin, func) end

--- 将对应管脚变成高阻或者输入，不对外输出
---@param pin number 管脚物理编号, 对应模组俯视图下的顺序编号, 例如 67, 68
---@return boolean #1 配置成功,返回true, 其他情况均返回false, 并在日志中提示失败原因
--- ```lua
--- 把air780epm的PIN67脚关闭掉
--- pins.close(67)
--- ```
function pins.close(pin) end

--- 加载硬件配置
---@param path string path, 配置文件路径, 可选, 默认值是 /luadb/pins.json
---@return boolean #1 成功返回true, 失败返回nil, 并在日志中提示失败原因
---@return number #2 失败返回错误码, 成功返回0
--- ```lua
--- ，如果存在/luadb/pins_$model.json 就自动加载
--- 其中的 $model是型号, 例如 Air780EPM, 默认加载的是 luadb/pins_Air780EPM.json
--- 以下是自行加载配置的例子, 一般用不到
--- pins.loadjson("/my.json")
--- ```
function pins.loadjson(path) end

--- 调试模式
---@param mode boolean 是否开启调试模式, 默认是关闭的, 打开之后日志多很多
---@return nil #1 无返回值
--- ```lua
--- pins.debug(true)
--- ```
function pins.debug(mode) end
