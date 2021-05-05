import UIKit
import Foundation
import System

struct Heap<T:Comparable> {
    private struct node<T:Comparable> {
        var val:T?
        init(_ item:T?) {
            val = item
        }
        
        init(_ item:T?, index:Int) {
            self.val = item
            self.index = index
        }
        
        var isEmpty:Bool {
            return val == nil
        }
        var index:Int = 0
        
        var parentIndex:Int {
            return (index - 1) / 2
        }
        
        var leftChildIndex:Int {
            return (index * 2) + 1
        }
        
        var rightChildIndex:Int {
            return (index * 2) + 2
        }
    }
    private var container:[node<T>] = [node<T>]()
    private var depth:Int = 0
        
    mutating func push(_ item: T) {
        let newNode = node<T>(item, index: container.count)
        container.append(newNode)
        if newNode.index == 0 {
            return
        }
        
        //compare for parent node val
        var iter:node<T> = newNode
        while iter.index != 0 {
            if container[iter.parentIndex].val! < iter.val! {
                let parentIndex = iter.parentIndex
                let iterIndex = iter.index
                swap(lhs: parentIndex, rhs: iterIndex)
                iter = container[parentIndex]
            } else {
                iter = container[iter.parentIndex]
                break
            }
        }
    }
    
    mutating func pop() -> T? {
        guard container.isEmpty == false else {
            return nil
        }
        swap(lhs: 0, rhs: container.count - 1)
        defer {
            siftDown(index: 0)
        }
        return container.removeLast().val
    }
    
    private mutating func siftDown(index:Int) {
        var parent = index
        while true {
            let leftIdx = container[parent].leftChildIndex
            let rightIdx = container[parent].rightChildIndex
            var target = parent
            if leftIdx < container.count && container[leftIdx].val! > container[target].val! {
                target = leftIdx
            }
            if rightIdx < container.count && container[rightIdx].val! > container[target].val! {
                target = rightIdx
            }
            if parent == target {
                return
            }
            swap(lhs: target, rhs: parent)
            parent = target
        }
    }
    
     private mutating func swap(lhs:Int, rhs:Int) {
        container[lhs].index = rhs
        container[rhs].index = lhs
        container.swapAt(lhs, rhs)
    }
    
    var count: Int {
        return container.count
    }
    
    var isEmpty: Bool {
        return container.isEmpty
    }
    
    func printContainer() {
        print(container)
    }
}

var impHeap = Heap<Int>()
impHeap.push(4)
impHeap.push(2)
impHeap.push(8)
impHeap.push(3)
impHeap.push(5)
impHeap.push(1)
impHeap.push(6)
impHeap.push(15)

print("\(String(describing: impHeap.pop()))")
print("\(String(describing: impHeap.pop()))")
print("\(String(describing: impHeap.pop()))")
print("\(String(describing: impHeap.pop()))")
print("\(String(describing: impHeap.pop()))")
print("\(String(describing: impHeap.pop()))")
print("\(String(describing: impHeap.pop()))")
impHeap.printContainer()
