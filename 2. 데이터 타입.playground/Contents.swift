import UIKit

var str = "Hello, playground"

// Int와 UInt
let max = Int.max
let min = Int.min
let Umax = UInt.max
let Umin = UInt.min

let largeInt = Int64.max

print(max)
print(largeInt)
//9223372036854775807
//9223372036854775807



let uinttoint = Int(Umin)

let decimalInt:Int = 28
let binaryInt: Int = 0b11100
let octalInt:Int = 0o34
let hexInt:Int = 0x1c

//Bool

var boolean:Bool = true
boolean.toggle() // false로 바꿈
//boolean = 1
boolean = Bool(truncating: 0)
boolean = Bool(truncating: 3)

// Float Double

var fvalue:Float = 1234567890.1

let doubleValue:Double = 1234567890.1
print(fvalue) // 제대로 표현 못함

print(doubleValue)

var rand = Int.random(in: -100...100)
var frand = Float.random(in: 1.5...4.3)

// char - swift 에서는 유니코드 가능 이모티콘도 가능
let english : Character = "a"
let hangeul : Character = "가"
let imogi : Character = "🐼"
print(imogi)
//let charToInt:Int = Int(english)

// string
let name:String = "김태훈"
var introduce :String = String()
introduce.append("제 이름은")
introduce = introduce + " " + name + "입니다."
introduce.append(imogi)
print(introduce.count)
print(introduce.isEmpty)
let unicodeScalarValue: String = "\u{2665}"

let hello: String = "hello"
let me:String = "me"
var greeting:String = hello + " " + me + "!"
print(greeting)

greeting = hello
greeting += " "
greeting += me
greeting += "!"
print(greeting)

var isSameString:Bool = false
isSameString = hello == "Hello"
print(isSameString)
isSameString = hello == "hello"
print(isSameString)

var hasPrefix = hello.hasPrefix("He")
print(hasPrefix)
hasPrefix = hello.hasPrefix("HE")
print(hasPrefix)

var hasSuffix = hello.hasSuffix("llo")
print(hasSuffix)
hasSuffix = hello.hasSuffix("he")
print(hasSuffix)

var convertedString:String = ""
convertedString = hello.uppercased()
print(convertedString)

convertedString = hello.lowercased()
print(convertedString)

var isEmptyString : Bool = false
isEmptyString = greeting.isEmpty

let wordCount : Int = greeting.count

greeting = """
안녕히계세요
여러분
"""

print(greeting)


// Any, AnyObject 그리고 nil

var someVar: Any = "김나무🐶"

someVar = 50 // Any는 어떤 값이라도 할당할 수 있다.
someVar = 123.3 // Any는 될 수 있으면 사용하지 말자 타입 확인을 항상 해줘야 하는 불편함이 있다
