//析构

//静态方法：存钱取钱的方法，还有一个余额
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



