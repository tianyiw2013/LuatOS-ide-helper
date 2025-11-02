---@meta

--- LuatOS IDE Helper for module: mobile
--- ```yaml
--- Summary: 蜂窝网络
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/mobile/luat_lib_mobile.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/mobile
--- Video: 
--- Tag: LUAT_USE_MOBILE
--- ```
--- ```lua
--- 简单演示
--- log.info("imei", mobile.imei())
--- log.info("imsi", mobile.imsi())
--- local sn = mobile.sn()
--- if sn then
---     log.info("sn",   sn:toHex())
--- end
--- log.info("muid", mobile.muid())
--- log.info("iccid", mobile.iccid())
--- log.info("csq", mobile.csq())
--- log.info("rssi", mobile.rssi())
--- log.info("rsrq", mobile.rsrq())
--- log.info("rsrp", mobile.rsrp())
--- log.info("snr", mobile.snr())
--- log.info("simid", mobile.simid())
--- ```
mobile = {}

--- 未注册 (number)
mobile.UNREGISTER = 0

--- 已注册 (number)
mobile.REGISTERED = 0

--- 正在搜索中 (number)
mobile.SEARCH = 0

--- 注册被拒绝 (number)
mobile.DENIED = 0

--- 未知 (number)
mobile.UNKNOW = 0

--- 已注册,漫游 (number)
mobile.REGISTERED_ROAMING = 0

--- 已注册,仅SMS (number)
mobile.SMS_ONLY_REGISTERED = 0

--- 已注册,漫游,仅SMS (number)
mobile.SMS_ONLY_REGISTERED_ROAMING = 0

--- 已注册,紧急服务 (number)
mobile.EMERGENCY_REGISTERED = 0

--- 已注册,非主要服务 (number)
mobile.CSFB_NOT_PREFERRED_REGISTERED = 0

--- 已注册,非主要服务,漫游 (number)
mobile.CSFB_NOT_PREFERRED_REGISTERED_ROAMING = 0

--- 小区重选信号差值门限,需要飞行模式设置 (number)
mobile.CONF_RESELTOWEAKNCELL = 0

--- 网络静态模式优化,需要飞行模式设置 (number)
mobile.CONF_STATICCONFIG = 0

--- 网络切换以信号质量优先,需要飞行模式设置,0不开,1开启,2开启并加速切换,功耗会增加 (number)
mobile.CONF_QUALITYFIRST = 0

--- LTE跳paging,需要飞行模式设置,谨慎使用,0是不设置,1~7增大或减小DrxCycle周期倍数,1:1/8倍 2:1/4倍 3:1/2倍 4:2倍 5:4倍 6:8倍 7:16倍,8~12配置固定的DrxCycle周期,仅当该周期大于网络分配的DrxCycle周期时该配置才会生效,8:320ms 9:640ms 10:1280ms 11:2560ms 12:5120ms (number)
mobile.CONF_USERDRXCYCLE = 0

--- PSM模式中的T3324时间,单位S (number)
mobile.CONF_T3324MAXVALUE = 0

--- PSM模式开关,0关,1开 (number)
mobile.CONF_PSM_MODE = 0

--- attach模式，0为EPS ONLY 2为混合，遇到IMSI detach脱网问题，设置为0，注意设置为EPS ONLY时会取消短信功能 (number)
mobile.CONF_CE_MODE = 0

--- SIM写入次数的配置和读取 (number)
mobile.CONF_SIM_WC_MODE = 0

--- 伪基站禁止接入的时间，取值为0时取消，0xffff永久 (number)
mobile.CONF_FAKE_CELL_BARTIME = 0

--- 删除已保存的协议栈参数，重启后会使用默认配置 (number)
mobile.CONF_RESET_TO_FACTORY = 0

--- 蜂窝网络模块的usb以太网卡控制，bit0开关，1开0关，bit1模式，1NAT0独立IP(在usb以太网卡开启前可以修改，开启过就不行)，bit2协议1ECM,0RNDIS，飞行模式里设置 (number)
mobile.CONF_USB_ETHERNET = 0

--- 关闭邻区测量 1关，0开，除了功耗测试外不建议使用 (number)
mobile.CONF_DISABLE_NCELL_MEAS = 0

