# LuatOS IDE Helper 使用说明 (VSCode)

最后生成时间：**2025/11/02 19:44:07**

## 安装扩展

1. VSCode 扩展市场搜索 `emmylua` 并安装
2. 建议卸载其他`Lua`扩展，防止冲突

> 我们推荐使用`emmylua`扩展，当前您想使用其他`Lua`扩展也完全没问题，请自行根据对应的扩展进行设置。

```yaml
名称: EmmyLua
ID: tangzx.emmylua
说明: EmmyLua for vscode
发布者: Tangzx
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=tangzx.emmylua
```

## 设置项目

1. 项目根目录新建文件`.emmyrc.json`
2. 将下面`json`代码复制到`.emmyrc.json`并保存

    *😳 不要忘记把路径改成你电脑的路径*

```json
{
    "workspace": {
        "library": [
            "D:/Luatools/resource/LuatOS_IDE_Helpers"
        ]
    }
}
```

## 其他说明

- [LuatOS_IDE_Helpers](https://gitee.com/openLuat/LuatOS/tree/master/tools/LuatOS_IDE_Helpers)文件使用`python`脚本自动提取自`LuatOS`源码中的`@api`注解
- 若发现错误请及时请往git仓库提交[issue](https://gitee.com/openLuat/LuatOS/issues)，或直接提交[PR](https://gitee.com/openLuat/LuatOS/pulls)
- 获取最新版本请前方官方Git下载 [LuatOS_IDE_Helpers](https://gitee.com/openLuat/LuatOS/tree/master/tools/LuatOS_IDE_Helpers)

## 待解决问题

目前很多函数的参数是可选的，暂时无法自动判断哪些参数是可选的，所以编辑器可能提示“缺少参数”，后期会修复该问题