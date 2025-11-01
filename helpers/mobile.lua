mobile = {}

--mobile.imei(index) - 获取IMEI
--传入值：
--int 编号,默认0. 在支持双卡的模块上才会出现0或1的情况
--返回值：
--string 当前的IMEI值,若失败返回nil
function mobile.imei(index) end

--mobile.imsi(index) - 获取IMSI
--传入值：
--int 编号,默认0. 在支持双卡的模块上才会出现0或1的情况
--返回值：
--string 当前的IMSI值,若失败返回nil
function mobile.imsi(index) end

--mobile.sn() - 获取SN
--返回值：
--string 当前的SN值,若失败返回nil. 注意, SN可能包含不可见字符
--例子：
---- 注意, 出厂未必有写SN
---- 一般用途的唯一id, 可以用mobile.imei()代替
---- 如需要真正的唯一ID, 使用 mcu.unique_id()
function mobile.sn() end

--mobile.muid() - 获取MUID
--返回值：
--string 当前的MUID值,若失败返回nil
function mobile.muid() end

--mobile.iccid(id) - 获取或设置ICCID
--传入值：
--int SIM卡的编号, 例如0, 1, 默认0
--返回值：
--string ICCID值,若失败返回nil
function mobile.iccid(id) end

--mobile.number(id) - 获取手机卡号，注意，只有写入了手机号才能读出，因此有可能读出来是空的
--传入值：
--int SIM卡的编号, 例如0, 1, 默认0
--返回值：
--string number值,若失败返回nil
function mobile.number(id) end

--mobile.simid(id) - 获取当前SIM卡槽,或者切换卡槽
--传入值：
--int SIM卡的编号, 例如0, 1, 如果支持双卡，比如EC618，可以填2来自适应，但是会占用掉4个IO(gpio4/5/6/23)。如果不填就直接读取当前卡槽
--boolean 是否优先用SIM0，只有SIM卡编号写2自适应才有用！！！。true优先用SIM0，false则由具体平台决定，支持双卡双待SIM0优先，不支持的是上一次检测到的优先，默认是false，必须在开机就配置，否则就无效了
--返回值：
--int 当前sim卡槽编号,若失败返回-1
--例子：
--mobile.simid(0) -- 固定使用SIM0
--mobile.simid(1) -- 固件使用SIM1
--mobile.simid(2) -- 自动识别SIM0, SIM1, 优先级看具体平台
--mobile.simid(2, true) -- -- 自动识别SIM0, SIM1, 且SIM0优先
---- 提醒, 自动识别是会增加时间的
function mobile.simid(id) end

--mobile.simPin(id,operation,pin1,pin2) - 检测当前SIM卡是否准备好，对SIM卡的PIN码做相关操作
--传入值：
--int SIM卡的编号, 例如0, 1, 支持双卡双待的才需要选择
--int PIN码操作类型，只能是mobile.PIN_XXXX，不操作就留空
--string 更换pin时操作的pin码，或者验证操作的pin码，或者解锁pin码时的PUK，4~8字节
--string 更换pin码操作时的新的pin码，解锁pin码时的新PIN，4~8字节
--返回值：
--boolean 当无PIN操作时，返回SIM卡是否准备好，有PIN操作时，返回是否成功
--例子：
--local cpin_is_ready = mobile.simPin() -- 当前sim卡是否准备好，一般返回false就是没卡
--local succ = mobile.simPin(0, mobile.PIN_VERIFY, "1234")    -- 输入pin码验证
function mobile.simPin(id,operation,pin1,pin2) end

