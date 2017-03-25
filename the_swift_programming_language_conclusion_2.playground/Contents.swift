//============== 输入输出参数

//函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误(compile-time error)。这意味着你不能错 误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那 么就应该把这个参数定义为输入输出参数

//输入输出参数是函数对函数体外产生影响的另一种方式:更像一种数据加工,只加工参数
//输入输出参数不能有默认值，而且可变参数不能用 inout 标记。

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

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
