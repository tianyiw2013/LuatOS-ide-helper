---@meta

--- LuatOS IDE Helper for module: json
--- ```yaml
--- Summary: json生成和解析库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/lua-cjson/lua_cjson.c
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/json
--- Video: 
--- Tag: LUAT_USE_CJSON
--- ```
json = {}

--- 将对象序列化为json字符串
---@param obj obj 需要序列化的对象
---@param t string 浮点数精度和模式,这项不存在的时候,为默认值"7f",数字只支持"0~14",模式只支持"f/g"
---@return string #1 序列化后的json字符串, 失败的话返回nil
---@return string #2 序列化失败的报错信息
--- ```lua
--- json.encode(obj)-->浮点数用%.7g的方式转换为字符串
--- json.encode(obj,"12f")-->浮点数用%.12f的方式转换为字符串
--- 2024.1.9 起, 默认使用7f格式化浮点数
--- 之前的版本使用 7g格式化浮动数
--- ```
function json.encode(obj, t) end

--- 将字符串反序列化为对象
---@param str string 需要反序列化的json字符串
---@return obj #1 反序列化后的对象(通常是table), 失败的话返回nil
---@return result #2 成功返回1,否则返回0
---@return err #3 反序列化失败的报错信息
--- ```lua
--- json.decode("[1,2,3,4,5,6]")
--- ```
function json.decode(str) end
