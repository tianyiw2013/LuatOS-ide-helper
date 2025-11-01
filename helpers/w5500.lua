w5500 = {}

--w5500.init(spiid, speed, cs_pin, irq_pin, rst_pin, link_pin) - 初始化w5500
--传入值：
--int spi通道号, 例如 0, 1, 5, 按设备实际情况选
--int spi速度, 可以设置到对应SPI的最高速度
--int cs pin, 片选脚, 对应W5500的SCS
--int irq pin, 中断脚, 对应W5500的INT
--int reset pin, 复位脚, 对应W5500的RST
--int link 状态 pin，可以留空不使用，默认不使用
--例子：
--w5500.init(spi.SPI_0, 24000000, pin.PB13, pin.PC08, pin.PC09)
function w5500.init(spiid,speed,cs_pin,irq_pin,rst_pin,link_pin) end

--w5500.config(ip, submask, gateway, mac, RTR, RCR, speed) - w5500配置网络信息
--传入值：
--string 静态ip地址，如果需要用DHCP获取，请写nil
--string 子网掩码，如果使用动态ip，则忽略
--string 网关，如果使用动态ip，则忽略
--string MAC，写nil则通过MCU唯一码自动生成，如果要写，长度必须是6byte
--int 重试间隔时间，默认2000，单位100us，不懂的不要改
--int 最大重试次数，默认8，不懂的不要改
--int 速度类型，目前只有0硬件配置，1自适应，默认为0
--例子：
--w5500.config("192.168.1.2", "255.255.255.0", "192.168.1.1", string.fromHex("102a3b4c5d6e"))
function w5500.config(ip,submask,gateway,mac,RTR,RCR,speed) end

--w5500.bind(id) - 将w5500注册进通用网络接口
--传入值：
--int 通用网络通道号
--例子：
---- 若使用的版本不带socket库, 改成 network.ETH0
--w5500.bind(socket.ETH0)
function w5500.bind(id) end

--w5500.getMac() - 获取w5500当前的MAC，必须在init之后用，如果config中设置了自己的MAC，需要延迟一点时间再读
--返回值：
--string 当前的MAC
--例子：
--local mac = w5500.getMac()
--log.info("w5500 mac", mac:toHex())
function w5500.getMac() end