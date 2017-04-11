

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
    func decrease(){
        count -= 1
    }
}

let counter = Counter()
counter.increment(by:3)
counter.increment(by:3)
counter.increment(by:3)
print(counter.count)

class Counter1 {
    var count = 0
    private var priCount = 0
    func increment() {
        count += 1
        priCount = count + 3
        print("priCount is \(priCount)")
    }
}

let counter1 = Counter1()
counter1.increment()
counter1.increment()
print(counter1.count)




//你不必在你的代码里面经常写 self
struct Point1 {
    var x1 = 0.0, y1 = 0.0
    func isToTheRightOfX(x1: Double) -> Bool {
        return self.x1 > x1//参数和实例变量名字相同
    }
}

let somePoint1 = Point1(x1: 4.0, y1: 5.0)
if somePoint1.isToTheRightOfX(x1:1.0) {
    print("This point is to the right of the line where x == 1.0")
}
//如果不使用 self 前缀，Swift 就认为两次使用的 x 都指的是名称为 x 的函数参数。



struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
//更改结构体
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(deltaX: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))") // 打印 "The point is now at (3.0, 4.0)"


struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

//类型方法
struct LevelTracker {
    
    static var highestUnlockedLevel = 1//类型属性
    var currentLevel = 1
    
    static func unlock(_ level: Int) {//类型方法
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {//类型方法
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    } }


var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)") // 打印 "highest unlocked level is now 2"


player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// 打印 "level 6 has not yet been unlocked"