--- 设置最大发射功率，0~23，必须在每次RRC=1时调用，RRC=0后会自动清除配置 (number)
mobile.CONF_MAX_TX_POWER = 0

--- 验证PIN码操作 (number)
mobile.PIN_VERIFY = 0

--- 更换PIN码操作 (number)
mobile.PIN_CHANGE = 0

--- 使能PIN码验证 (number)
mobile.PIN_ENABLE = 0

--- 关闭PIN码验证 (number)
mobile.PIN_DISABLE = 0

--- 解锁PIN码 (number)
mobile.PIN_UNBLOCK = 0

--- 获取IMEI
---@param index number 编号,默认0. 在支持双卡的模块上才会出现0或1的情况
---@return string #1 当前的IMEI值,若失败返回nil
function mobile.imei(index) end

--- 获取IMSI
---@param index number 编号,默认0. 在支持双卡的模块上才会出现0或1的情况
---@return string #1 当前的IMSI值,若失败返回nil
function mobile.imsi(index) end

--- 获取SN
---@return string #1 当前的SN值,若失败返回nil. 注意, SN可能包含不可见字符
--- ```lua
--- 注意, 出厂未必有写SN
--- 一般用途的唯一id, 可以用mobile.imei()代替
--- 如需要真正的唯一ID, 使用 mcu.unique_id()
--- ```
function mobile.sn() end

--- 获取MUID
---@return string #1 当前的MUID值,若失败返回nil
function mobile.muid() end

--- 获取或设置ICCID
---@param id number SIM卡的编号, 例如0, 1, 默认0
---@return string #1 ICCID值,若失败返回nil
function mobile.iccid(id) end

--- 获取手机卡号，注意，只有写入了手机号才能读出，因此有可能读出来是空的
---@param id number SIM卡的编号, 例如0, 1, 默认0
---@return string #1 number值,若失败返回nil
function mobile.number(id) end

--- 获取当前SIM卡槽,或者切换卡槽
---@param id number SIM卡的编号, 例如0, 1, 如果支持双卡，例如Air780EXXX，可以填2来自适应，但是会占用掉4个IO(gpio4/5/6/23)。如果不填就直接读取当前卡槽
---@return number #1 当前sim卡槽编号,若失败返回-1
--- ```lua
--- mobile.simid(0) -- 固定使用SIM0
--- mobile.simid(1) -- 固件使用SIM1
--- mobile.simid(2) -- 自动识别SIM0, SIM1, 优先级看具体平台
--- mobile.simid(2, true) -- -- 自动识别SIM0, SIM1, 且SIM0优先
--- 提醒, 自动识别是会增加时间的
--- ```
function mobile.simid(id) end

--- 检测当前SIM卡是否准备好，对SIM卡的PIN码做相关操作
---@param id number SIM卡的编号, 例如0, 1, 支持双卡双待的才需要选择
---@param operation number PIN码操作类型，只能是mobile.PIN_XXXX，不操作就留空
---@param pin1 string 更换pin时操作的pin码，或者验证操作的pin码，或者解锁pin码时的PUK，4~8字节
---@param pin2 string 更换pin码操作时的新的pin码，解锁pin码时的新PIN，4~8字节
---@return boolean #1 当无PIN操作时，返回SIM卡是否准备好，有PIN操作时，返回是否成功
--- ```lua
--- local cpin_is_ready = mobile.simPin() -- 当前sim卡是否准备好，一般返回false就是没卡
--- local succ = mobile.simPin(0, mobile.PIN_VERIFY, "1234")    -- 输入pin码验证
--- ```
function mobile.simPin(id, operation, pin1, pin2) end

