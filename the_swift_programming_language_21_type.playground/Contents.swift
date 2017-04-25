

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

lass Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}


//Swift 的类型检测器能够推断出 Movie 和 Song 有共 同的父类 MediaItem ，所以它推断出 [MediaItem] 类作为 library 的类型:



let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// 数组 library 的类型被推断为 [MediaItem]

//# 检查类型
//
//用类型检查操作符( is )来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回
//true ，否则返回 false 。


var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs") // 打印 “Media library contains 2 movies and 3 songs”


//# 向下转型
//
//你可以尝试向下转到它的子类
//型，用类型转换操作符(as? 或 as!)。
//
//- 当你不确定向下转型可以成功时，用类型转换的条件形式( as? )。条件形式的类型转换总是返回一个可选
//值，并且若下转是不可能的，可选值将是 nil 。这使你能够检查向下转型是否成功。
//
//- 只有你可以确定向下转型一定会成功时，才使用强制形式( as! )。当你试图向下转型为一个不正确的类型
//时，强制形式的类型转换会触发一个运行时错误。



for item in library {
    if let movie = item as? Movie {//item下转
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {//item下转
        print("Song: '\(song.name)', by \(song.artist)")
    }
}

// Movie: 'Casablanca', dir. Michael Curtiz
// Song: 'Blue Suede Shoes', by Elvis Presley
// Movie: 'Citizen Kane', dir. Orson Welles
// Song: 'The One And Only', by Chesney Hawkes
// Song: 'Never Gonna Give You Up', by Rick Astley


//Any 和 AnyObject 的类型转换
//
//Swift 为不确定类型提供了两种特殊的类型别名:
//- Any 可以表示任何类型，包括函数类型。
//- AnyObject 可以表示任何类类型的实例
//
//使用 Any 类型来和混合的不同类型一起工作：

things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