--mobile.rtime(time, auto_reset_stack, data_first) - 设置RRC自动释放时间间隔，当开启时后，遇到极弱信号+频繁数据操作可能会引起网络严重故障，因此需要额外设置自动重启协议栈
--传入值：
--int RRC自动释放时间，等同于Air724的AT+RTIME，单位秒，写0或者不写则是停用，不要超过20秒，没有意义
--boolean 网络遇到严重故障时尝试自动恢复，和飞行模式/SIM卡切换冲突，true开启，false关闭，留空时，如果设置了时间则自动开启。本参数于2023年9月14日已废弃
--boolean 是否启用数据传输优化，true启用，false关闭，留空为false，开启后必须等到TCP数据ACK或者超时失败，或者socket CONNECT完成（无论成功或者失败）才允许RRC提前释放，可能会增加功耗。本参数于2024年8月12日启用
--返回值：
--nil 无返回值
--例子：
--mobile.rtime(3)    --与基站无数据交互3秒后提前释放RRC
--mobile.rtime(3,nil,true) --启用数据传输优化，与基站无数据交互3秒后，提前释放RRC
function mobile.rtime(time,auto_reset_stack,data_first) end

--mobile.setAuto(check_sim_period, get_cell_period, search_cell_time, auto_reset_stack, network_check_period) - 设置一些辅助周期性或者自动功能，目前支持SIM卡暂时脱离后恢复，周期性获取小区信息，网络遇到严重故障时尝试自动恢复
--传入值：
--int SIM卡自动恢复时间，单位毫秒，建议5000~10000，和飞行模式/SIM卡切换冲突，不能再同一时间使用，必须错开执行。写0或者不写则是关闭功能
--int 周期性获取小区信息的时间间隔，单位毫秒。获取小区信息会增加部分功耗。写0或者不写则是关闭功能
--int 每次搜索小区时最大搜索时间，单位秒。不要超过8秒
--boolean 网络遇到严重故障时尝试自动恢复，和飞行模式/SIM卡切换冲突，true开启，false关闭，开始状态是false，留空则不做改变
--int 设置定时检测网络是否正常并且在检测到长时间无网时通过重启协议栈来恢复，无网恢复时长，单位ms，建议60000以上，为网络搜索网络保留足够的时间，留空则不做更改
--返回值：
--nil 无返回值
function mobile.setAuto(check_sim_period,get_cell_period,search_cell_time,auto_reset_stack,network_check_period) end

--mobile.apn(index, cid, new_apn_name, user_name, password, ip_type, protocol) - 获取或设置APN，设置APN必须在入网前就设置好，比如在SIM卡识别完成前就设置好
--传入值：
--int 编号,默认0. 在支持双卡的模块上才会出现0或1的情况
--int cid, 默认0，如果要用非默认APN来激活，必须>0
--string 新的APN,不填就是获取APN, 填了就是设置APN, 是否支持设置取决于底层实现
--string 新的APN的username,如果APN不是空,那必须填写,如果没有留个空字符串""。如果APN是空的，那可以nil
--string 新的APN的password,如果APN不是空,那必须填写,如果没有留个空字符串""。如果APN是空的，那可以nil
--int 激活APN时的IP TYPE,1=IPV4 2=IPV6 3=IPV4V6,默认是1
--int 激活APN时,如果需要username和password,就要写鉴权协议类型,1~3,默认3,代表1和2都尝试一下。不需要鉴权的写0
--boolean 是否删除APN,true是,其他都否,只有参数3新的APN不是string的时候才有效果
--返回值：
--string 如果网络注册成功，返回注册用的APN值，反之是nil。设置好不会立刻有返回值，需要等网络注册成功
--例子：
--mobile.apn(0,1,"cmiot","","",nil,0) -- 移动公网卡设置APN为cmiot,一般不用设置
--mobile.apn(0,1,"name","user","password",nil,3) -- 专网卡设置的demo，name，user，password联系卡商获取
function mobile.apn(index,cid,new_apn_name,user_name,password,ip_type,protocol) end

--mobile.ipv6(onff) - 是否默认开启IPV6功能，必须在LTE网络连接前就设置好
--传入值：
--boolean 开关 true开启 false 关闭
--返回值：
--boolean true 当前是开启的，false 当前是关闭的
--例子：
---- 注意, 开启ipv6后, 开机联网会慢2~3秒
function mobile.ipv6(onff) end

--mobile.csq() - 获取csq
--返回值：
--int 当前CSQ值, 若失败返回0. 范围 0 - 31, 越大越好
--例子：
---- 注意, 4G模块的CSQ值仅供参考, rsrp/rsrq才是真正的信号强度指标
function mobile.csq() end

