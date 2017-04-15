//泛型代码让你能够根据自定义的需求，编写出适用于任意类型、灵活可重用的函数及类型。它能让你避免代码的
//重复，用一种清晰和抽象的方式来表达代码的意图。

//泛型所解决的问题
func swapTwoInts(_ a: inout Int, _ b: inout Int) { let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoStrings(_ a: inout String, _ b: inout String) { let temporaryA = a
    a = b
    b = temporaryA
}
func swapTwoDoubles(_ a: inout Double, _ b: inout Double) { let temporaryA = a
    a = b
    b = temporaryA
}

//在实际应用中，通常需要一个更实用更灵活的函数来交换两个任意类型的值，幸运的是，泛型代码帮你解决了这
//种问题。

func swapTwoValues<T>(_ a: inout T, _ b: inout T) { let temporaryA = a
    a = b
    b = temporaryA
}
//占位类型名没有指明 T 必须是什么类型，但是它指明了 a 和 b 必须是同一类型 T ，无论 T 代表什么类型。只有 swapTwoValues(_:_:) 函数在调用时，才能根据所传入的实际类型决定 T 所代表的类型。

//swapTwoValues(_:_:) 函数现在可以像 swapTwoInts(_:_:) 那样调用，不同的是它能接受两个任意类型的 值，条件是这两个值有着相同的类型。swapTwoValues(_:_:) 函数被调用时，T 所代表的类型都会由传入的值 的类型推断出来。

//============== 命名类型参数
//在大多数情况下，类型参数具有一个描述性名字，例如Dictionary中的key和value，以及array中的Element，这可以告诉阅读代码的人这些类型参数和泛型函数之间的关系

//请始终使用大写字母开头的驼峰命名法(例如T和MyTypeParameter)来为类型参数命名，以表明它们是占 位类型，而不是一个值。

//泛型类型

struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// 栈中现在有 4 个字符串

//扩展
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}



