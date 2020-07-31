import UIKit

let first = 5
let second = 7
if first > second {
  print("first > second")
} else if first < second {
  print("first < second")
} else {
  print("first == second")
}

var biggerVal = 0
if first > second{
  biggerVal = first
} else if first == second {
  biggerVal = first
} else if first < second {
  biggerVal = second
} else if first == 5 {
  biggerVal = 100
}
print(biggerVal)

let integerValue : Int = 5
switch integerValue {
case 0:
  print("value == zero")
case 1...10:
  print("value == 1~10")
  fallthrough
case Int.min..<0, 101..<Int.max :
  print("value < 0 or Value > 100")
  break
default:
  print("10 < value <= 100")
}


typealias NameAge = (name : String, age : Int)

let tupleVal : NameAge = ("김태훈", 25)

switch tupleVal {
case ("김태훈", 25) :
  print("나야나")
default :
  print("누구")
}

switch tupleVal {
case ("김태훈", 23):
  print("나야나")
case ("김태훈 ", _) :
  print("이름만 맞음")
case (_, 25) :
  print("나이만 ")
default:
  print("누구?")
}

switch tupleVal {
case ("김태훈", 24):
  print("나야나")
case ("김태훈", let age) :
  print("이름만 맞음 \(age)")
case (let name, 25) :
  print("나이만 \(name)")
default:
  print("누구?")
}


let 직급 :String = "사원"
let 연차 : Int = 1
let 인턴인지 : Bool = false

switch 직급 {
case "사원" where 인턴인지 == true:
  print("인턴입니다.")
case "사원" where 연차 < 2 && 인턴인지 == false:
  print("신입사원입니다.")
case "사원" where 연차 > 5:
  print("인턴입니다.")
case "사원" :
  print("사원입니다.")
case "대리" :
  print("대리입니다.")
default:
  print("그럼뭔데")
}

enum School {
  case primary, elementary, middle, high, college, university, graduate
}
let 최종학력 :School = School.university

switch 최종학력 {
case .primary:
  print("유치원")
case .elementary :
  print("초등학교")
case .middle :
  print("중학교")
case .high :
  print("고등학교")
case .college :
  print("대학")
case .university :
  print("대학교")
case .graduate :
  print("대학원")
}

enum Menu {
  case chicken
  case pizza
  case hamburger
}
let lunchMenu : Menu = .hamburger
switch lunchMenu {
case .chicken:
  print("칰힌")
case .pizza :
  print("pizza")
@unknown case _:
  print("메뉴가 뭔지")
}

for i in 0...5 {
  if i.isMultiple(of: 2){
    print(i)
  }
}
for char in "안녕하세요" {
  print(char)
}
var result = 1
for _ in 1...3 {
  result *= 10
}
print(result)

let friends : [String : Int] = ["김태훈" : 25, "노한솔" : 26, "나무": 7]
for tuple in friends{
  print(tuple)
}
for (key, val) in friends {
  print(key)
  print(val)
}

var names : [String] = ["a","b","c","d","e"]

while names.isEmpty == false {
  print("bye \(names.removeFirst())")
}
print()
names = ["a","b","c","d","e"]
repeat {
  print("bye \(names.removeFirst())")
} while names.isEmpty == false

var numbers:[Int] = [3,2342,6,3252]

numberloop: for num in numbers {
  if num > 5 || num < 1 {
    continue numberloop
  }
  
  var count : Int = 0
  printLoop : while true {
    print(num)
    count += 1
    if count == num {
      break printLoop
    }
  }
  removeLoop : while true {
    if numbers.first != num {
      break numberloop
    }
    numbers.removeFirst()
  }
}
