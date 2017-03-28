

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



//你不必在你的代码里面经常写 self 

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
}
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(x:1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// 打印 "This point is to the right of the line where x == 1.0"

