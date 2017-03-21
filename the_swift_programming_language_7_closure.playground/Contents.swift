//闭包

//闭包可以捕获和存储其所在上下文中任意常量和变量的引用。被称为包裹常量和变量。 Swift 会为你管理在捕获 过程中涉及到的所有内存操作。


//- 全局函数是一个有名字但不会捕获任何值的闭包
//- 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
//- 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包

//鼓励在常见场景中进行语法优化，主要优化如下:
//- 利用上下文推断参数和返回值类型
//- 隐式返回单表达式闭包，即单表达式闭包可以省略 return 关键字 • 参数名称缩写
//- 尾随闭包语法


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let sortedNames = names.sorted()

func backward(_ s1:String, _ s2: String) ->Bool{
    return s1 > s2
}

var revsersedNames = names.sorted(by: backward)
//闭包表达式参数 可以是 in-out 参数，但不能设定默认值。也可以使用具名的可变参数(译者注:但是如果可变 参数不放在参数列表的最后一位的话，调用闭包的时时编译器将报错。可参考这里)。元组也可以作为参数和返 回值。

revsersedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})


//根据上下文推断类型
//sorted(by:)方法被一个字符串数组调用，因此它的参数类型必须是：(String, String) -> Bool 
//所以String String Bool 类型并不需要作为闭包表达式定义的一部分
revsersedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )


//单表达式闭包隐式返回
revsersedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
//如果是单行返回，可以直接省略return


//参数名称缩写
//Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0 ， $1 ， $2 来顺序调用闭包的参数，以此类推。

//如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会 通过函数类型进行推断。in 关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成:

revsersedNames = names.sorted(by: { $0 > $1 } )


//运算符方法
//Swift 的 String 类型定义了关于大于 号(>)的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值
revsersedNames = names.sorted(by: >)







