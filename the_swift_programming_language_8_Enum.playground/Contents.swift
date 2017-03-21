//Enum
//如果给枚举成员提供一个值(称为“原始”值)，则该值的类型可以是 字符串，字符，或是一个整型值或浮点数。

//switch 语句必须穷举所有情况。如果忽略了 .west 这 种情况，上面那段代码将无法通过编译，因为它没有考虑到 CompassPoint 的全部成员。强制穷举确保了枚举成员 不会被意外遗漏。



enum CompassPoint {
    case north
    case south
    case east
    case west
}

//与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的
//nt 例子中， north ， south ， east 和 west 不会被隐式地赋值为 0 ， 1 ， 2 和 3 。相反，这些枚举成员本身 就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。

//与 Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性。上面的最后一个例子，就是直接设 置了 someVideoMode 中 resolution 属性的 width 这个子属性，以上操作并不需要重新为整个 resolution 属性设 置新值。
