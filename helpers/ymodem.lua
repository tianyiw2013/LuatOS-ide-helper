ymodem = {}

--ymodem.create(dir_path,file_path) - 创建一个ymodem处理句柄
--传入值：
--string 保存的文件夹路径，默认是"/"
--string 强制保存的绝对文件路径，默认是空，如果设置了，就会直接保存在该文件中
--返回值：
--boolean 成功true, 失败false
--例子：
--local handler = ymodem.create("/")
function ymodem.create(dir_path,file_path) end

--ymodem.receive(handler, data) - ymodem接收文件数据并保存
--传入值：
--userdata ymodem处理句柄
--zbuff/string 输入的数据
--返回值：
--boolean 成功true，失败false
--int ack值，需要通过串口/网络等途径返回发送方
--int flag值，需要通过串口/网络等途径返回发送方，如果有ack值则不发送flag
--boolean, 一个文件接收完成true，传输中false
--boolean, 整个传输完成true 否则false
--例子：
---- 注意, 数据来源不限, 通常是uart.read得到data
--no_error,ack,flag,file_done,all_done = ymodem.receive(handler, data)
function ymodem.receive(handler,data) end

--ymodem.reset(handler) - 重置ymodem处理过程
--传入值：
--userdata ymodem处理句柄
--例子：
---- 恢复到初始状态，一般用于接收出错后重置，从而进行下一次接收
--ymodem.reset(handler)
function ymodem.reset(handler) end

--ymodem.release(handler) - 释放ymodem处理句柄
--传入值：
--userdata handler
--例子：
--ymodem.release(handler)
function ymodem.release(handler) end