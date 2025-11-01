sqlite3 = {}

--sqlite3.open(path) - 打开数据库
--传入值：
--string 数据库文件路径,必须填写,不存在就会自动新建
--返回值：
--userdata 数据库指针,是否就返回nil
--例子：
--local db = sqlite3.open("/test.db")
--if db then
--   -- 数据库操作xxxx
--
--    -- 用完必须关掉
--    sqlite3.close(db)
--end
function sqlite3.open(path) end

--sqlite3.exec(db, sql) - 执行SQL语句
--传入值：
--userdata 通过sqlite3.open获取到的数据库指针
--string SQL字符串,必须填写
--返回值：
--boolean 成功返回true,否则返回nil
--table 成功返回查询结果(若有),否则返回报错的字符串
function sqlite3.exec(db,sql) end

--sqlite3.close(db) - 关闭数据库
--传入值：
--userdata 通过sqlite3.open获取到的数据库指针
--返回值：
--boolean 成功返回true,否则返回nil
function sqlite3.close(db) end