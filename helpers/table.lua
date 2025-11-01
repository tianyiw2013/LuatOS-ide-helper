table = {}

--表连接
--返回值：
--  字符串
--例子：
--fruits = {"banana","orange","apple"}
---- 返回 table 连接后的字符串
--print("连接后的字符串 ",table.concat(fruits))
----连接后的字符串     bananaorangeapple
--
---- 指定连接字符
--print("连接后的字符串 ",table.concat(fruits,", "))
----连接后的字符串     banana, orange, apple
--
---- 指定索引来连接 table
--print("连接后的字符串 ",table.concat(fruits,", ", 2,3))
----连接后的字符串     orange, apple
function table.concat(t, s) end

--返回一个迭代器函数,每次调用函数都会返回hash表的排序后的键值对
--返回值：
--function.
--例子：
--test = {a=1,f=9,d=2,c=8,b=5}
--for name,line in pairsByKeys(test) do print(name,line) end
function table.gsort(t, f) end

--添加table参数
--返回值：
--  table
--例子：
--fruits = {"banana","orange","apple"}
--
---- 在末尾插入
--table.insert(fruits,"mango")
--print("索引为 4 的元素为 ",fruits[4])
----索引为 4 的元素为     mango
--
---- 在索引为 2 的键处插入
--table.insert(fruits,2,"grapes")
--print("索引为 2 的元素为 ",fruits[2])
----索引为 2 的元素为     grapes
--
--print("最后一个元素为 ",fruits[5])
----最后一个元素为     mango
function table.insert(t, d) end

--移除table参数
--返回值：
--  table
function table.remove(t, i) end