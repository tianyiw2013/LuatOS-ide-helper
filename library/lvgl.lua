---@meta

--- LuatOS IDE Helper for module: lvgl
--- ```yaml
--- Summary: LVGL图像库
--- URL: 
--- Demo: https://gitee.com/openLuat/LuatOS/tree/master/demo/lvgl
--- Video: 
--- Tag: LUAT_USE_LVGL
--- ```
lvgl = {}

--- 获取当前活跃的screen对象
---@return 指针 #1 screen指针
--- ```lua
--- local scr = lvgl.scr_act()
--- ```
function lvgl.scr_act() end

--- 获取layer_top
---@return 指针 #1 layer指针
function lvgl.layer_top() end

--- 获取layer_sys
---@return 指针 #1 layer指针
function lvgl.layer_sys() end

--- 载入指定的screen
---@param scr userdata screen指针
--- ```lua
--- local scr = lvgl.obj_create(nil, nil)
---     local btn = lvgl.btn_create(scr)
---     lvgl.obj_align(btn, lvgl.scr_act(), lvgl.ALIGN_CENTER, 0, 0)
---     local label = lvgl.label_create(btn)
---     lvgl.label_set_text(label, "LuatOS!")
---     lvgl.scr_load(scr)
--- ```
function lvgl.scr_load(scr) end

--- 载入指定的screen并使用指定的转场动画
---@param scr userdata screen指针
--- ```lua
--- local scr = lvgl.obj_create(nil, nil)
---     local btn = lvgl.btn_create(scr)
---     lvgl.obj_align(btn, lvgl.scr_act(), lvgl.ALIGN_CENTER, 0, 0)
---     local label = lvgl.label_create(btn)
---     lvgl.label_set_text(label, "LuatOS!")
---     local scr2 = lvgl.obj_create(nil,nil)
---     local btn2 = lvgl.btn_create(scr2)
---     lvgl.obj_align(btn, scr2, lvgl.ALIGN_CENTER, 0, 20)
---     local label2 = lvgl.label_create(btn2)
---     lvgl.label_set_text(label2, "Btn2")
---     lvgl.scr_load(scr)
--- sys.wait(1000);
---     lvgl.scr_load_anim(scr2,lvgl.SCR_LOAD_ANIM_OVER_LEFT,100,100,false)
--- 原函数：lv_scr_load_anim(lv_obj_t * new_scr, lv_scr_load_anim_t anim_type, uint32_t time, uint32_t delay, bool auto_del)
--- ```
function lvgl.scr_load_anim(scr) end

--- 设置主题
---@param name string 主题名称,可选值有 default/mono/empty/material_light/material_dark/material_no_transition/material_no_focus
---@return boolean #1 成功返回true,否则返回nil
--- ```lua
--- 黑白主题
--- lvgl.theme_set_act("mono")
--- 空白主题
--- lvgl.theme_set_act("empty")
--- ```
function lvgl.theme_set_act(name) end

--- LVGL休眠控制，暂停/恢复刷新定时器，目前只有Air105和Air780EXXX可以用
---@param enable boolean true暂停 false恢复
--- ```lua
--- lvgl.sleep(true)        --暂停刷新，系统可以休眠
--- lvgl.sleep(false)        --恢复刷新，系统不休眠
--- ```
function lvgl.sleep(enable) end

--- 初始化LVGL
---@param w number 屏幕宽,可选,默认从lcd取
---@param h number 屏幕高,可选,默认从lcd取
---@param lcd userdata lcd指针,可选,lcd初始化后有默认值,预留的多屏入口
---@param buff_size number 缓冲区大小,默认宽*10, 不含色深.
---@param buff_mode number 缓冲模式,默认0x06, bit0:是否使用lcdbuff bit1:buff1 bit2:buff2 bit3:是否使用lua heap
---@return boolean #1 成功返回true,否则返回false
function lvgl.init(w, h, lcd, buff_size, buff_mode) end

--- 创建并初始化一个anim
---@return userdata #1 anim指针
--- ```lua
--- local anim = lvgl.anim_create()
--- ```
function lvgl.anim_create() end

