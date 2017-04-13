
//继承
//Vehicle不继承于任何类，属于基类
class Vehicle {
    
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}

//Bicycle是Vehicle的子类
class Bicycle: Vehicle {
    var hasBasket = false
}


let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")// 打印 "Bicycle: traveling at 15.0 miles per hour"


//重写属性
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

//重写属性观察器
class AutomaticCar: Car {
    override var currentSpeed: Double {
        
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}