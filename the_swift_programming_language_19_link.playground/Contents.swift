

//可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。如果可选值有 值，那么调用就会成功;如果可选值是 nil ，那么调用将返回 nil 。
//    
//多个调用可以连接在一起形成一个调用 链，如果其中任何一个节点为 nil ，整个调用链都会失败，即返回 nil 。
//




class Person {
    var residence: Residence?
}
//class Residence {
//    var numberOfRooms = 1
//}

//let john = Person()

let roomCount = john.residence!.numberOfRooms//运行时错误

//可选链式调用提供了另一种访问 numberOfRooms 的方式，使用问号( ? )来替代原来的叹号( ! ):



if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印 “Unable to retrieve the number of rooms.”





john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印 “John's residence has 1 room(s).”





//class Person {
//    var residence: Residence?
//}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    //三个可选属性
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}


class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {//计算属性
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}




let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// 打印 “Unable to retrieve the number of rooms.”

//>因为john.residence 为nil


let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

//>在这个例子中，通过 john.residence 来设定 address 属性也会失败，因为 john.residence 当前为 nil 。
//createAddress



func createAddress() -> Address {
    print("Function was called.")
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}
john.residence?.address = createAddress()

//>没有任何打印消息，可以看出 createAddress() 函数并未被执行。

//通过可选链式调用来调用方法

//没有返回值的方法具有隐式的返回类型 Void ，如无返回值函数 (页 0)中所述。这 意味着没有返回值的方法也会返回 () ，或者说空的元组。
//
//如果在可选值上通过可选链式调用来调用这个方法，该方法的返回类型会是 Void? ，而不是 Void ，因为通过可选 链式调用得到的返回值都是可选的。这样==我们就可以使用 if 语句来判断能否成功调用 printNumberOfRooms() 方 法==，即使方法本身没有定义返回值。通过判断返回值是否为 nil 可以判断调用是否成功:


func printNumberOfRooms() {
    print("The number of rooms is \(numberOfRooms)")
}



if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// 打印 “It was not possible to print the number of rooms.”


//可以据此判断通过可选链式调用为属性赋值是否成功。在上面的通过可选链式调用访问属性 (页 0)的例 子中，我们尝试给 john.residence 中的 address 属性赋值，即使 residence 为 nil 。通过可选链式调用给属性赋 值会返回 Void? ，通过判断返回值是否为 nil 就可以知道赋值是否成功:


if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// 打印 “It was not possible to set the address.”


// 通过可选链式调用访问下标

//可以在一个可选值上访问下标，并且判断下标调用是否成功。
//
//通过可选链式调用访问可选值的下标时，应该将问号放在下标方括号的前面而不是后面。可选链式调用的问号一般直接跟在可选表达式的后面。




if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// 打印 “Unable to retrieve the first room name.”


可选链式调用来赋值:


john.residence?[0] = Room(name: "Bathroom")

>这次赋值同样会失败，因为residence目前是nil。

如果你创建一个Residence实例，并为其rooms数组添加一些Room实例，然后将 Residence实例赋值给john.residence，那就可以通过可选链和下标来访问数组中的元素:


let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// 打印 “The first room name is Living Room.”






// 连接多层可选链式调用




if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// 打印 “Unable to retrieve the address.”



//john.residence 现在包含一个有效的 Residence 实例。然而， john.residence.address 的值当前为 nil 。因 此，调用 john.residence?.address?.street 会失败。

//需要注意的是，上面的例子中， street 的属性为 String? 。 john.residence?.address?.street 的返回值也依然 是 String? ，即使已经使用了两层可选链式调用。



//如果为 john.residence.address 赋值一个 Address 实例，并且为 address 中的 street 属性设置一个有效值，我 们就能过通过可选链式调用来访问 street 属性:




let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// 打印 “John's street name is Laurel Street.”

//
//>在上面的例子中，因为 john.residence 包含一个有效的 Residence 实例，所以对 john.residence 的 address 属性 赋值将会成功。

// 在方法的可选返回值上进行可选链式调用

//在一个可选值上通过可选链式调用来调用方法，并且可以根据需要继续在方法的可选返回值上进行可选链式调用。
//
//通过可选链式调用来调用Address的buildingIdentifier()方法。这个方法返回 String? 类型的值。如上所述，通过可选链式调用来调用该方法，最终的返回值依旧会是 String? 类型:



if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
// 打印 “John's building identifier is The Larches.”


//如果要在该方法的返回值上进行可选链式调用，在方法的圆括号后面加上问号即可:




if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    } }
// 打印 “John's building identifier begins with "The".”


//在上面的例子中，在方法的圆括号后面加上问号是因为你要在buildingIdentifier() 方法的可选返回值上进行 可选链式调用，而不是方法本身。


