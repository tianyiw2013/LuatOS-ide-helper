---@meta

--- LuatOS IDE Helper for module: fota
--- ```yaml
--- Summary: 底层固件升级
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/modules/luat_lib_fota.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/fota
--- Video: 
--- Tag: LUAT_USE_FOTA
--- ```
--- ```lua
--- 如果是从http获取升级包, 那么看demo/fota就可以了
--- 以下是从其他途径获取更新包后, 调用本fota库的基本逻辑
--- 逐段传入
--- sys.taskInit(function()
---     fota.init()
---     while 1 do
---         local buf = xxx -- 这里是从其他途径获取的升级包片段
--- buf 可以是zbuff 也可以是string
--- 每次写入的数据长度最大不应超过4k
---         local result, isDone, cache = fota.run(buf) 
---         if not result then
---             log.info("fota", "出错了")
---             break
---         end
---         if isDone then
---             while true do
---                 local succ,fotaDone  = fota.isDone()
---                 if not succ then
---                     log.info("fota", "出错了")
---                     break
---                 end
---                 if fotaDone then
---                     log.info("fota", "已完成")
---                     break
---                 end
---                 sys.wait(100)
---             end
---             break
---         end
---         sys.wait(100)
---     end
--- end)
--- 使用文件一次性传入
--- sys.taskInit(function()
---     fota.init()
---     fota.file("/xxx") -- 传入具体的路径
--- end)
--- ```
fota = {}

--- 初始化fota流程
---@param storge_location number|string fota数据存储的起始位置<br>如果是int，则是由芯片平台具体判断<br>如果是string，则存储在文件系统中<br>如果为nil，则由底层决定存储位置
---@param len number 数据存储的最大空间
---@param param1 userdata param1，如果数据存储在spiflash时,为spi_device
---@param param2 number param2，目前只用于外部flash更新时, spiflash电源控制脚
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- 初始化fota流程
--- local result = fota.init(0, 0x00300000, spi_device)    --由于105的flash从0x01000000开始，所以0就是外部spiflash
--- local result = fota.init()    --Air780EXXX系列使用固定内部地址，所以不需要参数了
--- local result = fota.init(0xe0000000, 0, spi_device, 27)    --EC7XX系列允许使用外部flash更新，但是地址必须加上0xe0000000的偏移
--- ```
function fota.init(storge_location, len, param1, param2) end

--- 等待底层fota流程准备好
---@return boolean #1 是否完整走完流程，true 表示正确走完流程了
--- ```lua
--- local isDone = fota.wait()
--- ```
function fota.wait() end

--- 写入fota数据
---@param buff zbuff|string fota数据，尽量用zbuff
---@param offset number 起始偏移量,传入zbuff时有效,默认是0
---@param len number 写入长度,传入zbuff时有效,默认是zbuff:used()
---@return boolean #1 有异常返回false，无异常返回true
---@return boolean #2 接收到最后一块返回true
---@return number #3 还未写入的数据量，超过64K必须做等待
--- ```lua
--- local result, isDone, cache = fota.run(buf) -- 写入fota流程
--- 提示: ，如果传入的是zbuff，写入成功后，请自行清空zbuff内的数据
--- 2024.4.3新增offset, len参数, 仅对zbuff有效
--- fota.run(buff, 0, 1024)
--- ```
function fota.run(buff, offset, len) end

--- 从指定文件读取fota数据
---@param path string 文件路径
---@return boolean #1 有异常返回false，无异常返回true
---@return boolean #2 接收到最后一块返回true
---@return number #3 还未写入的数据量，超过64K必须做等待
--- ```lua
--- local result, isDone, cache = fota.file("/xxx.bin") -- 写入fota流程
--- 本API于2023.03.23 添加
--- ```
function fota.file(path) end

--- 等待底层fota流程完成
---@return boolean #1 有异常返回false，无异常返回true
---@return boolean #2 写入到最后一块返回true
--- ```lua
--- local result, isDone = fota.isDone()
--- ```
function fota.isDone() end

--- 结束fota流程
---@param is_ok boolean 是否完整走完流程，true 表示正确走完流程了
---@return boolean #1 成功返回true, 失败返回false
--- ```lua
--- 结束fota流程
--- local result = fota.finish(true)
--- ```
function fota.finish(is_ok) end
