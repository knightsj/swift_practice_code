
//基本运算符

//运算符分为一元、二元和三元运算符:
//• 一元运算符对单一操作对象操作(如 -a )。一元运算符分前置运算符和后置运算符，前置运算符需紧跟在 操作对象之前(如 !b )，后置运算符需紧跟在操作对象之后(如 c! )。
//• 二元运算符操作两个操作对象(如 2 + 3 )，是中置的，因为它们出现在两个操作对象之间。
//• 三元运算符操作三个操作对象，和 C 语言一样，Swift 只有一个三元运算符，就是三目运算符( a ? b :c)。

//元组
let (x, y) = (1, 2)

"hello, " + "world" // 等于 "hello, world"

let three = 3
let minusThree = -three // minusThree 等于 -3
let plusThree = -minusThree // plusThree 等于 3, 或 "负负3"

//一元正号符( + )不做任何改变地返回操作数的值:
let minusSix = -6
let alsoMinusSix = +minusSix // alsoMinusSix 等于 -6

//比较元组大小会的按照从左到右、逐值比较的方式，直到发现有两个值不等时停止。如果所有的值都相等，那么这一对元组我们就称它们是相等的。例如:

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
// true，因为 1 小于 2
// true，因为 3 等于 3，但是 apple 小于 bird // true，因为 4 等于 4，dog 等于 dog

//三目运算符
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20) // rowHeight 现在是 90

//第一段代码例子使用了三目运算，所以一行代码就能让我们得到正确答案。这比第二段代码简洁得多，无需将rowHeight定义成变量，因为它的值无需在if语句中改变。

//空合运算符
//空合运算符( a ?? b )将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b 。表达式 a 必须是 Optional 类型。默认值 b 的类型必须要和 a 存储值的类型保持一致。
//a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String? //默认值为 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"


userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 非空，因此 colorNameToUse 的值为 "green"

//区间运算符

//闭区间运算符
//闭区间运算符( a...b )定义一个包含从 a 到 b (包括 a 和 b )的所有值的区间。 a 的值不能超过 b 

//半开区间运算符
//半开区间运算符( a..<b )定义一个从 a 到 b 但不包括 b 的区间。 之所以称为半开区间，是因为该区间 包含第一个值而不包括最后的值。
//半开区间的实用性在于当你使用一个从 0 开始的列表(如数组)时，非常方便地从0数到列表的长度。

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])") }
// 第 1 个人叫 Anna // 第 2 个人叫 Alex // 第 3 个人叫 Brian // 第 4 个人叫 Jack

//我们可以组合多个逻辑运算符来表达一个复合逻辑:
let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = false
let knowsOverridePassword = true

    if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"


//如果我们输入了正确的密码并通过了视网膜扫描，或者我们有一把有效的钥匙，又或者我们知道紧急情况下重置的密码，我们就能把门打开进入。

//Swift 逻辑操作符 && 和 || 是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左 边的子表达式。

//用括号
if ((enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword)
{
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// 输出 "Welcome!"


