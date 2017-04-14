//析构


//在类的定义中，每个类最多只能有一个析构器，而且析构器不带任何参数，如下所示:


//deinit {
//    // 执行析构过程
//}

//- 不能主动调用析构器。
//- 析构器是在实例释放发生前被自动调用。
//- 子类继承了父类的析构器，并且在子类析构器
//实现的最后，父类的析构器会被自动调用。
//- 即使子类没有提供自己的析构器，父类的析构器也同样会被调用。
//- 所以析构器可以访问实例的所有属性，并且可以根据那些属
//性可以修改它的行为(比如查找一个需要被关闭的文件)。



class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}



class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        //析构器的作用只是将玩 家的所有硬币都返还给 Bank 对象
        Bank.receive(coins: coinsInPurse)
        print("\n====Player has left the game")
    }
}



var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins") // 打印 "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")// 9900


playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins") //2100
print("The bank now only has \(Bank.coinsInBank) coins left") //7900


playerOne = nil
print("The bank now has \(Bank.coinsInBank) coins") // 打印 "The bank now has 10000 coins"



