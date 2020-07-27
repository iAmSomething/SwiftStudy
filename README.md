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



----

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

------

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

-----

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



