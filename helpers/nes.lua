nes = {}

--nes.init(file_path) - nes模拟器初始化
--传入值：
--string file_path 文件路径
--返回值：
--bool 成功返回true,否则返回false
--例子：
--nes.init("/luadb/super_mario.nes")
function nes.init(file_path) end

--nes.key(key,val) - nes模拟器初始化
--传入值：
--number key 按键
--number val 状态 1按下 0抬起
--返回值：
--bool 成功返回true,否则返回false
--例子：
--nes.init("/luadb/super_mario.nes")
function nes.key(key,val) end