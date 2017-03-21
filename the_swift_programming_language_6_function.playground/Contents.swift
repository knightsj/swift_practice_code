//函数

//参数可以提供默认值，以简化函数调用。参数也可以既当做 传入参数，也当做传出参数，也就是说，一旦函数执行结束，传入的参数值将被修改。

//在 Swift 中，每个函数都有一个由函数的参数值类型和返回值类型组成的类型


func greet(person:String) -> String{
    let greeting = "Hello" + person + "!"
    return greeting
}



func greet1(person:String) -> String{
    return "Hello" + person + "!"
}

greet(person: "么么哒")
greet1(person: "么么哒")

//函数的名字是 greet1(person:)

//无参数函数
func sayHelloWorld() -> String {
    return "hello, world"
}

//多参数函数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greet1(person: person)
    } else {
        return greet(person: person)
    }
}

greet(person: "jack", alreadyGreeted: true)
//greet(person:alreadyGreeted:)


//无返回值函数
func greet2(person: String) {
    print("Hello, \(person)!")
}

greet2(person: "Bruce")

//函数依然返回了值。没有定义返回类型的函数会返回一 个特殊的 Void 值。它其实是一个空的元组(tuple)，没有任何元素，可以写成()。

//返回值可以被忽略，但定义了有返回值的函数必须返回一个值，如果在函数定义底部没有返回任何值，将导致编 译时错误(compile-time error)。

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)//忽略返回值
}
printAndCount(string: "hello, world")
// 打印 "hello, world" 并且返回值 12 printWithoutCounting(string: "hello, world") // 打印 "hello, world" 但是没有返回任何值

//多个返回值

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        } }
    return (currentMin, currentMax)
}


var res = minMax(array: [2,4,6])
print(res.max,res.min)
//因为元组的成员值已被命名，因此可以通过 . 语法来检索找到的最小值与最大值:

//可选元组返回类型
//如果函数返回的元组类型有可能整个元组都“没有值”，你可以使用可选的( optional ) 元组返回类型反映 整个元组可以是 nil 的事实。你可以通过在元组类型的右括号后放置一个问号来定义一个可选元组，例如 Int)? 或 (String, Int, Bool)?

//防止访问空数组
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//只有返回值？，才可以return nil


//参数标签和参数名称
//参数标签：调用
//参数名称：实现内部


func greet3(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet3(person: "Bill", from: "Cupertino"))
// 打印 "Hello Bill! Glad you could visit from Cupertino."

//忽略参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(1, secondParameterName: 2)

//默认参数值
func funtionOne(p1:Int,p2:Int = 12){
    print(p1 + p2)
}

funtionOne(p1: 20)
funtionOne(p1: 20, p2: 22)


//可变参数
func findMean(_ numbers:Double ...) -> Double{
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}

var result = findMean(2,3,5,1,2,4,3,4)
print(result)

//一个函数最多只能拥有一个可变参数

//============== 输入输出参数

//函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误(compile-time error)。这意味着你不能错 误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那 么就应该把这个参数定义为输入输出参数

//输入输出参数是函数对函数体外产生影响的另一种方式:更像一种数据加工,只加工参数
//输入输出参数不能有默认值，而且可变参数不能用 inout 标记。

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var firtValue = 20
var secondValue = 10
swap(&firtValue, &secondValue)
print(firtValue,secondValue)

//函数类型

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b }

//定义一个matchFunction的变量，类型是“两个int参数，返回一个int”的函数
var mathFunction:(Int,Int) -> Int = addTwoInts
print(mathFunction(2, 3))

mathFunction = multiplyTwoInts
print(mathFunction(2,3))


//================== 函数类型作为参数
//将一个函数作为当前函数的参数，将这个作为参数的函数的参数作为当前函数的其他参数
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
//它不关心传入函数是如 何实现的，只关心传入的函数是不是一个正确的类型

//================== 函数类型作为返回值
//需要做的是在返回箭头(->)后写一个完整的函数类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}


var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero 现在指向 stepBackward() 函数。

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")




//================= 嵌套函数
//嵌套函数是对外界不可见的，但是可以被它们的外围函数(enclosing function)调用。一个外围 函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用。
func chooseStepFunction1(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction1(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue1 != 0 {
    print("\(currentValue1)... ")
    currentValue1 = moveNearerToZero1(currentValue1)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!























