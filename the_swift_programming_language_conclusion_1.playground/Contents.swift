

//元组
let (a, b) = (3, 4)
let aa = (3, 5)
print(aa)

let first = aa.0
//aa.0 = 4 error 因为aa是let类型的元组

var bb = (4,6)
print(bb)
bb.0 = 2
print(bb)


let num = -1
let num1 = +num
print(num1)
let num2 = -num
print(num2)


//空合运算符
//空合运算符( a ?? b )将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b 。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。

let defaultColorName = "red"
var userDefinedColorName: String? //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

print(colorNameToUse)


colorNameToUse = userDefinedColorName != nil? userDefinedColorName: defaultColorName











