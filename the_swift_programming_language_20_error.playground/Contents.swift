


enum VendingMachineError: Error {
    case invalidSelection //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock //缺货
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)//抛出错误


func canThrowErrors() throws -> String
func cannotThrowErrors() -> String


struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        
        guard let item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }
}





let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)//因为 vend(itemNamed:) 方法能抛出错误，所以在调用的它时候在它前面加了 try 关 键字。
}




struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}



do {
    
 try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}



var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
    
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
// 打印 “Insufficient funds. Please insert an additional 2 coins.”



func someThrowingFunction() throws -> Int {
    // ...
}
let x = try? someThrowingFunction()
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}


func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}




let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")


func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() { // 处理文件。
        }
        // close(file) 会在这里被调用，即作用域的最后。
    }
}