--mobile.rssi() - 获取rssi
--返回值：
--int 当前rssi值,若失败返回0. 范围 0 到 -114, 越小越好
function mobile.rssi() end

--mobile.rsrp() - 获取rsrp,参考信号接收功率
--返回值：
--int 当前rsrp值,若失败返回0. 取值范围: -44 ~ -140 ，值越大越好
function mobile.rsrp() end

--mobile.rsrq() - 获取rsrq,参考信号发送功率
--返回值：
--int 当前rsrq值,若失败返回0.  取值范围: -3 ~ -19.5 ，值越大越好
function mobile.rsrq() end

--mobile.snr() - 获取snr,信噪比
--返回值：
--int 当前snq值,若失败返回0.范围 0 - 30, 越大越好
function mobile.snr() end

--mobile.eci() - 获取当前服务小区的ECI(E-UTRAN Cell Identifier)
--返回值：
--int 当前eci值,若失败返回-1
function mobile.eci() end

--mobile.tac() - 获取当前服务小区的TAC或者LAC
--返回值：
--int 当前eci值,若失败返回-1. 如果尚未注册到网络,会返回0
--例子：
---- 本API于 2023.7.9 新增
function mobile.tac() end

--mobile.enbid() - 获取当前服务小区的eNBID(eNodeB Identifier)
--返回值：
--int 当前enbid值,若失败返回-1
function mobile.enbid() end

--mobile.scell() - 获取当前服务小区更详细的信息
--返回值：
--table 服务小区的信息
--例子：
---- 本API于 2024.9.12 新增
--log.info("cell", json.encode(mobile.scell()))
---- 返回值示例
--{
--    "mnc": 11,
--    "mcc": 460,
--    "rssi": -78,
--    "pci": 115,
--    "rsrp": -107,
--    "tac": 30005,
--    "eci": 124045360,
--    "cid": 124045360,
--    "rsrq": -9,
--    "snr": 15,
--    "earfcn": 1850
--}
function mobile.scell() end

--mobile.flymode(index, enable) - 进出飞行模式
--传入值：
--int 编号,默认0. 在支持双卡的模块上才会出现0或1的情况
--bool 是否设置为飞行模式,true为设置, false为退出,可选
--返回值：
--bool 原飞行模式的状态
function mobile.flymode(index,enable) end

--mobile.syncTime(enable) - 配置基站同步时间开关，默认开启
--传入值：
--bool 开启,true开启, false关闭, nil不设置
--返回值：
--bool 当前开关状态
--例子：
--mobile.syncTime() --获取当前开关状态
--mobile.syncTime(false) --关闭基站同步时间
function mobile.syncTime(enable) end

--mobile.status() - 获取网络状态
--返回值：
--int 当前网络状态
--例子：
---- 状态描述
---- 0:网络未注册
---- 1:网络已注册
---- 2:正在搜网中
---- 3:网络注册被拒绝
---- 4:网络状态未知
---- 5:漫游,且已注册
---- 6:仅SMS可用
---- 7:仅SMS可用,且漫游状态
---- 8:仅紧急呼叫. 注意, 国内不支持此状态,模块也不支持紧急呼叫
--
---- 不推荐使用本API判断联网状态, 建议使用socket.localIP()来判断
function mobile.status() end

--mobile.getCellInfo() - 获取基站信息
--返回值：
--table 包含基站数据的数组
--例子：
---- 注意: 从2023.06.20开始, 需要主动请求一次reqCellInfo才会有基站数据.
--
----示例输出(原始数据是table, 下面是json格式化后的内容)
----[[
--[
--    {"rsrq":-10,"rssi":-55,"cid":124045360,"mnc":17,"pci":115,"earfcn":1850,"snr":15,"rsrp":-85,"mcc":1120,"tdd":0},
--    {"pci":388,"rsrq":-11,"mnc":17,"earfcn":2452,"snr":5,"rsrp":-67,"mcc":1120,"cid":124045331},
--    {"pci":100,"rsrq":-9,"mnc":17,"earfcn":75,"snr":17,"rsrp":-109,"mcc":1120,"cid":227096712}
--]
--]]
--
--mobile.reqCellInfo(60)
---- 订阅
--sys.subscribe("CELL_INFO_UPDATE", function()
--    log.info("cell", json.encode(mobile.getCellInfo()))
--end)
--
---- 定期轮训式
--sys.taskInit(function()
--    sys.wait(3000)
--    while 1 do
--        mobile.reqCellInfo(15)
--        sys.waitUntil("CELL_INFO_UPDATE", 15000)
--        log.info("cell", json.encode(mobile.getCellInfo()))
--    end
--end)
function mobile.getCellInfo() end

