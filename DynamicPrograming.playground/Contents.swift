import UIKit
/*
 2개의 단어가 주어지고, 단어 1에서 단어 2로 변경까지 몇번의 동작을 해야 하는가?
 3 operationpermitted on word.
 1) insert character
 2) Delete character
 3) Replace a character
 
 ex) w1: horse, w2: ros
 ex) w1: intention, w2: execution
 */

func minDistance(word1:String, word2:String) -> Int {
    let len1 = word1.count
    let len2 = word2.count
    
    var dist: [[Int]] = Array(repeating: Array(repeating: 0, count: len2 + 1), count: len1 + 1)
    //Initializing
    for i in 1 ... len1 {
        dist[i][0] = i
    }
    for i in 1 ... len2 {
        dist[0][i] = i
    }
    
    let word1Arr = Array(word1)
    let word2Arr = Array(word2)
    //Loop
    for i in 1 ... len1 {
        for j in 1 ... len2 {
            if word1Arr[i-1] == word2Arr[j-1] {
                dist[i][j] = dist[i-1][j-1]
            } else {
                dist[i][j] = min(dist[i-1][j-1], dist[i-1][j], dist[i][j-1]) + 1
            }
        }
    }
    
    //Debug
    for i in dist {
        print(i)
    }
    return dist[len1][len2]
}

//let word:String = "HelloWord"
//for iter in word.enumerated() {
//    print(iter)
//}

let word1 = "ncsoft"
let word2 = "microsoft"
let val = minDistance(word1: word1, word2: word2)
print(val)
