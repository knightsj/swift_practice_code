//构造

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit") // 打印 "The default temperature is 32.0° Fahrenheit”


struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {//外部参数名为fromFahrenheit，内部为fahrenheit
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fahrenheit: Double) {//外部参数名为fahrenheit，内部为fahrenheit
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8 + 10
    }
    
    init(fromKelvin kelvin: Double) {//外部参数名为fromKelvin，内部为kelvin
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0) // boilingPointOfWater.temperatureInCelsius 是 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15) // freezingPointOfWater.temperatureInCelsius 是 0.0


//response默认设置为nil
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()// 打印 "Do you like cheese?"
var responce = cheeseQuestion.response

if responce != nil {
    print("not nil")
}else{
    print("nil")//print
}
cheeseQuestion.response = "Yes, I do like cheese."


//常量属性可以在构造器中被修改
class SurveyQuestion1 {
    let text: String     //常量属性可以在构造器中被修改
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion1(text: "How about beets?")
beetsQuestion.ask()// 打印 "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"


//默认构造器
class ShoppingListItem {
    var name: String?//可选类型，默认设置为nil
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()


//值类型的构造器代理

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {} //没有任何构造过程，都是0
    
    init(origin: Point, size: Size) {//逐一构造器
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
print(basicRect.origin)//(0.0, 0.0)
print(basicRect.size)//(0.0, 0.0)



//子类重写构造器

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle: Vehicle {
    override init() {
        super.init()//确保 Bicycle 在修改属性之前，它所继承的属性 numberOfWheels 能被 Vehicle 类初始化
        numberOfWheels = 2
    }
}


//指定构造器和便利构造器实践

class Food {
    
    var name: String
    
    init(name: String) {//指定构造器
        self.name = name
    }
    
    convenience init() {//便利构造器
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {//子类的指定构造器
        self.quantity = quantity
        super.init(name: name)//调用父类的指定构造器
    }
    override convenience init(name: String) {//便利构造器
        self.init(name: name, quantity: 1)
    }
}

//尽管RecipeIngredient现将父类的指定构造器重写为了便利构造器，它依然提供了父类的所有指定构造器的实现。因此，RecipeIngredient会自动继承父类的所有便利构造器。

//三种构造器
let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.quantity)
print(oneMysteryItem.name)

let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)


class ShoppingListItem1: RecipeIngredient {
    
    var purchased = false//新增属性
    
    var description: String {//计算属性
        var output = "\(quantity) x \(name)"
        output += purchased ? " ?" : " ?"
        return output
    }
}

//由于它为自己引入的所有属性都提供了默认值，并且自己没有定义任何构造器， ShoppingListItem 将自动继承所 有父类中的指定构造器和便利构造器。

var breakfastList = [
    ShoppingListItem1(),
    ShoppingListItem1(name: "Bacon"),
    ShoppingListItem1(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//失败构造器

//结构体的可失败构造器

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

//传入字符串，构造成功
let someCreature = Animal(species: "Giraffe") // someCreature 的类型是 Animal? 而不是 Animal
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// 打印 "An animal was initialized with a species of Giraffe"

//传入空的字符串，构造失败
let anonymousCreature = Animal(species: "")
// anonymousCreature 的类型是 Animal?, 而不是 Animal
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
// 打印 "The anonymous creature could not be initialized"


//枚举类型的可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil }
    } }

//succeeded
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

//failed
let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}


//带原始值的枚举类型的可失败构造器
//带原始值的枚举类型会自带一个可失败构造器 init?(rawValue:) ，该可失败构造器有一个名为 rawValue 的参 数，其类型和枚举类型的原始值类型一致，
enum TemperatureUnit1: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

//succeeded
let fahrenheitUnit1 = TemperatureUnit1(rawValue: "F")
if fahrenheitUnit1 != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

//failded
let unknownUnit1 = TemperatureUnit1(rawValue: "X")
if unknownUnit1 == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

//构造失败的传递



class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)//父类的可失败构造器
    }
}

//重写一个可失败构造器
class Document {
    var name: String?
    // 该构造器创建了一个 name 属性的值为 nil 的 document 实例 
    init() {}
    // 该构造器创建了一个 name 属性的值为非空字符串的 document 实例 
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

//确保了无论是使用 init() 构造器，还是使用 init(name:) 构造器并为参数传递空字符串，生成的实例中的name 属性总有初始 "[Untitled]" :

class AutomaticallyNamedDocument: Document {
    
    override init() {
        super.init()
        self.name = "[Untitled]"//子类用另一种方式处理了空字符串的情况
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

//在子类的非可失败构造器中使用强制解包来调用父类的可失败构造器
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!//强制解包
    }
}

//如果在调用父类的可失败构造器 init?(name:) 时传入的是空字符串，那么强制解包操作会引发运 行时错误。不过，因为这里是通过非空的字符串常量来调用它，所以并不会发生运行时错误。

//可失败构造器 init!
//可失败构造器( init! )，该可失败构造器将会构建一个对应类型的隐式解 包可选类型的对象。

//你可以在 init? 中代理到 init! ，反之亦然。你也可以用 init? 重写 init! ，反之亦然。你还可以用 init 代理 到 init! ，不过，一旦 init! 构造失败，则会触发一个断言。

//必要构造器

class SomeClass {
    required init() {
        // 构造器的实现代码
    }
    
}




