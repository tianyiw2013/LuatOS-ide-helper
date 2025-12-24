---@meta

--- LuatOS IDE Helper for module: pinyin
--- ```yaml
--- Summary: 拼音输入法核心库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/pinyin/binding/luat_lib_pinyin.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_PINYIN
--- ```
--- ```lua
--- 查询拼音对应的候选字
--- local pinyin = require "pinyin"
--- local codes = pinyin.query("zhong")
--- codes = {0x4E2D, 0x949F, ...}  -- Unicode码点数组
--- ```
pinyin = {}

--- 查询拼音对应的候选字Unicode码点数组
---@param pinyin_string string pinyin_string 拼音字符串，如 "zhong"
---@return table #1 Unicode码点数组，如 {0x4E2D, 0x949F, ...}，如果无匹配返回空表 {}
--- ```lua
--- local codes = pinyin.query("zhong")
--- codes = {0x4E2D, 0x949F, ...}  -- "中"、"钟"等
--- ```
function pinyin.query(pinyin_string) end

--- 查询拼音对应的候选字UTF-8字符串数组
---@param pinyin_string string pinyin_string 拼音字符串，如 "zhong"
---@return table #1 UTF-8字符串数组，如 {"中", "钟", ...}，如果无匹配返回空表 {}
--- ```lua
--- local chars = pinyin.queryUtf8("zhong")
--- chars = {"中", "钟", ...}  -- 直接返回UTF-8字符串数组
--- ```
function pinyin.queryUtf8(pinyin_string) end

--- 查询按键序列对应的音节列表（9键输入法）
---@param key_sequence table key_sequence 按键序列，每个元素为1-8的数字（对应ABC-WXYZ）
---@return table #1 音节字符串数组，按常用度排序，如 {"zhong", "zong", ...}
--- ```lua
--- local pinyin = require "pinyin"
--- local syllables = pinyin.querySyllables({8, 3, 5, 5, 3})  -- WXYZ, GHI, MNO, MNO, GHI
--- 返回: {"zhong", "zong", ...}
--- ```
function pinyin.querySyllables(key_sequence) end
