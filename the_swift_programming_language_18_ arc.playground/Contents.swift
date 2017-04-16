//arc

//===================== 引用计数：
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?//自动初始化为nil
var reference2: Person?//自动初始化为nil
var reference3: Person?//自动初始化为nil

reference1 = Person(name: "John Appleseed")
//由于 Person 类的新实例被赋值给了 reference1 变量，所以 reference1 到 Person 类的新实例之间建立了一个强 引用。正是因为这一个强引用，ARC 会保证 Person 实例被保持在内存中不被销毁。

reference2 = reference1//引用计数+1
reference3 = reference1//引用计数+1

reference1 = nil
reference2 = nil

reference3 = nil
// 打印 “John Appleseed is being deinitialized”


//===================== 循环引用：
class Person1 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment1?
    deinit { print("\(name) is being deinitialized") }
}
class Apartment1 {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person1?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person1?
var unit4A: Apartment1?

john = Person1(name: "John Appleseed")
unit4A = Apartment1(unit: "4A")

//注意感叹号是用来展开和访 问可选变量 john 和 unit4A 中的实例，这样实例的属性才能被赋值:
john!.apartment = unit4A
unit4A!.tenant = john

//不幸的是，这两个实例关联后会产生一个循环强引用,没有调用析构函数
john = nil
unit4A = nil



//===================== 弱引用：
class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment2?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person2?//weak属性
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john2: Person2?
var unit4A2: Apartment2?

john2 = Person2(name: "John Appleseed")
unit4A2 = Apartment2(unit: "4A")

john2!.apartment = unit4A2
unit4A2!.tenant = john2

john2 = nil// 打印 “John Appleseed is being deinitialized”

unit4A2 = nil// 打印 “Apartment 4A is being deinitialized”


//===================== 无主引用：
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer//无主引用
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var john3: Customer?

john3 = Customer(name: "John Appleseed")
john3!.card = CreditCard(number: 1234_5678_9012_3456, customer: john3!)

//Customer 实例持有对 CreditCard 实例的强引用，而 CreditCard 实例持有对 Customer 实例的无主引用。

john3 = nil
// 打印 “John Appleseed is being deinitialized”
// 打印 ”Card #1234567890123456 is being deinitialized”



//===================== 无主引用以及隐式解析可选属性：
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country//城市的所属国家是一定存在的
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)") // 打印 “Canada's capital city is called Ottawa”




