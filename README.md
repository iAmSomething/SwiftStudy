# SwiftStudy
야곰님이 지으신 Swift 5 프로그래밍책을 받아서 하나하나 공부해보려고 하는 레포





# 스위프트 처음 시작하기

## 기본 명명 규칙

- 변수 상수 함수 메서드 타입 등 이름은 "유니코드"에서 지원하는 어떤 문자라도 사용할 수 있습니다. (이모티콘 가능)

  ~~~swift
  var 🐶:String = "나무"
  let 나무나이 :Int = 6
  ~~~

- 하지만 다음 경우는 사용할 수 없습니다.

  - 예약어 및 키워드
  - 코드 범위 내에서 사용되는 이름과 동일한 이름
  - 연산자로 사용되는 기호
  - 숫자로 시작하는 이름
  - 공백이 포함되는 이름

- 함수, 메서드, 인스턴스 이름은 lowerCamelCase를 사용합니다.

- 클래스, 구조체, 익스텐션, 프로토콜, 열거형 이름은 타입의 이름이기 때문에 UpperCamelCase를 사용합니다.

- 대소문자를 구분합니다.



## 콘솔 로그

애플리케이션 내부 로직의 흐름을 관찰하기 위해 콘솔에 출력되는 정보를 의미합니다. 디버깅할때 필수임 Swift에서는 print()와 dump(T)함수를 사용하여 콘솔 로그를 출력할 수 있습니다.

~~~swift
var myInfo : BasicInformaiton = BasicInformaiton(name: "김태훈", age: 25)
print("print를 통해 보는 로그")
print(myInfo)
print("dump를 통해 보는 로그")
dump(myInfo)

//print를 통해 보는 로그
//BasicInformaiton(name: "김태훈", age: 25)
//
//dump를 통해 보는 로그
//▿ __lldb_expr_157.BasicInformaiton
//  - name: "김태훈"
//  - age: 25

~~~

```swift
class Person{
  var height:Float = 0.0
  var weight:Float = 0.0
}
let me : Person = Person()
me.height = 187
me.weight = 77.7
print("print를 통해 보는 로그")
print(me)
print("dump를 통해 보는 로그")
dump(me)

//print를 통해 보는 로그
//__lldb_expr_165.Person
//
//dump를 통해 보는 로그
//▿ __lldb_expr_165.Person #0
//  - height: 187.0
//  - weight: 77.7
```

### 문자열 보간법

문자열 내에 변수 또는 상수의 값을 넣어서 나타내고 싶을 때 \\(변수/상수) 형태로 표기하면 이를 문자열로 치환하여 넣습니다.

~~~swift
let name : String = "김태훈"
print("my name is \(name)")
~~~



## 주석

#### 한줄 주석

~~~swift
// 한 줄 주석
~~~

#### 여러 줄 주석

~~~swift
/*여러
줄
주석 */
~~~

#### 중첩 주석 ( 대부분의 프로그래밍 언어는 중첩 주석을 지원 안함 )

~~~swift
/* 주석 안에
   /* 주석을 또 넣을 수 있다.
     //한줄주석도 넣을 수 있다.
   */ 여기까지도 주석임
*/
~~~



## 변수와 상수

#### 변수

- var 변수명 : 데이터타입 = 값 형태

~~~swift
var name : String = "김태훈"
var age : Int = 25
var language = "Swift" // 타입 추론 : 컴파일러에서 시간이 오래 걸릴 수 있으니 명시해주는게 좋음
age = 26 // 변수는 값의 변경이 가능
~~~

#### 상수

- let 상수명: 데이터타입 = 값 형태

~~~swift
let name : String = "김태훈"
name = "김태훈2" // 에러난다 상수는 값을 못바꿈
let age = 25 // 상수도 데이터 타입 추론이 가능하다
~~~



-------------

# 데이터 타입 기본

스위프트는 기본 데이터 타입이 모두 구조체를 기반으로 수현되어 있어서 다양한 익스텐션, 제너릭 등을 두루 사용할 수 있습니다. 

모든 데이터타입은 UpperCamelCase로 작성되어 있습니다.

## Int, UInt

정수 타입입니다. Int는 signed, UInt는 unsigned 정수를 뜻합니다.

시스템 아키텍처의 크기에 따라 Int와 UInt값이 달라질 수 있기 때문에 다음과 같이 데이터의 크기가 정해진 데이터타입을 사용할 수 있습니다.

~~~
1. Int8 : 8bit 정수
2. Int16 : 16bit 정수
3. Int32 : 32bit 정수
4. Int64 : 64bit 정수
~~~

지금 사용하고 있는 64bit시스템에서는

~~~swift
let max = Int.max
let largeInt = Int64.max
print(max)
print(largeInt)

