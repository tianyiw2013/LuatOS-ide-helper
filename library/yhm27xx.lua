---@meta

--- LuatOS IDE Helper for module: yhm27xx
--- ```yaml
--- Summary: yhm27xx充电芯片
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/yhm27xx/binding/luat_lib_yhm27xx.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/yhm27xxx
--- Video: 
--- Tag: LUAT_USE_GPIO
--- ```
--- ```lua
--- 请查阅demo/yhm27xx
--- ```
yhm27xx = {}

--- 单总线命令读写YHM27XX
---@param pin number gpio端口号
---@param chip_id number 芯片ID
---@param reg number 寄存器地址
---@param data number 要写入的数据，如果没填，则表示从寄存器读取数据
---@return boolean #1 成功返回true,失败返回false
---@return number #2 读取成功返回寄存器值，写入成功无返回
--- ```lua
--- while 1 do
---     sys.wait(1000)
---     local result, data = yhm27xx.cmd(15, 0x04, 0x05)
---     log.info("yhm27xx", result, data)
--- end
--- ```
function yhm27xx.cmd(pin, chip_id, reg, data) end

--- 获取最新的寄存器信息(异步)
---@param pin number gpio端口号
---@param chip_id number 芯片ID
---@return nil #1 无返回值
--- ```lua
--- sys.subscribe("YHM27XX_REG", function(data)
--- 注意, 会一次性读出0-9,总共8个寄存器值
---   log.info("yhm27xx", data and data:toHex())
--- end)
--- yhm27xx.reqinfo(24, 0x04)
--- ```
function yhm27xx.reqinfo(pin, chip_id) end