--- 设置RRC自动释放时间间隔，当开启时后，遇到极弱信号+频繁数据操作可能会引起网络严重故障，因此需要额外设置自动重启协议栈
---@param time number RRC自动释放时间，等同于Air724的AT+RTIME，单位秒，写0或者不写则是停用，不要超过20秒，没有意义
---@param auto_reset_stack boolean 网络遇到严重故障时尝试自动恢复，和飞行模式/SIM卡切换冲突，true开启，false关闭，留空时，如果设置了时间则自动开启。本参数于2023年9月14日已废弃
---@param data_first boolean 是否启用数据传输优化，true启用，false关闭，留空为false，开启后必须等到TCP数据ACK或者超时失败，或者socket CONNECT完成（无论成功或者失败）才允许RRC提前释放，可能会增加功耗。本参数于2024年8月12日启用
---@return nil #1 无返回值
--- ```lua
--- mobile.rtime(3)    --与基站无数据交互3秒后提前释放RRC
--- mobile.rtime(3,nil,true) --启用数据传输优化，与基站无数据交互3秒后，提前释放RRC
--- ```
function mobile.rtime(time, auto_reset_stack, data_first) end

--- 设置一些辅助周期性或者自动功能，目前支持SIM卡暂时脱离后恢复，周期性获取小区信息，网络遇到严重故障时尝试自动恢复
---@param check_sim_period number SIM卡自动恢复时间，单位毫秒，建议5000~10000，和飞行模式/SIM卡切换冲突，不能再同一时间使用，必须错开执行。写0或者不写则是关闭功能
---@param get_cell_period number 周期性获取小区信息的时间间隔，单位毫秒。获取小区信息会增加部分功耗。写0或者不写则是关闭功能
---@param search_cell_time number 每次搜索小区时最大搜索时间，单位秒。不要超过8秒
---@param auto_reset_stack boolean 网络遇到严重故障时尝试自动恢复，和飞行模式/SIM卡切换冲突，true开启，false关闭，开始状态是false，留空则不做改变
---@param network_check_period number 设置定时检测网络是否正常并且在检测到长时间无网时通过重启协议栈来恢复，无网恢复时长，单位ms，建议60000以上，为网络搜索网络保留足够的时间，留空则不做更改
---@return nil #1 无返回值
function mobile.setAuto(check_sim_period, get_cell_period, search_cell_time, auto_reset_stack, network_check_period) end

--- 获取或设置APN，设置APN必须在入网前就设置好，比如在SIM卡识别完成前就设置好
---@param index number 编号,默认0. 在支持双卡的模块上才会出现0或1的情况
---@param cid number cid, 默认0，如果要用非默认APN来激活，必须>0
---@param new_apn_name string 新的APN,不填就是获取APN, 填了就是设置APN, 是否支持设置取决于底层实现
---@param user_name string 新的APN的username,如果APN不是空,那必须填写,如果没有留个空字符串""。如果APN是空的，那可以nil
---@param password string 新的APN的password,如果APN不是空,那必须填写,如果没有留个空字符串""。如果APN是空的，那可以nil
---@param ip_type number 激活APN时的IP TYPE,1=IPV4 2=IPV6 3=IPV4V6,默认是1
---@param protocol number 激活APN时,如果需要username和password,就要写鉴权协议类型,1~3,默认3,代表1和2都尝试一下。不需要鉴权的写0
---@param is_del boolean 是否删除APN,true是,其他都否,只有参数3新的APN不是string的时候才有效果
---@return string #1 如果网络注册成功，返回注册用的APN值，反之是nil。设置好不会立刻有返回值，需要等网络注册成功
--- ```lua
--- 注意, 在国内, 公网卡基本上都不需要设置APN, 专网卡才需要设置
--- mobile.apn(0,1,"cmiot","","",nil,0)
--- 专网卡设置的demo，name，user，password联系卡商获取
--- 设置后, 再次立即获取, 并不会返回设置的值, 要等联网成功 - 设置好不会立刻有返回值，需要等网络注册成功
--- mobile.apn(0,1,"name","user","password",nil,3)
--- ```
function mobile.apn(index, cid, new_apn_name, user_name, password, ip_type, protocol, is_del) end

--- 是否默认开启IPV6功能，必须在LTE网络连接前就设置好
---@param onff boolean 开关 true开启 false 关闭
---@return boolean #1 true 当前是开启的，false 当前是关闭的
--- ```lua
--- 注意, 开启ipv6后, 开机联网会慢2~3秒
--- ```
function mobile.ipv6(onff) end

