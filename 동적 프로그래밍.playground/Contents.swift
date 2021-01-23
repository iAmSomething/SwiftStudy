import UIKit

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
  var numberDic : [Int : [Int]] = [:]
  numberDic[1] = [N]
  
  var userCount : [Int : Int] = [:]
  userCount[1] = 1
  
  func expressable(num : Int, count : Int) {
    guard userCount[num] == nil else {
      return
    }
    guard 0 < num && num <= 32000 else {return}
    //temp.append((value * 10) + N)
    numberDic[count]?.append(num)
    userCount[num] = count
  }
  for count in 2...8 {
    numberDic[count] = [Int]()
    if makeRepeating(N, count: count) == number {return count}
    expressable(num: makeRepeating(N, count: count), count:  count)
    
    for i in 1..<count {
      guard let number1 = numberDic[i], let number2 = numberDic[count - i] else {
        continue
      }
      for op1 in number1 {
        for op2 in number2 {
          if op1/op2==number||op1-op2==number||op1+op2==number||op1*op2==number {
              return count
          }
          expressable(num: op1/op2, count: count)
          expressable(num: op1-op2, count: count)
          expressable(num: op1+op2, count: count)
          expressable(num: op1*op2, count: count)
        }
      }
    }
  }
  numberDic
  userCount
    return -1
}
func makeRepeating(_ num: Int, count: Int) -> Int {
    var result = 0
    for _ in 0..<count {
        result = result*10 + num
    }
    return result
}



solution(5, 12)