--- 释放一个anim
---@param anim any 
--- ```lua
--- local lvgl.anim_free(anim)
--- ```
function lvgl.anim_free(anim) end

--- 创建一个lv_anim_path_t
---@return userdata #1 lv_anim_path_t指针
--- ```lua
--- local anim_path_t = lvgl.anim_path_t()
--- ```
function lvgl.anim_path_t() end

--- 释放一个lv_anim_path_t
---@param anim_path_t any 
--- ```lua
--- local lvgl.anim_path_t_free(anim_path_t)
--- ```
function lvgl.anim_path_t_free(anim_path_t) end

--- 设置动画路径方式
---@param anim userdata 动画指针
---@param tp string 类型, 支持 linear/ease_in/ease_out/ease_in_out/overshoot/bounce/step
---@return nil #1 无返回值
function lvgl.anim_set_path_str(anim, tp) end

--- 设置组件的事件回调
---@param obj userdata lvgl组件指针
---@param func func lua函数, 参数有2个 (obj, event), 其中obj是当前对象, event是事件类型, 为整型
---@return nil #1 无返回值
function lvgl.obj_set_event_cb(obj, func) end

--- 设置组件的信号回调
---@param obj userdata lvgl组件指针
---@param func func lua函数, 参数有2个 (obj, signal), 其中obj是当前对象, signal是信号类型, 为整型
---@return nil #1 无返回值
function lvgl.obj_set_signal_cb(obj, func) end

--- 设置动画回调
---@param anim userdata 动画指针
---@param func userdata lvgl组件指针
---@return nil #1 无返回值
function lvgl.anim_set_exec_cb(anim, func) end

--- 设置动画回调
---@param anim userdata 动画指针
---@param func userdata lvgl组件指针
---@return nil #1 无返回值
function lvgl.anim_set_ready_cb(anim, func) end

--- 设置动画回调
---@param path userdata 动画指针
---@param func userdata lvgl组件指针
---@return nil #1 无返回值
function lvgl.anim_path_set_cb(path, func) end

--- 发送事件给组件
---@param obj userdata 组件指针
---@param ent number 事件id, 例如 lvgl.EVENT_PRESSED
---@return boolean #1 成功返回true, 对象已被删除的话返回false或者nil
---@return number #2 底层返回值,如果obj为nil就返回nil
function lvgl.event_send(obj, ent) end

--- lvgl benchmark demo
---@return nil #1 无返回值
--- ```lua
--- lvgl.init()
--- lvgl.demo_benchmark()
--- ```
function lvgl.demo_benchmark() end

--- lvgl keypad_encoder demo
---@return nil #1 无返回值
--- ```lua
--- lvgl.init()
--- lvgl.demo_keypad_encoder()
--- ```
function lvgl.demo_keypad_encoder() end

--- lvgl music demo
---@return nil #1 无返回值
--- ```lua
--- lvgl.init()
--- lvgl.demo_music()
--- ```
function lvgl.demo_music() end

--- lvgl printer demo
---@return nil #1 无返回值
--- ```lua
--- lvgl.init()
--- lvgl.demo_printer()
--- ```
function lvgl.demo_printer() end

--- lvgl stress demo
---@return nil #1 无返回值
--- ```lua
--- lvgl.init()
--- lvgl.demo_stress()
--- ```
function lvgl.demo_stress() end

--- lvgl widgets demo
---@return nil #1 无返回值
--- ```lua
--- lvgl.init()
--- lvgl.demo_widgets()
--- ```
function lvgl.demo_widgets() end

--- 创建一个lv_draw_mask_radius_param_t
---@return userdata #1 lv_draw_mask_radius_param_t指针
--- ```lua
--- local radius = lvgl.draw_mask_radius_param_t()
--- ```
function lvgl.draw_mask_radius_param_t() end

--- 释放一个lv_draw_mask_radius_param_t
---@param radius any 
--- ```lua
--- local lvgl.draw_mask_radius_param_t_free(radius)
--- ```
function lvgl.draw_mask_radius_param_t_free(radius) end