--mobile.reqCellInfo(timeout) - 发起基站信息查询,含临近小区
--传入值：
--int 超时时长,单位秒,默认15. 最少5, 最高60
--返回值：
--nil 无返回值
--例子：
---- 参考 mobile.getCellInfo 函数
function mobile.reqCellInfo(timeout) end

--mobile.lockCell(mode, earfcn, pci) - 锁定/解锁小区，仅用于外场测试，没接触过的，或者生产环境中请勿使用
--传入值：
--int 操作码 0删除优先的频点，1设置优先频点，2锁定小区，3解锁小区
--int 下行频点
--int phycellid
--返回值：
--bool 成功true 失败false
--例子：
--mobile.lockCell(2,1860,32)    --锁定小区
--mobile.lockCell(3)            --解锁小区
function mobile.lockCell(mode,earfcn,pci) end

--mobile.reset() - 重启协议栈
--返回值：
--nil 无返回值
--例子：
---- 重启LTE协议栈
--mobile.reset()
function mobile.reset() end

--mobile.dataTraffic(clearUplink, clearDownlink) - 数据量流量处理
--传入值：
--boolean 清空上行流量累计值，true清空，其他忽略
--boolean 清空下行流量累计值，true清空，其他忽略
--返回值：
--int 上行流量GB
--int 上行流量B
--int 下行流量GB
--int 下行流量B
--例子：
---- 获取上下行流量累计值
---- 上行流量值Byte = uplinkGB * 1024 * 1024 * 1024 + uplinkB
---- 下行流量值Byte = downlinkGB * 1024 * 1024 * 1024 + downlinkB
--local uplinkGB, uplinkB, downlinkGB, downlinkB = mobile.dataTraffic()
--
---- 清空上下行流量累计值
--mobile.dataTraffic(true, true)
--
---- 仅记录开机后的流量,复位/重启会归零
function mobile.dataTraffic(clearUplink,clearDownlink) end

--mobile.config(item, value) - 网络特殊配置
--传入值：
--int 配置项目，看mobile.CONF_XXX
--int 配置值,根据具体配置的item决定
--返回值：
--boolean 是否成功
--例子：
----针对不同平台有不同的配置，谨慎使用，目前只有EC618/EC718系列
--
---- EC618配置小区重选信号差值门限，不能大于15dbm，必须在飞行模式下才能用
--mobile.flymode(0,true)
--mobile.config(mobile.CONF_RESELTOWEAKNCELL, 15)
--mobile.config(mobile.CONF_STATICCONFIG, 1) --开启网络静态优化
--mobile.flymode(0,false)
--
---- EC618设置SIM写入次数的统计
---- 关闭统计
--mobile.config(mobile.CONF_SIM_WC_MODE, 0)
---- 开启统计, 默认也是开启的.
--mobile.config(mobile.CONF_SIM_WC_MODE, 1)
---- 读取统计值,异步, 需要通过系统消息SIM_IND获取
--sys.subscribe("SIM_IND", function(stats, value)
--    log.info("SIM_IND", stats)
--    if stats == "SIM_WC" then
--        log.info("sim", "write counter", value)
--    end
--end)
--mobile.config(mobile.CONF_SIM_WC_MODE, 2)
---- 清空统计值
--mobile.config(mobile.CONF_SIM_WC_MODE, 3)
function mobile.config(item,value) end