--- 获取csq
---@return number #1 当前CSQ值, 若失败返回0. 范围 0 - 31, 越大越好
--- ```lua
--- 注意, 4G模块的CSQ值仅供参考, rsrp/rsrq才是真正的信号强度指标
--- ```
function mobile.csq() end

--- 获取rssi
---@return number #1 当前rssi值,若失败返回0. 范围 0 到 -114, 越小越好
function mobile.rssi() end

--- 获取rsrp,参考信号接收功率
---@return number #1 当前rsrp值,若失败返回0. 取值范围: -44 ~ -140 ，值越大越好
function mobile.rsrp() end

--- 获取rsrq,参考信号发送功率
---@return number #1 当前rsrq值,若失败返回0.  取值范围: -3 ~ -19.5 ，值越大越好
function mobile.rsrq() end

--- 获取snr,信噪比
---@return number #1 当前snq值,若失败返回0.范围 0 - 30, 越大越好
function mobile.snr() end

--- 获取当前服务小区的ECI(E-UTRAN Cell Identifier)
---@return number #1 当前eci值,若失败返回-1
function mobile.eci() end

--- 获取当前服务小区的TAC或者LAC
---@return number #1 当前eci值,若失败返回-1. 如果尚未注册到网络,会返回0
--- ```lua
--- 本API于 2023.7.9 新增
--- ```
function mobile.tac() end

--- 获取当前服务小区的eNBID(eNodeB Identifier)
---@return number #1 当前enbid值,若失败返回-1
function mobile.enbid() end

--- 获取当前服务小区更详细的信息
---@return table #1 服务小区的信息
--- ```lua
--- 本API于 2024.9.12 新增
--- log.info("cell", json.encode(mobile.scell()))
--- 返回值示例
--- {
---     "mnc": 11,
---     "mcc": 460,
---     "rssi": -78,
---     "pci": 115,
---     "rsrp": -107,
---     "tac": 30005,
---     "eci": 124045360,
---     "cid": 124045360,
---     "rsrq": -9,
---     "snr": 15,
---     "earfcn": 1850
--- }
--- ```
function mobile.scell() end

--- 进出飞行模式
---@param index number 编号,默认0. 在支持双卡的模块上才会出现0或1的情况
---@param enable boolean 是否设置为飞行模式,true为设置, false为退出,可选
---@return boolean #1 原飞行模式的状态
function mobile.flymode(index, enable) end

--- 配置基站同步时间开关，默认开启
---@param enable boolean 开启,true开启, false关闭, nil不设置
---@return boolean #1 当前开关状态
--- ```lua
--- mobile.syncTime() --获取当前开关状态
--- mobile.syncTime(false) --关闭基站同步时间
--- ```
function mobile.syncTime(enable) end

--- 获取网络状态
---@return number #1 当前网络状态
--- ```lua
--- 状态描述
--- 0:网络未注册
--- 1:网络已注册
--- 2:正在搜网中
--- 3:网络注册被拒绝
--- 4:网络状态未知
--- 5:漫游,且已注册
--- 6:仅SMS可用
--- 7:仅SMS可用,且漫游状态
--- 8:仅紧急呼叫. 注意, 国内不支持此状态,模块也不支持紧急呼叫
--- 当不是1或者5的时候，无法通过蜂窝移动网络上网
--- 不能使用本API判断联网状态, 可联网状态应该以连上目标服务器为准
--- ```
function mobile.status() end

--- 获取基站信息
---@return table #1 包含基站数据的数组
--- ```lua
--- 注意: 从2023.06.20开始, 需要主动请求一次reqCellInfo才会有基站数据.
--- 示例输出(原始数据是table, 下面是json格式化后的内容)
--- [[
--- [
---     {"rsrq":-10,"rssi":-55,"cid":124045360,"mnc":17,"pci":115,"earfcn":1850,"snr":15,"rsrp":-85,"mcc":1120,"tdd":0},
---     {"pci":388,"rsrq":-11,"mnc":17,"earfcn":2452,"snr":5,"rsrp":-67,"mcc":1120,"cid":124045331},
---     {"pci":100,"rsrq":-9,"mnc":17,"earfcn":75,"snr":17,"rsrp":-109,"mcc":1120,"cid":227096712}
--- ]
--- ]]
--- mobile.reqCellInfo(60)
--- 订阅
--- sys.subscribe("CELL_INFO_UPDATE", function()
---     log.info("cell", json.encode(mobile.getCellInfo()))
--- end)
--- 定期轮训式
--- sys.taskInit(function()
---     sys.wait(3000)
---     while 1 do
---         mobile.reqCellInfo(15)
---         sys.waitUntil("CELL_INFO_UPDATE", 15000)
---         log.info("cell", json.encode(mobile.getCellInfo()))
---     end
--- end)
--- ```
function mobile.getCellInfo() end