--- 创建一个lv_draw_mask_line_param_t
---@return userdata #1 lv_draw_mask_line_param_t指针
--- ```lua
--- local line = lvgl.draw_mask_line_param_t()
--- ```
function lvgl.draw_mask_line_param_t() end

--- 释放一个lv_draw_mask_line_param_t
---@param line any 
--- ```lua
--- local lvgl.draw_mask_line_param_t_free(line)
--- ```
function lvgl.draw_mask_line_param_t_free(line) end

--- 创建一个lv_draw_mask_fade_param_t
---@return userdata #1 lv_draw_mask_fade_param_t指针
--- ```lua
--- local fade = lvgl.draw_mask_fade_param_t()
--- ```
function lvgl.draw_mask_fade_param_t() end

--- 释放一个lv_draw_mask_fade_param_t
---@param fade any 
--- ```lua
--- local lvgl.draw_mask_fade_param_t_free(fade)
--- ```
function lvgl.draw_mask_fade_param_t_free(fade) end

--- 获取内置字体
---@param name string 字体名称+字号, 例如 opposans_m_10
---@return userdata #1 字体指针
--- ```lua
--- local font = lvgl.font_get("opposans_m_12")
--- ```
function lvgl.font_get(name) end

--- 从文件系统加载字体(lvgl官方bin和高通矢量字库芯片使用,lvgl官方bin需要完整加载占用ram极大)
---@param path_OR_spi_device string|userdata 字体路径/spi_device (spi_device为使用外置高通矢量字库芯片)
---@param size number size 可选,字号 16-192 默认16(使用高通矢量字库)
---@param bpp number bpp 可选 深度 默认4(使用高通矢量字库)
---@param thickness number thickness 可选 粗细值 默认size * bpp(使用高通矢量字库)
---@param cache_size number cache_size 可选 默认0(使用高通矢量字库)
---@param sty_zh number sty_zh 可选 选择字体 默认1(使用高通矢量字库)
---@param sty_en number sty_en 可选 选择字体 默认3(使用高通矢量字库)
---@return userdata #1 字体指针
--- ```lua
--- local font = lvgl.font_load("/font_32.bin")
--- local font = lvgl.font_load(spi_device,16)(高通矢量字库)
--- ```
function lvgl.font_load(path_OR_spi_device, size, bpp, thickness, cache_size, sty_zh, sty_en) end

--- 释放字体,慎用!!!仅通过font_load加载的字体允许卸载,通过font_get获取的字体不允许卸载
---@param font string 字体路径
---@return userdata #1 字体指针
--- ```lua
--- local font = lvgl.font_load("/font_32.bin")
--- N N N N 操作
--- 确定字体不被使用,不被引用,且内存紧张需要释放
--- lvgl.font_free(font)
--- ```
function lvgl.font_free(font) end

--- 从文件系统加载字体(lvgl_conv_tool制作的字体文件,占用ram小,无需完整加载)
---@param path string 字体路径
---@return userdata #1 lvgl字体指针
--- ```lua
--- 使用lvgl_conv_tool制作的字体文件
--- github: https://github.com/Dozingfiretruck/lvgl_conv_tool
--- gitee: https://gitee.com/Dozingfiretruck/lvgl_conv_tool
--- local font = lvgl.font_load_ex("/font_32.bin")
--- ```
function lvgl.font_load_ex(path) end

--- 释放字体,慎用!!!仅通过font_load_ex加载的字体允许卸载,通过font_get获取的字体不允许卸载
---@param font string 字体路径
---@return userdata #1 字体指针
--- ```lua
--- local font = lvgl.font_load_ex("/font_32.bin")
--- N N N N 操作
--- 确定字体不被使用,不被引用,且内存紧张需要释放
--- lvgl.font_free_ex(font)
--- ```
function lvgl.font_load_ex(font) end

--- 创建gif组件
---@param parent userdata 父组件,可以是nil,但通常不会是nil
---@param path string 文件路径
---@return userdata #1 组件指针,若失败会返回nil,建议检查
--- ```lua
--- local gif = lvgl.gif_create(scr, "S/emtry.gif")
--- if gif then
---     log.info("gif", "create ok")
--- end
--- ```
function lvgl.gif_create(parent, path) end

