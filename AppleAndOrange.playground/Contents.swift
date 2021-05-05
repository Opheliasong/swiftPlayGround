import Foundation

/*
 * Complete the 'countApplesAndOranges' function below.
 *
 * The function accepts following parameters:
 *  1. INTEGER s
 *  2. INTEGER t
 *  3. INTEGER a
 *  4. INTEGER b
 *  5. INTEGER_ARRAY apples
 *  6. INTEGER_ARRAY oranges
 */

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    // Write your code here
    //first line
    //s: sam의 house location start
    //t: sam의 house location end
    
    //second line
    //a: apple tree
    //b: orange tree
    
    //third line
    //m: a에서 apples가 떨어지는 각 item들의 갯수
    //n: b에서 orange가 떨어지는 각 item들의 갯수
    // print("\(s) \(t) \(a) \(b) \(apples) \(oranges)")
    let appleTree = a
    let orangeTree = b
    var inApple:Int = 0
    var inOrange:Int = 0
    
    for i in apples {
        let locate = appleTree + i
        if s <= locate && t >= locate {
            inApple = inApple + 1
        }
    }
    
    for i in oranges {
        let locate = orangeTree + i
        if s <= locate && t >= locate {
            inOrange = inApple + 1
        }
    }
    
    print("\(inApple)")
    print("\(inOrange)")
}

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let s = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let t = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let secondMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let secondMultipleInput = secondMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let a = Int(secondMultipleInput[0])
else { fatalError("Bad input") }

guard let b = Int(secondMultipleInput[1])
else { fatalError("Bad input") }

guard let thirdMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let thirdMultipleInput = thirdMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let m = Int(thirdMultipleInput[0])
else { fatalError("Bad input") }

guard let n = Int(thirdMultipleInput[1])
else { fatalError("Bad input") }

guard let applesTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let apples: [Int] = applesTemp.split(separator: " ").map {
    if let applesItem = Int($0) {
        return applesItem
    } else { fatalError("Bad input") }
}

guard apples.count == m else { fatalError("Bad input") }

guard let orangesTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let oranges: [Int] = orangesTemp.split(separator: " ").map {
    if let orangesItem = Int($0) {
        return orangesItem
    } else { fatalError("Bad input") }
}

guard oranges.count == n else { fatalError("Bad input") }

countApplesAndOranges(s: s, t: t, a: a, b: b, apples: apples, oranges: oranges)
