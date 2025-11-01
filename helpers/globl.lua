globl = {}

--_G
function _G(...) end

--_VERSION
function _VERSION(...) end

--assert()
function assert(v, message) end

--collectgarbage()
function collectgarbage(opt, arg) end

--dofile ([filename])
function dofile(filename) end

--error (message [, level])
function error(...) end

--getfenv ([f])
function getfenv(...) end

--getmetatable (object)
function getmetatable(object) end

--ipairs (t)
function ipairs(...) end

--load (func [, chunkname])
function load(...) end

--loadfile ([filename])
function loadfile(...) end

--loadstring (string [, chunkname])
function loadstring(...) end

--module (name [, ...])
function module(...) end

--next (table [, index])
function next(table, index) end

--pairs (t)
function pairs(...) end

--pcall (f, arg1, ...)
function pcall(...) end

--print(...)
function print(...) end

--select (index, ···)
function select(index, ...) end

--setfenv (f, table)
function setfenv(...) end

--setmetatable (table, metatable)
function setmetatable(table, metatable) end

--tonumber (e [, base])
function tonumber(e, base) end

--tostring (v)
function tostring(v) end

--type (v)
function type(v) end

--unpack (list [, i [, j]])
function unpack(...) end

--xpcall (f, err)
function xpcall(...) end

--dtimerWkId() - 检查定时唤醒是哪一个定时器，如果不是定时唤醒的，返回-1
--返回值：
--int 处理结果 >=0 是本次定时唤醒的定时器ID，其他错误，说明不是定时唤醒的
--例子：
--local timer_id = pm.dtimerWkId()
function dtimerWkId() end