--- 发起基站信息查询,含临近小区
---@param timeout number 超时时长,单位秒,默认15. 最少5, 最高60
---@return nil #1 无返回值
--- ```lua
--- 参考 mobile.getCellInfo 函数
--- ```
function mobile.reqCellInfo(timeout) end

--- 锁定/解锁小区，仅用于外场测试，没接触过的，或者生产环境中请勿使用
---@param mode number 操作码 0删除优先的频点，1设置优先频点，2锁定小区，3解锁小区
---@param earfcn number 下行频点
---@param pci number phycellid
---@return boolean #1 成功true 失败false
--- ```lua
--- mobile.lockCell(2,1860,32)    --锁定小区
--- mobile.lockCell(3)            --解锁小区
--- ```
function mobile.lockCell(mode, earfcn, pci) end

--- 重启协议栈
---@return nil #1 无返回值
--- ```lua
--- 重启LTE协议栈
--- mobile.reset()
--- ```
function mobile.reset() end

--- 数据量流量处理
---@param clearUplink boolean 清空上行流量累计值，true清空，其他忽略
---@param clearDownlink boolean 清空下行流量累计值，true清空，其他忽略
---@return number #1 上行流量GB
---@return number #2 上行流量B
---@return number #3 下行流量GB
---@return number #4 下行流量B
--- ```lua
--- 获取上下行流量累计值
--- 上行流量值Byte = uplinkGB * 1024 * 1024 * 1024 + uplinkB
--- 下行流量值Byte = downlinkGB * 1024 * 1024 * 1024 + downlinkB
--- local uplinkGB, uplinkB, downlinkGB, downlinkB = mobile.dataTraffic()
--- 清空上下行流量累计值
--- mobile.dataTraffic(true, true)
--- 仅记录开机后的流量,复位/重启会归零
--- ```
function mobile.dataTraffic(clearUplink, clearDownlink) end

--- 网络特殊配置
---@param item number 配置项目，看mobile.CONF_XXX
---@param value number 配置值,根据具体配置的item决定
---@return boolean #1 是否成功
--- ```lua
--- 针对不同平台有不同的配置，谨慎使用，目前只有Air780EXXX系列支持
--- Air780EXXX配置小区重选信号差值门限，不能大于15dbm，必须在飞行模式下才能用
--- mobile.flymode(0,true)
--- mobile.config(mobile.CONF_RESELTOWEAKNCELL, 15)
--- mobile.config(mobile.CONF_STATICCONFIG, 1) --开启网络静态优化
--- mobile.flymode(0,false)
--- Air780EXXX设置SIM写入次数的统计
--- 关闭统计
--- mobile.config(mobile.CONF_SIM_WC_MODE, 0)
--- 开启统计, 默认也是开启的.
--- mobile.config(mobile.CONF_SIM_WC_MODE, 1)
--- 读取统计值,异步, 需要通过系统消息SIM_IND获取
--- sys.subscribe("SIM_IND", function(stats, value)
---     log.info("SIM_IND", stats)
---     if stats == "SIM_WC" then
---         log.info("sim", "write counter", value)
---     end
--- end)
--- mobile.config(mobile.CONF_SIM_WC_MODE, 2)
--- 清空统计值
--- mobile.config(mobile.CONF_SIM_WC_MODE, 3)
--- ```
function mobile.config(item, value) end

