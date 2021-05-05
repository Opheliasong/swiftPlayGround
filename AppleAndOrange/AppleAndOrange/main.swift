import Foundation

func modifyAccess(mem:inout [Int], index:Int) -> Bool {
    let a = mem[index]
    let b = mem[index - 1]
    let c = mem[index - 2]
    
    var retVal = false
    if a == 0 && b == 1 && c == 0 {
        mem[index] = 1
        mem[index - 1] = 1
        mem[index - 2] = 0
    } else if a == 1 && b == 1 && c == 0 {
        mem[index] = 1
        mem[index - 1] = 0
        mem[index - 2] = 1
    } else if a == 1 && b == 0 && c == 1 {
        mem[index] = 0
        mem[index - 1] = 1
        mem[index - 2] = 1
    } else if a == 0 && b == 1 && c == 1 {
        mem[index] = 1
        mem[index - 1] = 1
        mem[index - 2] = 1
        retVal = true
    }
    return retVal
}

func setArray(mem:inout [Int], lastIndex:inout Int, head:Int, cnt:Int) {
    var flag = 0
    for i in 0 ... cnt {
        if i < head {
            mem[i] = 1
            continue
        }
        mem[i] = flag
        if flag == 0 && lastIndex < i {
//            lastIndex = i
        }
        flag = flag == 0 ? 1 : 0
    }
    lastIndex = cnt
}

// Complete the maxSubsetSum function below.
func maxSubsetSum(arr: [Int]) -> Int {
    if arr.count == 1 {
        return arr[0]
    }
    var dp:[Int] = [Int](repeating: 0, count: arr.count)
    dp[0] = arr[0]
    dp[1] = max(dp[0], arr[1])
    
    for i in 2 ... arr.count - 1 {
        dp[i] = max(arr[i], dp[i-1], dp[i-2] + arr[i])
    }
    
    //calc result
    return dp[dp.count-1]
}

//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let res = maxSubsetSum(arr: arr)
print(res)
//fileHandle.write(String(res).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
