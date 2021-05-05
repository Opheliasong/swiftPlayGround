import UIKit

class Queue<T> {
    private var container:[T] = [T]()
    
    func enqueue(_ item:T) {
        container.append(item)
    }
    
    /// Queue에서 item을 꺼내온다.
    ///
    /// - Complexity : O(*1*)
    /// - Returns: 가장 최근에 삽입되었던 아이템
    func dequeue() -> T? {
        guard container.isEmpty == false else {
            return nil
        }
        return container.removeFirst()
    }
    
    var isEmpty:Bool {
        get {
            return container.count == 0
        }
    }
}

enum direction: Int {
    case left,right,top,bottom,other
}

enum collaps {
    case go,away,rollback
}

let what:collaps = .away
print(what)

var cities = ["HongKong", "Tokyo", "Seoul"]
var citiesSet:Set = ["HongKong", "Tokyo", "Seoul"]
citiesSet.insert("Seoul")
print(citiesSet.count)
for x in cities {
    if x == "Tokyo" {
        cities.append("Hanoi")
    }
}
print(cities)

let dir: Any = direction.other.rawValue
print(dir)

class Stack<T> {
    private var container:[T] = [T]()
    
    func push(_ item:T) {
        container.insert(item, at: container.count)
    }
    
    func pop() -> T? {
        guard container.isEmpty == false else {
            return nil
        }
        return container.removeLast()
    }
    
    var isEmpty:Bool {
        get {
            return container.count == 0
        }
    }
}

let seperator:String = "-------------"
var queue:Queue<String> = Queue<String>()

queue.enqueue("Hello")
queue.enqueue("World")

while queue.isEmpty == false {
    print(queue.dequeue())
}
queue.dequeue()

print(seperator)
var stack:Stack<String> = Stack<String>()
stack.push("Hello")
stack.push("World")
while stack.isEmpty == false {
    print(stack.pop())
}
print(seperator)

let str:String = "BLANCHE:   I don't want realism. I want magic!"
print(str.split(separator: " "))
print(str.components(separatedBy: " "))
var stringSplits = str.split(separator: " ")

let reversed = stringSplits.reversed()
stringSplits.reverse()
for i in stride(from: (stringSplits.count - 1), through: 0, by: -1) {
    print(stringSplits[i])
}
