import UIKit
/*
 1로 만들기: 문제 설명
 정수 X가 주어졌을 때, 정수 X에 사용할 수 있는 연산은 다음과 같이 4가지이다
 X가 5로 나누어 떨어지면, 5로 나눈다
 X가 3으로 나누어 떨어지면, 3으로 나눈다
 X가 2로 나누어 떨어지면, 2로 나눈다
 X에서 1을 뺀다
 정수 X가 주어졌을 때, 연산 4개를 적절히 사용해서 값을 1로 만들고자 한다. 연산을 사용하는 횟수의
 최솟값을 출력하라. 예를 들어 정수가 26이면 다음과 같이 계산해서 3번의 연산이 최솟값이다
 26 → 25 → 5 → 1
 */
let input = 26
var dp:[Int] = [Int](repeating: 0, count: 30001)

if input == 0 {
    print(dp[input])
}

for i in 2 ... input+1 {
    dp[i] = dp[i-1] + 1
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i/2]+1)
    }
    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i/3]+1)
    }
    if i % 5 == 0 {
        dp[i] = min(dp[i], dp[i/5]+1)
    }
    print("i:\(i) in \(dp[i])")
}

print(dp[input])
