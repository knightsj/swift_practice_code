//集合类型

//Swift 语言提供 Arrays 、 Sets 和 Dictionaries 三种基本的集合类型用来存储集合数据。数组(Arrays)是有序数据的集。集合(Sets)是无序无重复数据的集。字典(Dictionaries)是无序的键值对的集。

//Swift 的 Arrays 、 Sets 和 Dictionaries 类型被实现为泛型集合

//let var

//数组
var someInts = [Int]()
print(someInts.count)

someInts.append(3)
someInts.append(5)
print(someInts)

//空数组
someInts = [];
print(someInts)

//创建一个带有默认值的数组
var threeItems = Array(repeatElement(3, count: 10))
print(threeItems)

var twoItems = Array(repeatElement(9, count: 5))
print(twoItems)

//数组相加
var finalItems = threeItems + twoItems
print(finalItems)

//字面量数组
var items :[String] = ["apple","banana","peach"]
var items1 = ["apple","banana","peach"]//类型推断机制
var integers :[Int] = [3,3,2,3,5]


let res = items.isEmpty

items.append("strawberry")
items += ["milk","pie"]

items[0] = "pieapple"
print(items)
items[0...2] = ["juice"]//可以个数不一致
print(items)

items.insert("pie", at: 0)
items.remove(at: 0)
print(items)

items.removeLast()
print(items)
//可以使用 removeLast() 方法而不是 remove(at:) 方法来避免我们需要获 取数组的 count 属性。就像后者一样，前者也会返回被移除的数据项:

for item in items {
    print(item)
}


//enumerated() 返回 一个由每一个数据项索引值和数据值组成的元组
for (index,item) in items.enumerated(){
    print("Index:\(index) is \(item)")
}

//set
//集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次 时可以使用集合而不是数组。

//集合类型的哈希值 一个类型为了存储在集合中，该类型必须是可哈希化的--也就是说，该类型必须提供一个方法来计算它的哈希 值。一个哈希值是 Int 类型的，相等的对象哈希值必须相同，比如 a==b ,因此必须 a.hashValue == b.hashValue。

var ob1 = "12"
var ob2 = ob1
var equal = ob1.hashValue == ob2.hashValue

//Swift 的所有基本类型(比如 String , Int , Double 和 Bool )默认都是可哈希化的，可以作为集合的值的类型或 者字典的键的类型。

//你可以使用你自定义的类型作为集合的值的类型或者是字典的键的类型，但你需要使你的自定义类型符合 Swift 标准库中的 Hashable 协议。符合 Hashable 协议的类型需要提供一个类型为 Int 的可读属性 hashValue 。由类 型的 hashValue 属性返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。

//因为 Hashable 协议符合 Equatable 协议，所以遵循该协议的类型也必须提供一个"是否相等"运算符( == )的实 现。这个 Equatable 协议要求任何符合 == 实现的实例间都是一种相等的关系。也就是说，对于 a,b,c 三个值来 说， == 的实现必须满足下面三种情况:
//• a == a (自反性)
//• a == b 意味着 b == a (对称性)
//• a == b && b == c 意味着 a == c (传递性)

var letters = Set<Character>()
var names:Set<String> = ["Rock","Classical","Hip"]
//只允许存储string类型的值

names.isEmpty
names.insert("Jim")
print(names)
var removedName = names.remove("Nancy")//如果取消的名字不存在，则返回nil
var removedName1 = names.remove("Jim")//如果取消的元素存在，则返回被取消的元素

//是否包括特定的值
names.contains("Bruce")
names.contains("Rock")

for name in names
{
    print("everyname:\(name)")
}


//集合操作
//使用 intersection(_:) 方法根据两个集合中都包含的值创建的一个新的集合。
//使用 symmetricDifference(_:) 方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
//使用 union(_:) 方法根据两个集合的值创建一个新的集合
//使用 subtracting(_:) 方法根据不在该集合中的值创建一个新的集合


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()// [1, 2, 9]


//集合关系
//使用“是否相等”运算符( == )来判断两个集合是否包含全部相同的值。
//使用 isSubset(of:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
//使用 isSuperset(of:) 方法来判断一个集合中包含另一个集合中所有的值。
//使用 isStrictSubset(of:) 或者 isStrictSuperset(of:) 方法来判断一个集合是否是另外一个集合的子集合或 者父集合并且两个集合并不相等。
//使用 isDisjoint(with:) 方法来判断两个集合是否不含有相同的值(是否没有交集)。



//字典
//一个字典的 Key 类型必须遵循 Hashable 协议，就像 Set 的值类型。
//var namesOfIntegers = Int: String
// namesOfIntegers 是一个空的 [Int: String] 字典

//namesOfIntegers[16] = "sixteen"
// namesOfIntegers 现在包含一个键值对
//namesOfIntegers = [:]
// namesOfIntegers 又成为了一个 [Int: String] 类型的空字典


var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//airports 字典被声明为一种 [String: String] 类型，这意味着这个字典的键和值都是 String 类型。
//add
airports["LHR"] = "London"
airports.updateValue("JiLIn", forKey: "JL")
print(airports)
airports.updateValue("LLLLL", forKey: "LHR")
print(airports)



airports["APL"] = "Apple Internation"

var fullname = airports["APL"]

airports["APL"] = nil


var removed1 = airports.removeValue(forKey: "aaa")//nil
var removed2 = airports.removeValue(forKey: "LHR")//LLLLL

//每一个字典中的数据项都以 (key, value) 元组形式返回

for (airportCode, airportName) in airports {
    print("airport code:\(airportCode) and airport name:\(airportName)")
}

for airportCode in airports.keys {
    print(airportCode)
}

for airportName in airports.values {
    print(airportName)
}


let airportCodesArr = airports.keys
let airportNamesArr = airports.values

for code in airportCodesArr {
    print(code)
}

for name in airportNamesArr {
    print(name)
}


