--- 获取当前使用/支持的band
---@param band zbuff 输出band
---@param is_default boolean true默认支持，false当前支持的，默认是false，当前是预留功能，不要写true
---@return boolean #1 成功返回true，失败放回false
--- ```lua
--- local buff = zbuff.create(40)
--- mobile.getBand(buff) --输出当前使用的band，band号放在buff内，buff[0]，buff[1]，buff[2] .. buff[buff:used() - 1]
--- log.info("当前使用的band:")
--- 轮训方式打印所用band
--- for i=0,band:used()-1 do
---     log.info("band", band[i])
--- end
--- ```
function mobile.getBand(band, is_default) end

--- 设置使用的band
---@param band zbuff 输入使用的band
---@param num number band数量
---@return boolean #1 成功返回true，失败放回false
--- ```lua
--- local buff = zbuff.create(40)
--- buff[0] = 3
--- buff[1] = 5
--- buff[2] = 8
--- buff[3] = 40
--- mobile.setBand(buff, 4) --设置使用的band一共4个，为3,5,8,40
--- ```
function mobile.setBand(band, num) end

--- RF测试开关和配置
---@param onoff boolean true开启测试模式，false关闭
---@param uart_id number 串口号
---@return nil #1 无返回值
--- ```lua
--- mobile.nstOnOff(true, uart.VUART_0)    --打开测试模式，并且用虚拟串口发送结果
--- mobile.nstOnOff(false) --关闭测试模式
--- ```
function mobile.nstOnOff(onoff, uart_id) end

--- RF测试数据输入
---@param data string or zbuff 用户从串口获取的数据，注意，当获取完所有数据后，需要再传一个nil来作为传输结束
---@return nil #1 无返回值
--- ```lua
--- mobile.nstInput(uart_data)
--- mobile.nstInput(nil)
--- ```
function mobile.nstInput(data) end

--- 初始化内置默认虚拟卡功能(不可用)
---@return nil #1 无返回值
--- ```lua
--- mobile.vsimInit()
--- ```
function mobile.vsimInit() end

--- 切换内置虚拟卡和外置实体卡，2024年8月13日启用，虚拟卡需要固件支持，否则切换后无网络，需要在飞行模式下切换，或者切换后重启协议栈
---@param enable boolean 开启,true开启, false关闭
---@return nil #1 无返回值
--- ```lua
--- mobile.vsimOnOff(true) --使用内置虚拟卡
--- mobile.vsimOnOff(false) --使用外置实体卡
--- ```
function mobile.vsimOnOff(enable) end

--- 初始化自定义APN列表，主要用于海外SIM卡
---@return nil #1 无返回值
--- ```lua
--- mobile.apnTableInit()
--- ```
function mobile.apnTableInit() end

--- 往自定义APN列表添加一条APN信息，主要用于海外SIM卡
---@param mcc number MCC码,16进制BCD码
---@param mnc number MNC码,16进制BCD码
---@param ip_type number 激活APN时的IP TYPE,1=IPV4 2=IPV6 3=IPV4V6,默认是1
---@param protocol number 激活APN时,如果需要username和password,就要写鉴权协议类型,1~3,默认3,代表1和2都尝试一下。不需要鉴权的写0
---@param apn_name string APN name,不能为空
---@param user_name string APN的username
---@param password string APN的password
---@return nil #1 无返回值
--- ```lua
--- mobile.apnTableInit() -- 先初始化，必须放在SIM卡识别完成前加入，最好就是写在开头
--- mobile.apnTableAdd(0x460,0x00,3,0,"cmiot","","") -- 单独添加一条APN信息，必须放在SIM卡识别完成前加入，最好就是写在开头，移动公网卡设置APN为cmiot（一般不用设置，这里只是举个例子）
--- ```
function mobile.apnTableAdd(mcc, mnc, ip_type, protocol, apn_name, user_name, password) end

--- 打印自定义APN列表里的一条信息，在没有拿到卡的情况下，测试一下对应的APN信息是否和运营商提供的匹配
---@param mcc number MCC码,16进制BCD码
---@param mnc number MNC码,16进制BCD码
---@return nil #1 无返回值
--- ```lua
--- mobile.apnTableInit()
--- mobile.apnTablePrint(0x202, 0x01)
--- ```
function mobile.apnTablePrint(mcc, mnc) end
