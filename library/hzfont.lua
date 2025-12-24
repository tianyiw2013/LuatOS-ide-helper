---@meta

--- LuatOS IDE Helper for module: hzfont
--- ```yaml
--- Summary: HzFont字体库
--- URL: https://gitee.com/openLuat/LuatOS/tree/master/luat/../components/hzfont/binding/luat_lib_hzfont.c
--- Demo: 
--- Video: 
--- Tag: LUAT_USE_HZFONT
--- ```
--- ```lua
--- 使用HzFont渲染TTF字体
--- 需要准备TTF字体文件
--- 初始化字体
--- hzfont.init("/sd/font.ttf")
--- ```
hzfont = {}

--- 初始化HzFont字体库
---@param ttf_path string ttf_path TTF字体文件路径，可选；留空则回退到内置字库（若启用）
---@param cache_size number cache_size 可选，位图与码点缓存容量（支持常量 HZFONT_CACHE_128/256/512/1024/2048），默认 HZFONT_CACHE_256
---@param load_to_psram boolean load_to_psram 可选，true 时将字库整包拷贝到 PSRAM 后再解析，减少后续 IO
---@return boolean #1 成功返回true，失败返回false
--- ```lua
--- 从文件加载，使用默认缓存 256
--- hzfont.init("/sd/font.ttf")
--- 从文件加载，指定缓存 1024
--- hzfont.init("/sd/font.ttf", hzfont.HZFONT_CACHE_1024)
--- 从luadb文件系统加载
--- hzfont.init("/luadb/font.ttf")
--- 回退内置字库（启用 固件配置项 LUAT_CONF_USE_HZFONT_BUILTIN_TTF 时生效）
--- hzfont.init()
--- ```
function hzfont.init(ttf_path, cache_size, load_to_psram) end

--- 调试开关
---@param enable boolean enable true 开启，false 关闭
---@return boolean #1 总是返回true
function hzfont.debug(enable) end
