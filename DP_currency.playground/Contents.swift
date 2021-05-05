import UIKit
/*
 ** 효율적인 화폐 구성: 문제 설명 **
 N가지 종류의 화폐가 있다. 이 화폐들의 개수를 최소한으로 이용해서 그 가치의 합이 M원이 되도록 하려고 한다.
 이때 각 종류의 화폐는 몇 개라도 사용할 수 있다
 예를 들어 2원, 3원 단위의 화폐가 있을 때는 15원을 만들기 위해 3원을 5개 사용하는 것이 가장 최소한의
 화폐 개수이다
 M원을 만들기 위한 최소한의 화폐 개수를 출력하는 프로그램을 작성하라
 */
var currency:[Int] = [3, 5, 7]
var money:Int = 29
var dp:[Int] = [Int](repeating: Int.max, count: 10000)

dp[0] = 0

for c in currency {
    //c: currency
    for iter in c ... money {
        if dp[iter - c] != Int.max {
            dp[iter] = min(dp[iter], dp[iter - c] + 1)
            print("cur: \(c) iter:\(iter) dp: \(dp[iter])")
        }
    }
}

var result = dp[money]
if result == Int.max {
    result = -1
}
//BigO(N*M)
print(result)
