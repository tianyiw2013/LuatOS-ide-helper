---@meta

--- LuatOS IDE Helper for module: sqlite3
--- ```yaml
--- Summary: sqlite3数据库操作
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/sqlite3/binding/luat_lib_sqlite.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/sqlite3
--- Video: 
--- Tag: LUAT_USE_SQLITE3
--- ```
--- ```lua
--- 注意, 本库仍处于开发阶段, 大部分BSP尚不支持本库
--- 本移植基于 sqlite3 3.44.0
--- sys.taskInit(function()
---     sys.wait(1000)
---     local db = sqlite3.open("/ram/test.db")
---     log.info("sqlite3", db)
---     if db then
---         sqlite3.exec(db, "CREATE TABLE devs(ID INT PRIMARY KEY NOT NULL, name CHAR(50));")
---         sqlite3.exec(db, "insert into devs values(1, \"ABC\");")
---         sqlite3.exec(db, "insert into devs values(2, \"DEF\");")
---         sqlite3.exec(db, "insert into devs values(3, \"HIJ\");")
---         local ret, data = sqlite3.exec(db, "select * from devs;")
---         log.info("查询结果", ret, data)
---         if ret then
---             for k, v in pairs(data) do
---                 log.info("数据", json.encode(v))
---             end
---         end
---         sqlite3.close(db)
---     end
--- end)
--- ```
sqlite3 = {}

--- 打开数据库
---@param path string 数据库文件路径,必须填写,不存在就会自动新建
---@return userdata #1 数据库指针,是否就返回nil
--- ```lua
--- local db = sqlite3.open("/test.db")
--- if db then
--- 数据库操作xxxx
--- 用完必须关掉
---     sqlite3.close(db)
--- end
--- ```
function sqlite3.open(path) end

--- 执行SQL语句
---@param db userdata 通过sqlite3.open获取到的数据库指针
---@param sql string SQL字符串,必须填写
---@return boolean #1 成功返回true,否则返回nil
---@return table #2 成功返回查询结果(若有),否则返回报错的字符串
function sqlite3.exec(db, sql) end

--- 关闭数据库
---@param db userdata 通过sqlite3.open获取到的数据库指针
---@return boolean #1 成功返回true,否则返回nil
function sqlite3.close(db) end
