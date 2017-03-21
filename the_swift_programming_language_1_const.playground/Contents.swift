
//基础部分

//常量
//在 Swift 中，广泛的使用着值不可变的 变量，它们就是常量，而且比 C 语言的常量更强大。在 Swift 中，如果你要处理的值不需要改变，那使用常量 可以让你的代码更加安全并且更清晰地表达你的意图。

//元祖
//Swift 还增加了 Objective-C 中没有的高阶数据类型比如元组(Tuple)。元组可以让你 创建或者传递一组数据，比如作为函数的返回值时，你可以用一个元组可以返回多个值。

//可选类型
//用于处理值缺失的情况。可选表示 “那儿有一个值，并且它等于 x ” 或者 “那儿没有值” 。可选有点像在 Objective-C 中使用   ，但是它可以用在任何类型上，不仅仅是 类。可选类型比 Objective-C 中的   指针更加安全也更具表现力

//类型安全
//Swift 是一门类型安全的语言，这意味着 Swift 可以让你清楚地知道值的类型。如果你的代码期望得到一个 ，类型安全会阻止你不小心传入一个   。同样的，如果你的代码期望得到一个 ，类型安全会
//阻止你意外传入一个可选的   。类型安全可以帮助你在开发阶段尽早发现并修正错误。

//========================== 常量和变量 ==========================

//如果你的代码中有不需要改变的值，请使用 let 关键字将它声明为常量。只将需要改变的值声明为变量。
//不能将常量与变量进行互转。

var x = 20,y = 10, z = 100
x = 100
print(x)

let a = 10, b = 20, c = 200

//类型标注
var name:String
name = "2"
name + "d"
print(name)

//一般来说你很少需要写类型标注。如果你在声明常量或者变量的时候赋了一个初始值，Swift可以推断出这个常 量或者变量的类型

//如果你需要使用与Swift保留关键字相同的名称作为常量或者变量名，你可以使用反引号(`)将关键字包围的方 式将其作为名字使用。无论如何，你应当避免使用关键字作为常量或变量名，除非你别无选择

//输出
var hello = "hellow world"
print("say \(hello)")

//分号
//有一种情况下必须要用分号，即你打算在同一行内写多条独立的语句

//========================== 整数 ==========================
//整数可以是 有符号 (正、负、零)或者 无符号 (正、零)。整数类型采用大写命名 法。

let minValue = UInt8.min // minValue 为 0，是 UInt8 类型 
let maxValue = UInt8.max // maxValue 为 255，是 UInt8 类型
print(maxValue)

//在32位平台上，Int  和  Int32 长度相同。
//在64位平台上，  Int 和  Int64 长度相同。


//特殊的无符号类型 UInt

//在32位平台上，UInt 和  UInt32 长度相同。
//在64位平台上，UInt 和  UInt64 长度相同。

//尽量不要使用 UInt ，除非你真的需要存储一个和当前平台原生字长相同的无符号整数。除了这种情况，最好使 用 Int ，即使你要存储的值已知是非负的。统一使用 Int 可以提高代码的可复用性，避免不同类型数字之间的 转换，并且匹配数字的类型推断.


//========================== 浮点数 ==========================
//浮点类型比整数类型表示的范围更大，可以存储比 Int 类型更大或者更小的数字。Swift 提供了两种有符号浮 点数类型:
//• Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。
//• Float表示32位浮点数。精度要求不高的话可以使用此类型。

//Double 精确度很高，至少有15位数字，而 Float 只有6位数字。选择哪个类型取决于你的代码需要处理的值的
//范围，在两种类型都匹配的情况下，将优先选择 Double

// ========================== 类型安全 ==========================
//是类型安全的，所以它会在编译你的代码时进行类型检查(type checks)，并把不匹配的类型标记 为错误。这可以让你在开发的时候尽早发现并修复错误。

//========================== 类型推断 ==========================
//如果你没有显式指定类型，Swift 会使用类型推断(type inference)来选择合适的类型。有 了类型推断，编译器可以在编译代码的时候自动推断出表达式的类型。原理很简单，只要检查你赋的值即可。

//当推断浮点数的类型时，Swift 总是会选择 Double 而不是 Float 。
//表达式中同时出现了整数和浮点数，会被推断为 Double 类型:

//数值型字面量
//    • 一个十进制数，没有前缀
//    • 一个二进制数，前缀是 0b
//    • 一个八进制数，前缀是 0o
//    • 一个十六进制数，前缀是 0x

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
// 二进制的17 // 八进制的17 // 十六进制的17



//整数和浮点数都可以添加额外的零并且包含下划线，并不会影
//响字面量:
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


//浮点字面量可以是十进制(没有前缀)或者是十六进制(前缀是 0x )。小数点两边必须有至少一个十进制数 字(或者是十六进制的数字)。十进制浮点数也可以有一个可选的指数(exponent)，通过大写或者小写的 e 来 指定;十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定。

//• 1.25e2 表示 1.25 × 10^2，等于 125.0 。
//• 1.25e-2 表示 1.25 × 10^-2，等于 0.0125 。
//
//• 0xFp2 表示 15 × 2^2，等于 60.0 。
//• 0xFp-2 表示 15 × 2^-2，等于 3.75 。

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0


//整数转换
//不同整数类型的变量和常量可以存储不同范围的数字。 Int8 类型的常量或者变量可以存储的数字范围是 -128 ~ 1 27 ，而 UInt8 类型的常量或者变量能存储的数字范围是 0 ~ 255 。如果数字超出了常量或者变量可存储的范 围，编译的时候会报错:

