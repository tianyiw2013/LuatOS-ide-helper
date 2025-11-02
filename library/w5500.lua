---@meta

--- LuatOS IDE Helper for module: w5500
--- ```yaml
--- Summary: w5500以太网驱动
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/ethernet/w5500/luat_lib_w5500.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/w5500
--- Video: 
--- Tag: LUAT_USE_W5500
--- ```
w5500 = {}

--- 初始化w5500
---@param spiid number spi通道号, 例如 0, 1, 5, 按设备实际情况选
---@param speed number spi速度, 可以设置到对应SPI的最高速度
---@param cs_pin number cs pin, 片选脚, 对应W5500的SCS
---@param irq_pin number irq pin, 中断脚, 对应W5500的INT
---@param rst_pin number reset pin, 复位脚, 对应W5500的RST
---@param link_pin number link 状态 pin，可以留空不使用，默认不使用
--- ```lua
--- w5500.init(spi.SPI_0, 24000000, pin.PB13, pin.PC08, pin.PC09)
--- ```
function w5500.init(spiid, speed, cs_pin, irq_pin, rst_pin, link_pin) end

--- w5500配置网络信息
---@param ip string 静态ip地址，如果需要用DHCP获取，请写nil
---@param submask string 子网掩码，如果使用动态ip，则忽略
---@param gateway string 网关，如果使用动态ip，则忽略
---@param mac string MAC，写nil则通过MCU唯一码自动生成，如果要写，长度必须是6byte
---@param RTR number 重试间隔时间，默认2000，单位100us，不懂的不要改
---@param RCR number 最大重试次数，默认8，不懂的不要改
---@param speed number 速度类型，目前只有0硬件配置，1自适应，默认为0
--- ```lua
--- w5500.config("192.168.1.2", "255.255.255.0", "192.168.1.1", string.fromHex("102a3b4c5d6e"))
--- ```
function w5500.config(ip, submask, gateway, mac, RTR, RCR, speed) end

--- 将w5500注册进通用网络接口
---@param id number 通用网络通道号
--- ```lua
--- 若使用的版本不带socket库, 改成 network.ETH0
--- w5500.bind(socket.ETH0)
--- ```
function w5500.bind(id) end

--- 获取w5500当前的MAC，必须在init之后用，如果config中设置了自己的MAC，需要延迟一点时间再读
---@return string #1 当前的MAC
--- ```lua
--- local mac = w5500.getMac()
--- log.info("w5500 mac", mac:toHex())
--- ```
function w5500.getMac() end
