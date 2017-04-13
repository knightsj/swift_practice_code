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
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

// 1 x orange juice ?
// 1 x bacon ?
// 6 x eggs ?