//let cannotBeNegative: UInt8 = -1
// UInt8 类型不能存储负数，所以会报错
//let tooBig: Int8 = Int8.max + 1;
// Int8 类型不能存储超过最大值的数，所以会报错
//
//在下面的例子中，常量 twoThousand 是 UInt16 类型，然而常量 one 是 UInt8 类型。它们不能直接相 加，因为它们类型不同。所以要调用 UInt16(one) 来创建一个新的 UInt16 数字并用 one 的值来初始化，然后使用 这个新数字来计算:

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine // pi 等于 3.14159，所以被推测为 Double 类型
//这个例子中，常量 three 的值被用来创建一个 Double 类型的值，所以加号两边的数类型须相同。如果不进行 转换

//========================== 类型别名 ==========================

typealias AudioSample = UInt16
//定义了一个类型别名之后，你可以在任何使用原始名的地方使用别名:
var maxAmplitudeFound = AudioSample.min // maxAmplitudeFound 现在是 0
//本例中， AudioSample 被定义为 UInt16 的一个别名。因为它是别名， AudioSample.min 实际上是 UInt16.mi n ，所以会给 maxAmplitudeFound 赋一个初值 0 。


//布尔值
let orangesAreOrange = true
let turnipsAreDelicious = false

//========================== 元组 ==========================
//把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。

let http404Error = (404,"Not Found");

let (code,message) = http404Error
print(code)
print(message)

let (onlyCode,_) = http404Error;
print(onlyCode)

print(http404Error.0,http404Error.1)

//作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个 (Int, String) 元组来描述是否 获取成功

//元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时使用，请使用类或者结构体而不是元组

//========================== 可选类型 ==========================
//使用可选类型(optionals)来处理值可能缺失的情况。
//可选类型表示:
//• 有值，等于 x
//或者
//• 没有值

//C 和 Objective-C 中并没有可选类型这个概念。最接近的是 Objective-C 中的一个特性，一个方法要不返回一 个对象要不返回 nil ， nil 表示“缺少一个合法的对象”。然而，这只对对象起作用——对于结构体，基本的 C 类型或者枚举类型不起作用。对于这些类型，Objective-C 方法一般会返回一个特殊值(比如 NSNotFoun
//    d )来暗示值缺失。这种方法假设方法的调用者知道并记得对特殊值进行判断。然而，Swift 的可选类型可以让 你暗示任意类型的值缺失，并不需要一个特殊值。


// String 值转换成一个 Int 
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

//因为该构造器可能会失败，所以它返回一个可选类型(optional) Int ，而不是一个 Int 。一个可选的 Int 被写作 Int? 而不是 Int 。问号暗示包含的值是可选类型，也就是说可能包含 Int 值也可能不包含值。

//========================== nil ==========================
var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404 
serverResponseCode = nil
// serverResponseCode 现在不包含值

var grage: Int = 300;
//grage = nil 报错


//nil 不能用于非可选的常量和变量。如果你的代码中有常量或者变量需要处理值缺失的情况，请把它们声明成对应的可选类型。

//如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil :
var surveyAnswer: String?
// surveyAnswer 被自动设置为 nil

//Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中， nil 是一个指向不存在对象的指 针。在 Swift 中， nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设 置为 nil ，不只是对象类型。

//强制解析


//你可以使用 if 语句和 nil 比较来判断一个可选值是否包含值。你可以使用“相等”(==)或“不 等”( != )来执行比较


if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// 输出 "convertedNumber contains some integer value."

//当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号( ! )来获取值。这个惊叹号表 示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析(forced unwrapping):

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// 输出 "convertedNumber has an integer value of 123."



//可选绑定
//使用可选绑定(optional binding)来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变 量。

//像下面这样在 if 语句中写一个可选绑定:

//if let constantName = someOptional {
//    statements
//}





if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

//
//“如果 Int(possibleNumber) 返回的可选 Int 包含一个值，创建一个叫做 actualNumber 的新常量并将可选 包含的值赋给它。”

//隐式解析可选类型

//有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。
//
//这种类型的可选状态被定义为隐式解析可选类型(implicitly unwrapped optionals)。把想要用作可选的类型 的后面的问号( String? )改成感叹号( String! )来声明一个隐式解析可选类型。

//当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用。隐式解析可选类型 主要被用在 Swift 中类的构造过程中


//你可以把隐式解析可选类型当做一个可以自动解析的可选类型。你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值的可选名字的结尾。

//错误处理

func canThrowAnError() throws{ // 这个函数有可能抛出错误
}



do {
    try canThrowAnError() // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}


func makeASandwich() throws {
    // ...
}

//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}

//makeASandwich()会抛出错误，所以包括在try表达式中。
//如果没有错误被抛出，eatASandwich()会被调用。
//如果一个匹配SandwichError.outOfCleanDishes的错误被抛出，则会调用washDishes()。






//========================== 断言 ==========================//
//使用断言进行调试

//断言会在运行时判断一个逻辑条件是否为 true 。从字面意思来说，断言“断言”一个条件是否为真。你可以使 用断言来保证在运行其他代码之前，某些重要的条件已经被满足。如果条件判断为 true ，代码运行会继续进 行;如果条件判断为 false ，代码执行结束，你的应用被终止。

let age = -3
assert(age >= -5, "A person's age cannot be less than zero") // 因为 age < 0，所以断言会触发


//如果不需要断言信息：

assert(age >= -5) // 因为 age < 0，所以断言会触发

//• 整数类型的下标索引被传入一个自定义下标实现，但是下标索引值可能太小或者太大。
//• 需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
//• 一个可选值现在是 nil ，但是后面的代码运行需要一个非 nil 值。

//断言可能导致你的应用终止运行，所以你应当仔细设计你的代码来让非法条件不会出现。然而，在你的应用发布之前，有时候非法条件可能出现，这时使用断言可以快速发现问题。






