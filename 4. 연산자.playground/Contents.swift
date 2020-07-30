import UIKit

var str = "Hello, playground"

var number:Double = 5.0
var result : Double = number.truncatingRemainder(dividingBy: 1.5)
result = 12.truncatingRemainder(dividingBy: 2.5)

var result2:Int = 5 / 3 // 1
result = 10 / 3 // 3

let val1 = 3
let val2 = 5
let val3 = 5

let isSameValueAB: Bool = val1 == val2
let isSameValueBC: Bool = val2 == val3
class SomeClass{
  
}
let refA : SomeClass = SomeClass()
let refB : SomeClass = SomeClass()
let refC : SomeClass = refA

let isSameRefAB : Bool = refA === refB
let isSameRefAC : Bool = refA === refC

var BiggerValue : Int = val1 > val3 ? val1 : val3

var unsignedInt : UInt8 = 0
//let errerUnderFlow : UInt8 = unsignedInt - 1
let underFlow : UInt8 = unsignedInt &- 1

prefix operator **
prefix func ** (val : Int) -> Int {
  return val * val
}
prefix func **(val : String) -> String {
  return val + "  " + val
}
print(**(-5))
print(**"안녕")

postfix operator **

postfix func ** (val : Int) -> Int {
  return val + 10
}
print(10**)

print(**10**)


infix operator ** : MultiplicationPrecedence
func ** (lhs : String, rhs : String) -> Bool {
  return lhs.contains(rhs)
}
print("hello world" ** "world")

class Car {
  var modelYear : Int?
  var modelName : String?
  
  static func == (lhs : Car, rhs : Car) -> Bool {
    return lhs.modelName == rhs.modelName
  }
}

struct SmartPhone {
  var company : String?
  var model : String?
  
  static func == (lhs : SmartPhone, rhs : SmartPhone) -> Bool {
    return lhs.model == rhs.model
  }
}
let myCar = Car()
myCar.modelName = "S"

let yourCar = Car()
yourCar.modelName = "S"

var myPhone = SmartPhone()
myPhone.model = "11"

var yourPhone = SmartPhone()
yourPhone.model = "s10"

print(myCar == yourCar)
print(myPhone == yourPhone)
