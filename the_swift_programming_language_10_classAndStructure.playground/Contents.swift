class SomeClass {
// 在这里定义类
}

struct SomeStructure {
// 在这里定义结构体
}

//在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。因此请使用UpperCamelCase这种方式来命名(如 SomeClass 和 SomeStructure 等)
//相反的，请使用 lowerCamelCase 这种方式为属性和方法命名

//存储属性是被捆绑和存储在类或结构体中的常量或变量

struct Resolution {
    var width = 0//存储属性
    var height = 0//存储属性
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//name 属性会被自动赋予一个默认值 nil ，意为“没有name 值”，因为它是一个可选类型

//生成实例
let someResolution = Resolution()//构造器语法生成实例
let someVideoMode = VideoMode()

//使用点语法访问属性


print(someVideoMode.resolution.width)//0
someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)//1280

//与 Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性。上面的最后一个例子，就是直接设 置了 someVideoMode 中 resolution 属性的 width 这个子属性，以上操作并不需要重新为整个 resolution 属性设 置新值。


//=====成员逐一构造器
let vga = Resolution(width:640, height:480)
//类实例没有默认的成员逐一构造器


//====结构体和枚举是值类型

//所有的基本类型:整数(Integer)、浮 点数(floating-point)、布尔值(Boolean)、字符串(string)、数组(array)和字典(dictionary)，都是 值类型，并且在底层都是以结构体的形式所实现。
//在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属 性，在代码中传递的时候都会被复制。
//

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
//因为 Resolution 是一个结构体，所以 的值其实是 hd 的一个拷贝副本，而不是 hd 本身。

//=====枚举
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}
// 打印 "The remembered direction is still .West"

//类是引用类型
//与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(alsoTenEighty.frameRate)
print(tenEighty.frameRate)

//因为类是引用类型，所以 tenEight 和 alsoTenEight 实际上引用的是相同的 VideoMode 实例。换句话说，它们是 同一个实例的两种叫法。

// tenEighty 和 alsoTenEighty 被声明为常量而不是变量。然而你依然可以改变 tenEighty.frameRate 和 alsoTenEighty.frameRate ，因为 tenEighty 和 alsoTenEighty 这两个常量的值并未改变。它们并不“存储”这 个 VideoMode 实例，而仅仅是对 VideoMode 实例的引用。

//==== 恒等运算符

//判定两个常量或者变量是否引用同一个类实例

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}


//等于”表示两个实例的值“相等”或“相同”


//==== 类还是结构体？

//结构体实例总是通过值传递，类实例总是通过引用传递。

//当符合一条或多条以下条件时，请考虑构建结构体:


//• 该数据结构的主要目的是用来封装少量相关简单数据值。
//• 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
//• 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
//• 该数据结构不需要去继承另一个既有类型的属性或者行为。




//Swift 中，许多基本类型，诸如 String ， Array 和 Dictionary 类型均以结构体的形式实现。这意味着被赋值给 新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
//Objective-C 中 NSString ， NSArray 和 NSDictionary 类型均以类的形式实现，而并非结构体。它们在被赋值或 者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。





