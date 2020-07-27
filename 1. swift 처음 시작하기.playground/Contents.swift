import UIKit

var str = "Hello, playground"



//콘솔 로그
//내부 로직의 흐름을 관찰할 수 있다.
//print, dump를 통해서 콘솔 로그를 출력할 수 있다
//print(str)
//dump(str)

struct BasicInformaiton{
  let name:String
  var age:Int
}

var myInfo : BasicInformaiton = BasicInformaiton(name: "김태훈", age: 25)

class Person{
  var height:Float = 0.0
  var weight:Float = 0.0
}
let me : Person = Person()
me.height = 187
me.weight = 77.7
print("print를 통해 보는 로그")
print(myInfo)
print()
print("dump를 통해 보는 로그")
dump(myInfo)
print()
print("print를 통해 보는 로그")
print(me)
print()
print("dump를 통해 보는 로그")
dump(me)

//문자열 보간법 : 문자열 사이에 변수 또는 상수의 값을 나타내고 싶을때 \() 형식으로 넣는다
let name : String = "김태훈"
print("my name is \(name)")


//주석

//한줄 주석은 이렇게

/* 여러 줄
 주석은
 이렇게 */
/* 여러 줄 주석 안쪽에
 /* 추가로 주석을 포함할수있고
  // 그 안에 또 주석을 달아도됨
 */
 여기도 주석
*/

/*변수와 상수
 변수는 var, 가변
 상수는 let, 불변*/