--mobile.getBand(band, is_default) - 获取当前使用/支持的band
--传入值：
--zbuff 输出band
--boolean true默认支持，false当前支持的，默认是false，当前是预留功能，不要写true
--返回值：
--boolean 成功返回true，失败放回false
--例子：
--local buff = zbuff.create(40)
--mobile.getBand(buff) --输出当前使用的band，band号放在buff内，buff[0]，buff[1]，buff[2] .. buff[buff:used() - 1]
function mobile.getBand(band,is_default) end

--mobile.setBand(band, num) - 设置使用的band
--传入值：
--zbuff 输入使用的band
--int band数量
--返回值：
--boolean 成功返回true，失败放回false
--例子：
--local buff = zbuff.create(40)
--buff[0] = 3
--buff[1] = 5
--buff[2] = 8
--buff[3] = 40
--mobile.setBand(buff, 4) --设置使用的band一共4个，为3,5,8,40
function mobile.setBand(band,num) end

--mobile.nstOnOff(onoff, uart_id) - RF测试开关和配置
--传入值：
--boolean true开启测试模式，false关闭
--int 串口号
--返回值：
--nil 无返回值
--例子：
--mobile.nstOnOff(true, uart.VUART_0)    --打开测试模式，并且用虚拟串口发送结果
--mobile.nstOnOff(false) --关闭测试模式
function mobile.nstOnOff(onoff,uart_id) end

--mobile.nstInput(data) - RF测试数据输入
--传入值：
--string or zbuff 用户从串口获取的数据，注意，当获取完所有数据后，需要再传一个nil来作为传输结束
--返回值：
--nil 无返回值
--例子：
--mobile.nstInput(uart_data)
--mobile.nstInput(nil)
function mobile.nstInput(data) end

--mobile.vsimInit() - 初始化内置默认虚拟卡功能(不可用)
--返回值：
--nil 无返回值
--例子：
--mobile.vsimInit()
function mobile.vsimInit() end

--mobile.vsimOnOff(enable) - 切换内置虚拟卡和外置实体卡，2024年8月13日启用，虚拟卡需要固件支持，否则切换后无网络，需要在飞行模式下切换，或者切换后重启协议栈
--传入值：
--bool 开启,true开启, false关闭
--返回值：
--nil 无返回值
--例子：
--mobile.vsimOnOff(true) --使用内置虚拟卡
--mobile.vsimOnOff(false) --使用外置实体卡
function mobile.vsimOnOff(enable) end

--mobile.apnTableInit() - 初始化自定义APN列表，主要用于海外SIM卡
--返回值：
--nil 无返回值
--例子：
--mobile.apnTableInit()
function mobile.apnTableInit() end

--mobile.apnTableAdd(mcc, mnc, ip_type, protocol, apn_name, user_name, password) - 往自定义APN列表添加一条APN信息，主要用于海外SIM卡
--传入值：
--int MCC码,16进制BCD码
--int MNC码,16进制BCD码
--int 激活APN时的IP TYPE,1=IPV4 2=IPV6 3=IPV4V6,默认是1
--int 激活APN时,如果需要username和password,就要写鉴权协议类型,1~3,默认3,代表1和2都尝试一下。不需要鉴权的写0
--string APN name,不能为空
--string APN的username
--string APN的password
--返回值：
--nil 无返回值
--例子：
--mobile.apnTableInit() -- 先初始化，必须放在SIM卡识别完成前加入，最好就是写在开头
--mobile.apnTableAdd(0x460,0x00,3,0,"cmiot","","") -- 单独添加一条APN信息，必须放在SIM卡识别完成前加入，最好就是写在开头，移动公网卡设置APN为cmiot（一般不用设置，这里只是举个例子）
function mobile.apnTableAdd(mcc,mnc,ip_type,protocol,apn_name,user_name,password) end

--mobile.apnTablePrint(mcc, mnc) - 打印自定义APN列表里的一条信息，在没有拿到卡的情况下，测试一下对应的APN信息是否和运营商提供的匹配
--传入值：
--int MCC码,16进制BCD码
--int MNC码,16进制BCD码
--返回值：
--nil 无返回值
--例子：
--mobile.apnTableInit()
--mobile.apnTablePrint(0x202, 0x01)
function mobile.apnTablePrint(mcc,mnc) end