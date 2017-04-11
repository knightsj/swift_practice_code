//下标
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])") // 打印 "six times three is 18"


struct Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    //构造器
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0,count: rows * columns)
    }
    
    //判断是否超过范围
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    //下标
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(self.indexIsValidForRow(row:row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row:row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix1 = Matrix(rows:2, columns:3)
print(matrix1)
matrix1[1,1] = 4//Matrix(rows: 2, columns: 3, grid: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
print(matrix1)//Matrix(rows: 2, columns: 3, grid: [0.0, 0.0, 0.0, 0.0, 4.0, 0.0])


