
//Swift 的 String 类型与 Foundation NSString 类进行了无缝桥接。Foundation 也可以对 String 进行扩 展，暴露在 NSString 中定义的方法


var emptyString = "" // 空字符串字面量 
var anotherEmptyString = String() // 初始化方法
let someString = "Some string literal value"

someString.isEmpty
emptyString.isEmpty

someString + "sdfsdf" //不报错
//someString = "dfsdf" 报错

anotherEmptyString = "some"


//字符串是值类型
//Swift 的 String 类型是值类型。 如果您创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数/ 方法中传递时，会进行值拷贝。


//characters 属性
for character in "Dogs".characters {
    print(character)
}

//从一个元素是character的数组转化为string
let mark:Character = "!"
let characters:[Character] = ["2","3","d"]
print(characters)
let string = String(characters)
print(string)

var sentence = "I "+"like "+"apple"
sentence.append(mark)//只限于var

//字符串插值
let count = 3
var goods = "please give me \(count) apples";

//Swift 的 String 和 Character 类型是完 全兼容 Unicode 标准的。

let characters1 = "sdfdsfwefsdfdsfe sdfsdf we232rf"
print(characters1.characters)
print(characters1.characters.count)

//每一个string值都有一个关联的索引(index)类型,string.Index 它对应着字符串中的每一个character的位置。
//
//前面提到，不同的字符可能会占用不同数量的内存空间，所以要知道character的确定位置，就必须从string开头遍历每一个Unicode 标量直到结尾。因此，Swift 的字符串不能用整数(integer)做索引。

//startIndex 是string的第一个character的索引
//endIndex 获取 最后一个位置的索引
//因此，endIndex不能作为一个字符串的有效下标。如果string是空串,startIndex和endIndex是相等的

let greeting = "Guten Tag!"
greeting[greeting.startIndex] // G

greeting[greeting.index(before: greeting.endIndex)] // G

greeting[greeting.index(after: greeting.startIndex)] // u

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]// a

//greeting[greeting.endIndex] 错误


//使用 characters 属性的 indices 属性会创建一个包含全部索引的范围(Range)，用来在一个字符串中访问单 个字符。
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}

//print(greeting.characters.indices)


var welcome = "hello"
welcome.insert("!", at: welcome.endIndex) // welcome 变量现在等于 "hello!"
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
// welcome 变量现在等于 "hello there!"


welcome.remove(at: welcome.index(before: welcome.endIndex)) // welcome 现在等于 "hello there"
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome)
// welcome 现在等于 "hello"

//比较字符串
//Swift 提供了三种方式来比较文本值:字符串字符相等、前缀相等和后缀相等。

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// 打印输出 "These two strings are considered equal"


//通过调用字符串的 hasPrefix(_:) / hasSuffix(_:) 
let hasprefix1 = quotation.hasPrefix("We")
let hasprefix2 = quotation.hasPrefix("x")
let hassuffix1 = quotation.hasSuffix("I")
let hassuffix2 = quotation.hasSuffix("I.")



//您可以通过遍历 String 的 utf8 属性来访问它的 UTF-8 表示。 其为 String.UTF8View 类型的属性， UTF8View 是 无符号8位 ( UInt8 ) 值的集合，每一个 UInt8 值都是一个字符的 UTF-8 表示:
quotation.utf8
//您可以通过遍历 String 的 utf16 属性来访问它的 UTF-16 表示
quotation.utf16












