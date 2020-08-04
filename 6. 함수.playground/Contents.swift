import UIKit

func hello (name : String) -> String {
  return "hello \(name)"
}
let helloJenny : String = hello(name: "Jenny")
print(helloJenny)


func helloWorld() -> String {
  return "Hello, world!"
}
print(helloWorld())

func sayHello(myName : String, yourName: String) -> String{
  return "hello \(yourName)!, I'm \(myName)"
}
print(sayHello(myName: "김태훈", yourName: "탱구"))

func sayHello(from myName : String, to yourName: String) -> String{
  return "hello \(yourName)!, I'm \(myName)"
}
print(sayHello(from: "김태훈", to: "탱구"))


func sayHello(_ myName : String, _ yourName: String) -> String{
  return "hello \(yourName)!, I'm \(myName)"
}
print(sayHello("김태훈", "탱구"))

func sayHello(to name:String, _ times:Int) -> String{
  var result :String = ""
  for _ in 0..<times {
    result += "hello \(name)" + " "
  }
  return result
}
func sayHello(to name:String, repeatCount times : Int) -> String{
  var result : String = ""
  for _ in 0..<times{
    result += "Hello \(name)!" + " "
  }
  return result
}

print(sayHello(to: "탱구", 3))
print(sayHello(to: "탱구", repeatCount: 3))

func sayHello(_ name :String, times : Int = 3) -> String{
  var result : String = ""
  for _ in 0..<times{
    result += "Hello \(name)!" + " "
  }
  return result
}
print(sayHello("탱구"))
print(sayHello("탱구", times : 5))

func sayHelloToFriends(me :String, friends names : String...) -> String{
  var result : String = ""
  for friend in names{
    result += "Hello \(friend)! "
  }
  result += "I'm \(me)"
  return result
}
print(sayHelloToFriends(me: "김태훈", friends: "a","b","c","d"))

var numbers : [Int] = [1,2,3]
func nonReferenceParameter ( _ arr : [Int]){
  var copieArr : [Int] = arr
  copieArr[1] = 1
}
func referenceParameter(_ arr : inout [Int]){
  arr[1] = 1
}
nonReferenceParameter(numbers)
print(numbers)
referenceParameter(&numbers)
print(numbers)

func sayHelloWorld(){
  print("Hello world")
}
sayHelloWorld()

typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a : Int, _ b : Int) -> Int {
  return a + b
}
func multiplyTwoInts(_ a : Int, _ b : Int) -> Int {
  return a * b
}

var mathFunction : CalculateTwoInts = addTwoInts
print(mathFunction(2, 5)) // 7
mathFunction = multiplyTwoInts
print(multiplyTwoInts(2, 5)) // 10

func printMathResult(_ mathFunc : CalculateTwoInts, _ a : Int, _ b : Int) {
  print("result: \(mathFunc(a,b))")
}
printMathResult(addTwoInts,3, 5)

func chooseMathFunc( _ toAdd : Bool)->CalculateTwoInts {
  return toAdd ? addTwoInts : multiplyTwoInts
}
printMathResult(chooseMathFunc(true), 3, 5)


typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft : Bool) -> MoveFunc {
  func goRight(_ currentPosition : Int) -> Int{
    return currentPosition + 1
  }
  func goLeft(_ currentPosition : Int) -> Int{
    return currentPosition - 1
  }
  return shouldGoLeft ? goLeft : goRight
}

var position = -4

let moveToZero : MoveFunc = functionForMove(position > 0)
while(position != 0) {
  print("\(position)...")
  position = moveToZero(position)
}

func crashAndBurn() -> Never {
  fatalError("Something very, very ba happened")
}
crashAndBurn()

func someFunction(isAllIswell:Bool) {
  guard isAllIswell else {
    print("에러")
    crashAndBurn()
  }
  print("all is well")
}

someFunction(isAllIswell: true)
someFunction(isAllIswell: false)

func say(_ something:String) -> String{
  print(something)
  return something
}
@discardableResult func discardableResultSay(_ something : String) -> String{
  print(something)
  return something
}
say("hello")
discardableResultSay("hello")
