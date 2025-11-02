---@meta

--- LuatOS IDE Helper for module: ymodem
--- ```yaml
--- Summary: ymodem协议
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/ymodem/luat_lib_ymodem.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_YMODEM
--- ```
--- ```lua
--- 本库的用途是接收数据, 若需要发送文件, 建议用xmodem库
--- local handler = ymodem.create("/")
--- uart.setup(1, 115200)
--- uart.on(1, "receive", function(id, len)
---     while 1 do
---         local data = uart.read(id, 512)
---         if not data or #data == 0 then
---             break
---         end
---         ymodem.receive(handler, data)
---     end
--- end)
--- ```
ymodem = {}

--- 创建一个ymodem处理句柄
---@param dir_path string 保存的文件夹路径，默认是"/"
---@param file_path string 强制保存的绝对文件路径，默认是空，如果设置了，就会直接保存在该文件中
---@return boolean #1 成功true, 失败false
--- ```lua
--- local handler = ymodem.create("/")
--- ```
function ymodem.create(dir_path, file_path) end

--- ymodem接收文件数据并保存
---@param handler userdata ymodem处理句柄
---@param data zbuff|string 输入的数据
---@return boolean #1 成功true，失败false
---@return number #2 ack值，需要通过串口/网络等途径返回发送方
---@return number #3 flag值，需要通过串口/网络等途径返回发送方，如果有ack值则不发送flag
---@return boolean, #4 一个文件接收完成true，传输中false
---@return boolean, #5 整个传输完成true 否则false
--- ```lua
--- 注意, 数据来源不限, 通常是uart.read得到data
--- no_error,ack,flag,file_done,all_done = ymodem.receive(handler, data)
--- ```
function ymodem.receive(handler, data) end

--- 重置ymodem处理过程
---@param handler userdata ymodem处理句柄
--- ```lua
--- 恢复到初始状态，一般用于接收出错后重置，从而进行下一次接收
--- ymodem.reset(handler)
--- ```
function ymodem.reset(handler) end

--- 释放ymodem处理句柄
---@param handler userdata handler
--- ```lua
--- ymodem.release(handler)
--- ```
function ymodem.release(handler) end
