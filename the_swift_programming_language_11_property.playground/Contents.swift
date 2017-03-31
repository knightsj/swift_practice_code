
//存储属性存储常量或变量作为实例的一部分，而计算属性计算(不是存
//    储)一个值。计算属性可以用于类、结构体和枚举，存储属性只能用于类和结构体。
//
//存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接作用于类型本身，这种属性称为类型属性。

//还可以定义属性观察器来监控属性值的变化，以此来触发一个自定义的操作。属性观察器可以添加到自己定义的存储属性上，也可以添加到从父类继承的属性上。


//存储属性：一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属性(用关键字 var 定义)，也可以是常量存储属性(用关键字 let 定义)。

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3) // 该区间表示整数0，1，2
rangeOfThreeItems.firstValue = 6
// 该区间现在表示整数6，7，8


//FixedLengthRange 的实例包含一个名为 firstValue 的变量存储属性和一个名为 length 的常量存储属 性。在上面的例子中，length 在创建实例的时候被初始化，因为它是一个常量存储属性，所以之后无法修改它 的值。

//
//如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行:
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4) // 该区间表示整数0，1，2，3
//rangeOfFourItems.firstValue = 6// 尽管 firstValue 是个变量属性，这里还是会报错

//因为 rangeOfFourItems 被声明成了常量(用 let 关键字)，即使 firstValue 是一个变量属性，也无法再 修改它了。


//这种行为是由于结构体(struct)属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常 量。

//====延迟存储属性
//
//延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存 储属性。

//必须将延迟存储属性声明成变量(使用 var 关键字)，因为属性的初始值可能在实例构造完成之后才会得 到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。

//========计算属性
//计算属性不直接存储值，而是提供一个 getter 和一个可 选的 setter，来间接获取和设置其他属性或变量的值。

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {//计算属性
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    } }
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))") // 打印 "square.origin is now at (10.0, 10.0)”



//如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue 。下面是使用了简化 sett er 声明的 Rect 结构体代码:

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    } }


//只读计算属性

//只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访 问，但不能设置新的值。
//
//必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。 关键字只用来声明 常量属性，表示初始化后再也无法修改的值。



//=========属性观察器

//在新的值被设置之前调用
//在新的值被设置之后立即调用





