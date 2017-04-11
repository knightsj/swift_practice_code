

//------------------------------------ 存储属性  -------------------------------------------

struct FixedLengthRange {
    var firstValue: Int//变量存储属性
    let length: Int//常量存储属性
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3) // 该区间表示整数0，1，2
rangeOfThreeItems.firstValue = 6// 该区间现在表示整数6，7，8




//如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行:
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4) // 该区间表示整数0，1，2，3
//rangeOfFourItems.firstValue = 6// 尽管 firstValue 是个变量属性，这里还是会报错

//引用类型的实例赋给了常量，可以修改这个常量的var属性
class Persons {
    var name = "Jack"
    let sex = "Male"
}

let onePerson = Persons();
onePerson.name = "Bob"

//-------------------------------- 延迟存储属性 ---------------------------------------------


//DataImporter 是一个负责将外部文件中的数据导入的类。 这个类的初始化会消耗不少时间。
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()//耗时操作
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建

//DataManager 管理数据时也可能不从文件中导入数据。所以当 DataManager 的实例被创建时，没必要创建一个 DataImporter 的实例，更明智的做法是第一次用到 DataImporter 的时候才去创建它。


//---------------------------------- 计算属性 ---------------------------------------------

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {//计算属性，center是通过origin和size的变化而变化的
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))

//初始center
square.center = Point(x: 15.0, y: 15.0)
print(square.center)

//改变origin,center改变
square.origin = Point(x: 30.0, y: 30.0)
print(square.center)


//简化的setter
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
            origin.x = newValue.x - (size.width / 2)//newValue
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//只读计算属性

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {//可以去掉get关键字和花括号
        return width * height * depth
    }
}

//---------------------------------- 属性观察器 ---------------------------------------------

class StepCounter {
    
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }else if totalSteps == oldValue {
                print("same steps")
            }else{
                print("minus \(oldValue - totalSteps) steps")
            }
        }
    }
}
let stepCounter = StepCounter()

stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps

stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps

stepCounter.totalSteps = 360
// About to set totalSteps to 360
// same steps

stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

stepCounter.totalSteps = 796
// About to set totalSteps to 896
// minus 100 steps


//---------------------------------- 全局变量和局部变量 ---------------------------------------------


//- 全局变量是在函数、方法、闭包或任何类型之外定义的变量。
//- 局部变量是在函数、方法或闭包内部定义的变量。


//=========属性观察器

//在新的值被设置之前调用
//在新的值被设置之后立即调用


//在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对父 类的实现进行重写。下面的例子演示了存储型和计算型类型属性的语
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
        
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
// 打印 "Some value." SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// 打印 "Another value.” print(SomeEnumeration.computedTypeProperty) // 打印 "6"
print(SomeClass.computedTypeProperty)
// 打印 "27"

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            
            if currentLevel > AudioChannel.thresholdLevel {
                // 将当前音量限制在阀值之内
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels { // 存储当前音量作为新的最大输入音量 AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

//在第一个检查过程中，didSet 属性观察器将 currentLevel 设置成了不同的值，但这不会造成属性观察器被 再次调用。