//9223372036854775807
//9223372036854775807
~~~

Int와 Int64 크기가 같은 것을 볼 수 있습니다. 32bit 시스템에서는 Int와 Int32 크기가 같겠죠???

UInt 데이터 타입을 바로 Int로 캐스팅 하면 묵시적 캐스팅이 안되어서 에러 납니다. 다른 타입의 변수들 끼리 캐스팅을 해주듯 명시적으로 해주어야 합니다.

~~~swift
var integer:Int = 0
var unsignedInteger:UInt = 123
integer = unsignedInteger // 에러 납니다.
integer = Int(unsignedInteger) // 에러 안납니다.
unsignedInteger = UInt.max
integer = Int(unsignedInteger) // 에러납니다. int 범위를 벗어나는 값을 캐스팅할수가 없습니다.
~~~

다른 진수의 정수를 표현하려면 접두어를 붙여 표현하면 됩니다.

~~~swift
let decimalInt:Int = 28
let binaryInt: Int = 0b11100 //2진수
let octalInt:Int = 0o34 //8진수
let hexInt:Int = 0x1c //16진수
~~~

## Bool

Bool은 boolean을 나타내는 데이터 타입입니다. swift에서는 다른 언어와는 다르게 int 0값이 false에 묵시적으로 캐스팅되지 않습니다. 따라서 또 명시적으로 캐스팅을 해줘야 합니다.

~~~swift
var boolean:Bool = true
boolean.toggle() // false로 바꿈
boolean = Bool(truncating: 0) // false
boolean = Bool(truncating: 3) // 0이 아닌 값은 모두 true
~~~

## Character

Character 타입은 문자 하나를 표현합니다. swift는 유니코드 9 문자를 사용하므로 영어, 한글, 특수기호, 이모지 등등 사용할 수 있습니다. 

~~~swift
let english : Character = "a"
let hangeul : Character = "가"
let imogi : Character = "🐼"
~~~

C언어의 경우 char 타입은 8bit 정수 데이터 타입인데(ASCII), swift에서는 유니코드 데이터 타입이라 명시적으로도 캐스팅이 불가능합니다.

~~~swift
let charToInt:Int = Int(english) // 에러남
~~~

## String

String은 문자열을 나타내는 데이터타입입니다. 마찬가지로 유니코드 9를 사용하기 때문에 이모지 한글 상관없이 사용합니다.  swift에서는 String데이터 타입에 많은 메서드와 프로퍼티들이 있어 다른 언어들보다 String 데이터 타입을 다루기 용이합니다. 많이 사용하는 기능들은 다음과 같습니다.

~~~Swift
let hello: String = "hello"
let me:String = "me"
var greeting:String = hello + " " + me + "!" // +를 통해 문자열을 더할 수 있습니다.
greeting = hello
greeting += " "
greeting += me
greeting += "!" //마찬가지로 +=를 통해 자기 자신의 뒤에 새로운 문자열을 더할 수 있습니다.
~~~

~~~swift
var isSameString:Bool = false
isSameString = hello == "Hello" //false
isSameString = hello == "hello" // true
// 문자열 끼리 비교는 ==, != 이렇게 사용할 수 있습니다.
~~~

~~~swift
var hasPrefix = hello.hasPrefix("He") // He로 시작하는지? : false
var hasSuffix = hello.hasSuffix("llo") // llo로 끝나는지? : true
~~~

~~~swift
var convertedString:String = ""
convertedString = hello.uppercased() // 알파벳 문자열을 모두 대문자로 : HELLO 
convertedString = hello.lowercased() // 알파벳 문자열을 모두 소문자로 : hello
~~~

~~~swift
var isEmptyString : Bool = false
isEmptyString = greeting.isEmpty // 문자열이 비어있는지 확인 String은 ""이면 비어있는겁니다. : false

let wordCount : Int = greeting.count // 문자열의 길이를(공백포함) 나타내주는 메서드 : 9
~~~

이외에도 String타입에는 더 많은 메서드와 프로퍼티들이 있는데 사용하면서 찾아보면 될 것 같습니다. 

## Any, AnyObject 그리고 nil

Any는 스위프트의 모든 데이터 타입을 사용할 수 있다는 뜻입니다. 변수/상수 데이터 타입이 Any라면 어떤 종류의 데이터 타입이든지 상관 없이 할당할 수 있습니다.

~~~swift
var someVar: Any = "김나무🐶"

someVar = 50 // Any는 어떤 값이라도 할당할 수 있다.
someVar = 123.3 // Any는 될 수 있으면 사용하지 말자 타입 확인을 항상 해줘야 하는 불편함이 있다
~~~

AnyObject는 Any 보다는 조금 한정된 의미로 클래스의 인스턴스만 할당할 수 있습니다.