--- 重新播放gif组件
---@param gif userdata gif组件支持, 由gif_create方法返回
---@return nil #1 无返回值
--- ```lua
--- local gif = lvgl.gif_create(scr, "S/emtry.gif")
--- if gif then
---     log.info("gif", "create ok")
--- end
--- ```
function lvgl.gif_restart(gif) end

--- 注册输入设备驱动
---@param tp string 设备类型，当前支持"pointer",指针类/触摸类均可，"keyboard",键盘类型
---@param dtp string 设备型号，当前支持"emulator",模拟器类型
---@return boolean #1 成功返回true,否则返回false
--- ```lua
--- lvgl.indev_drv_register("pointer", "emulator")
--- ```
function lvgl.indev_drv_register(tp, dtp) end

--- 更新模拟输入设备的坐标数据
---@param x number x坐标,以左上角为0,右下角为最大值
---@param y number y坐标,以左上角为0,右下角为最大值
---@param state number 状态, 0 为 释放, 1 为按下
---@return nil #1 无返回值
--- ```lua
--- 模拟在屏幕上的点击,通过timeout模拟长按和短按
--- sys.taskInit(function(x, y, timeout)
---     lvgl.indev_point_emulator_update(x, y, 1)
---     sys.wait(timeout)
---     lvgl.indev_point_emulator_update(x, y, 0)
--- end, 240, 120, 50)
--- ```
function lvgl.indev_point_emulator_update(x, y, state) end

--- 更新键盘输入设备的按键值
---@param key number 按键值，默认为0，按键抬起
---@return nil #1 无返回值
function lvgl.indev_kb_update(key) end

--- 创建qrcode组件
---@param parent userdata 父组件
---@param size number 长度,因为qrcode是正方形
---@param dark_color number 二维码中数据点的颜色, RGB颜色, 默认 0x3333ff
---@param light_color number 二维码中背景点的颜色, RGB颜色, 默认 0xeeeeff
---@return userdata #1 qrcode组件
--- ```lua
--- 创建并显示qrcode
--- local qrcode = lvgl.qrcode_create(scr, 100)
--- lvgl.qrcode_update(qrcode, "https://luatos.com")
--- lvgl.obj_align(qrcode, lvgl.scr_act(), lvgl.ALIGN_CENTER, -100, -100)
--- ```
function lvgl.qrcode_create(parent, size, dark_color, light_color) end

--- 设置qrcode组件的二维码内容,配合qrcode_create使用
---@param qrcode userdata qrcode组件,由qrcode_create创建
---@param cnt string 二维码的内容数据
---@return boolean #1 更新成功返回true,否则返回false. 通常只有数据太长无法容纳才会返回false
function lvgl.qrcode_update(qrcode, cnt) end

--- 删除qrcode组件
---@param qrcode userdata qrcode组件,由qrcode_create创建
---@return nil #1 无返回值
function lvgl.qrcode_delete(qrcode) end

--- 创建一个style
---@return userdata #1 style指针
--- ```lua
--- local style = lvgl.style_t()
--- lvgl.style_init(style)
--- ```
function lvgl.style_t() end

--- 创建一个style并初始化
---@return userdata #1 style指针
--- ```lua
--- local style = lvgl.style_create()
--- ```
function lvgl.style_create() end

--- 创建一个style_list
---@return userdata #1 style指针
--- ```lua
--- local style_list = lvgl.style_list_create()
--- ```
function lvgl.style_list_create() end

--- 创建一个style_list
---@return userdata #1 style指针
--- ```lua
--- local style = lvgl.style_list_t()
--- ```
function lvgl.style_list_t() end

--- 删除style,慎用,通常不会执行删除操作
---@param style userdata style指针
--- ```lua
--- local style = lvgl.style_create()
--- ...
--- ...
--- lvgl.style_delete(style)
--- ```
function lvgl.style_delete(style) end

--- 删除style_list,慎用,通常不会执行删除操作
---@param style userdata style指针
--- ```lua
--- local style_list = lvgl.style_list_create()
--- ...
--- ...
--- lvgl.style_list_delete(style_list)
--- ```
function lvgl.style_list_delete(style) end
