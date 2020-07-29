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

> 스위프트는 기본 데이터 타입이 모두 구조체를 기반으로 수현되어 있어서 다양한 익스텐션, 제너릭 등을 두루 사용할 수 있습니다. 
>
> 모든 데이터타입은 UpperCamelCase로 작성되어 있습니다.

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
let emoji : Character = "🐼"
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



------

# 데이터 타입 고급

스위프트는 타입에 굉장히 민감하고 엄격합니다. 서로 다른 타입끼리의 데이터 교환은 꼭 타입캐스팅을 거쳐야 합니다.

#### 데이터 타입 안심이란

스위프트는 타입을 안심하고 사용할 수 있는 Type-Safe 언어입니다. 컴파일 시 타입을 확인하여 여러 타입을 섞어 사용할 때 발생할 런타임 오류를 피할 수 있습니다.

#### 타입 추론

스위프트에서 특정 타입을 명시하지 않아도 컴파일러가 할당된 값을 기준으로 타입을 추론하여 결정해주는 것을 타입 추론이라 합니다.

~~~swift
var name = "김태훈" //String타입으로 타입 추론을 하였다
name = 100 // String 타입으로 추론된 변수에 Int타입 값을 넣으면 에러가 난다
~~~

## 타입 별칭

스위프트에서 데이터 타입에 사용자가 임의로 다른 이름(별칭)을 부여할 수 있습니다. 

~~~swift
typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 25
var year:YourInt = 2020
year = age // 둘다 Int타입이기 때문에 같은 타입으로 취급된다.
~~~

## 튜플

튜플은 지정된 데이터의 묶음입니다.  원시 구조체의 형태와 가까운데 튜플에 포함될 데이터의 개수는 자유롭게 정할 수 있습니다.

~~~swift
var person : (String, Int, Double) = ("김태훈",100,187.0)
Person.1 = 25 // 튜플의 각 항목에 대해서는 순서대로 .0, .1, .2 이렇게 접근할 수 있다.

var person2 : (name:String, age:Int, height:Double) = ("김태훈",100,187.0) //person2.name 이런식으로 접근 가능
person2.age = 99
person2.2 = 187.7 // 이렇게 순서에 따라서 접근 할 수도 있다.
~~~

매번 같은 모양의 튜플을 사용하고 싶은 경우 튜플 타입을 별칭을 통해 지정해줄 수 있습니다.

~~~swift
typealias PersonTuple = (name:String, age:Int, height:Double)
let me : PersonTuple =  ("김태훈",100,187.0)
~~~



## 컬렉션형

많은 수의 데이터를 묶어서 저장하고 관리할 수 있는 타입을 "컬렉션 타입"이라고 합니다, 배열, 딕셔너리, 세트  등이 여기에 해당됩니다.



### 배열

배열은 데이터를 순서대로 저장하는 형태의 컬렉션 타입입니다. 배열의 선언은 Array키워드와 타입 이름의 조합으로 이루어집니다. 축약 표현도 가능합니다.   String과 마찬가지로 여러 프로퍼티들이 있어 유용하게 쓸 수 있습니다. 

~~~swift
var names : Array<String> = ["김태훈","노한솔"]
var names2: [String] = ["김태훈","노한솔"]

var emptyArray : [Any] = [Any]() // Any 데이터타입의 빈 배열 생성
var emptyArray2: [Any] = Array<Any>()
var emptyArray3: [Any] = [] //배열의 타입을 정확히 명시해 준 경우 []를 통해 빈 배열 생성 가능
~~~

배열은 각 요소에 인덱스를 통해 접근할 수 있습니다. 잘못된 인덱스로 접근하려고 하면 Exception Error를 만나게 됩니다. 그 외의 프로퍼티들은 코드를 보면서

~~~swift
print(names[0])
names[0] = "" //인덱스를 통한 접근
names.append("탱구") // 배열 맨 뒤에 요소 추가
names.insert("iOS", at: 1) // 해당하는 인덱스에 요소 삽입 뒤의 요소들은 인덱스가 하나씩 밀림
print(names)
names.insert(contentsOf: ["1","4"] , at: 4) // "1", "4" 두 개의 요소를 각각 4번 5번 인덱스에 삽입
print(names)
print(names.firstIndex(of: "탱구")) // 요소의 인덱스 중 첫번째 인덱스 (중복될 수도 있으니깬,,)
print(names.first) // 첫 번째 요소
print(names.last) // 마지막 요소

let firstItem : String = names.removeFirst() // 첫 번째 요소를 삭제하고 하나씩 땡긴다
let lastItem : String = names.removeLast() // 마지막 요소를 삭제한다
let indexZeroItem : String = names.remove(at: 0) // 해당 인덱스의 요소를 삭제하고 뒤에 요소들을 채워넣는다
~~~

범위 연산자를 사용하여 배열의 일부만 가져올 수도 있습니다. Ex) names[1...3]



### 딕셔너리

딕셔너리는 요소들이 "순서 없이" 키와 값의 "쌍"으로 구성되는 컬렉션 타입입니다. 딕셔너리에 저장되는 값은 항상 키 : 값 쌍인데 키는 중복되면 안되며 값은 중복되어도 됩니다.

딕셔너리는 Dictionary라는 키워드와 키의타입, 값의 타입 조합으로 생성할 수 있습니다. 배열과 마찬가지로 다양한 프로퍼티들을 활용해 많은 기능들을 사용할 수 있습니다. 

~~~swift
typealias StringIntDic = [String : Int]
// 비어있는 딕셔너리 민들기
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName2:[String:Int] = [String : Int]()
var numberForName3:[String:Int] = [:]
var numberForName4:StringIntDic = StringIntDic()
var numberForName5:StringIntDic = [:]
//초기값을 주기
var numberForName6:[String:Int] = ["태훈":100, "한솔":200, "탱구":300]
~~~

딕셔너리는 각 값에 "키"로 접근할 수 있습니다. 아까 말했듯 키는 유일한 값입니다. 딕셔너리는 배열과 다르게 없는 키에 접근해도 에러 대신 nil을 반환합니다.

~~~swift
numberForName6["max"] = 999 // 요소를 추가해줍니다.
print(numberForName6["태훈"])  // "태훈"키에 접근, 100을 프린트
print(numberForName6.removeValue(forKey: "탱구")) // "탱구"키에 접근 , 300을 프린트 그리고 요소 삭제
print(numberForName6["탱구", default : 0]) // "탱구"키에 접근, 만약에 nil이면 default값으로 0을 프린트
~~~



### 세트

세트는 같은 타입의 데이터를  "순서 없이" 하나의 묶음으 저장하는 컬렉션 타입입니다. 세트 내의 요소들은 중복되지 않으므로 순서가 중요하지 않고 각 요소가 유일한 값이어야 하는 경우에 쓰입니다.  해시 가능한 값이 들어와야 합니다. 

세트는 Set 키워드와 타입의 조합으로 써줍니다. 배열과 다르게 축약형 선언문이 없습니다. 마찬가지로 다양한 프로퍼티들이 있습니다.

~~~swift
//비어있는 세트 선언
var namesSet:Set<String> = Set<String>()
var namesSet2:Set<String> = [] 	

namesSet = ["태훈", "한솔", "탱구"]

print(namesSet.count) // 요소 개수를 반환하는 프로퍼티
print(namesSet.isEmpty) // 요소 유무를 반환하는 프로퍼티

namesSet.insert("나무")
namesSet.remove("철수") // 없는 요소를 삭제하기 때문에 nil반환, 에러는 아니다.
~~~

세트는 내부의 값들이 유일함을 보장하므로 집합관계를 표현할 때 유용하게 쓸 수 있습니다. 또 이를 용이하게 해 주는 여러 메소드들을 가지고 있습니다.

~~~swift
let englishClass : Set<String> = ["Noah", "Jacob", "Marcus"]
let koreanClass : Set<String> = ["Chris", "Noah", "chulsoo"]

let intersectSet : Set<String> = englishClass.intersection(koreanClass) // 교집합 요소들을 반환
let symmetricDiffSet : Set<String> = englishClass.symmetricDifference(koreanClass) // 여집합 요소들을 반환
let unionSet : Set<String> = englishClass.union(koreanClass) // 합집합 요소들을 반환
let subtractSet : Set<String> = englishClass.subtracting(koreanClass) // 차집합 요소들을 반환

print(unionSet.sorted()) // 요소 정렬

print(englishClass.isDisjoint(with: koreanClass)) // 서로 배타적인지 여부
print(englishClass.isSubset(of: unionSet)) // 부분집합 여부
print(englishClass.isSuperset(of: unionSet)) // 전체집합 여부
~~~

##### 

> ##### 컬렉션에서 임의의 요소 추출하기 / 뒤섞기
>
> swift 4.2버전에서 randomElement()메서드와 shuffle()메서드가 추가되었습니다.
>
> ~~~swift
> print(unionSet.randomElement()) // 랜덤
> print(unionSet.shuffled()) // 섞기
> print(numberForName6.shuffled())
> var str :String = "asdfghjkl"
> print(str.shuffled()) // 스트링도 컬렉션타입이라 됩니다!
> ~~~
>
> Set는 shuffle 할 수 없고 Dictionary는 순서가 섞인 튜플의 배열을 반환합니다.



## 열거형 - enum

열거형은 연관된 항목들을 묶어서 표현할 수 있는 타입입니다. 프로그래머가 정의해 준 항목 값 외에는 추가/수정이 불가능합니다. 따라서 정해진 값만 열거형 값에 속할 수 있습니다.

>다음과 같은 경우 요긴하게 쓰입니다.
>
>1. 제한된 선택지를 주고 싶을때
>2. 정해진 값 외에는 입력받고 싶지 않을 때
>3. 예상된 입력 값이 한정되어 있을 때

열거형의 각 항목이 원시값(raw value)를 가질 수 있습니다.

### 기본 열거형

~~~swift
enum School {
  case primary
  case elementary
  case middle
  case high
  case college
  case univ
  case graudate
}

enum School2 {
  case primary,elementary,middle,high,college,univ,graduate
}
~~~

School이라는 열거형에는 여러 항목들이 있습니다 각 항목은 자체가 고유한 값이며 한 줄에 표현해 줄 수도 있습니다.

~~~swift
var highestLevel :School = .univ
highestLevel = .graudate
~~~

위와 같은 방법으로 값을 할당하고 변경할 수 있습니다.

### 원시 값

각 항목별로 원시 값을 주게 할 수 있습니다.

~~~swift
enum School3 : String {
  case primary = "유치원"
  case elementary = "초등학교"
  case middle = "중딩"
  case high = "고딩"
  case college = "대학"
  case univ = "대학교"
  case graudate = "대학원"
}

enum School4 : String {
  case primary = "유치원"
  case elementary = "초등학교"
  case middle = "중딩"
  case high = "고딩"
  case college = "대학"
  case univ
  case graudate
}
~~~

위의 School3 처럼 모든 요소에 원시값을 지정해주어도 되고, 밑 처럼 어떤 요소에만 지정해주어도 됩니다.

~~~swift
let educationStatus1 : School4 = .primary
let educationStatus2 : School4 = .univ
print(educationStatus1.rawValue) // 초등학교
print(educationStatus2.rawValue) // 지정해주지 않은 경우 요소의 이름을 반환합니다 : univ
~~~

정수 타입일 경우 첫 항목을 기준으로 0부터 1씩 늘어난 값을 가지게 됩니다.

~~~swift
enum Numbers : Int {
  case zero
  case one
  case two
  case ten = 10
}
print(Numbers.one.rawValue) // 1
~~~

원시 값을 갖는 열거형일 때 원시 값을 통해 열거형 변수 또는 상수를 생성해 줄 수 있습니다.

~~~swift
let num = Numbers(rawValue: 2)
let school = School4(rawValue: "중딩")
~~~

### 연관 값

열거형 내의 항목이 자신과 연관된 값을 가질 수 있습니다. 꼭 모든 항목이 연관 값을 가질 필요는 없습니다..

~~~swift
//연관 값을 갖는 열거형
enum MainDish{
  case pastar(taste:String)
  case pizza(dough : String, topping : String)
  case chicken(withSause:Bool)
  case rice
}
var dinner : MainDish = MainDish.pizza(dough: "치즈", topping: "베이컨")
~~~



### 항목 순회

열거형에 포함된 모든 케이스를 알아야 할 경우 열거형에 CaseIterable 프로토콜을 채택하고 allCases라는 이름의 프로퍼티를 사용하여 확인할 수 있습니다.

~~~swift
//항목 순회
//열거형의 모든 케이스들을 알기 위해서는 열거형에 CaseIterable 프로토콜을 채택해주면 됨
enum School5 : String, CaseIterable{
  case primary = "유치원"
  case elementary = "초등학교"
  case middle = "중딩"
  case high = "고딩"
  case college = "대학"
  case univ = "대학교"
  case graudate = "대학원"
}
let allCases : [School5] = School5.allCases
print(allCases) // [__lldb_expr_22.School5.primary, __lldb_expr_22.School5.elementary, __lldb_expr_22.School5.middle, __lldb_expr_22.School5.high, __lldb_expr_22.School5.college, __lldb_expr_22.School5.univ, __lldb_expr_22.School5.graudate]

~~~

위의 열거형과 다르게 조금 복잡해지는 열거형의 경우 allCases 프로퍼티를 수정하여 사용할 수 있습니다.

~~~swift
//복잡한 열거형에서의 항목 순회
//@available 속성으로 플랫폼에 따라 결과를 다르게 하는 예제
//allCases 프로퍼티 자체를 새로 만들어 주면 됩니다.

enum School6 : String, CaseIterable{
  case primary = "유치원"
  case elementary = "초등학교"
  case middle = "중딩"
  case high = "고딩"
  case college = "대학"
  case univ = "대학교"
  @available(iOS, obsoleted: 12.0)
  case graudate = "대학원"
  
  static var allCases: [School6] {
    let all:[School6] = [.primary,.elementary,.middle,.high,.college,.univ]
    #if os(iOS)
    return all
    #else
    return all + [.graduate]
    #endif
  }
}
let allCases2:[School6] = School6.allCases
print(allCases2)
//[__lldb_expr_22.School6.primary, __lldb_expr_22.School6.elementary, __lldb_expr_22.School6.middle, __lldb_expr_22.School6.high, __lldb_expr_22.School6.college, __lldb_expr_22.School6.univ] 
~~~

열거형의 케이스들이 연관 값을 갖는 경우에도 allCases 프로퍼티를 구현하여 사용할 수 있습니다.

~~~swift
enum PastaTaste : CaseIterable {
  case cream, tomato
}

enum PizzaDough : CaseIterable{
  case cheeseCrust, thin, original
}

enum PizzaTopping : CaseIterable {
  case pepperoni, cheese, bacon
}

enum MainDish2:CaseIterable {
  case pasta(taste:PastaTaste)
  case pizza(dough:PizzaDough, topping:PizzaTopping)
  case chiken(withSauce : Bool)
  case rice
  
  static var allCases:[MainDish2] {
    return PastaTaste.allCases.map(MainDish2.pasta) + PizzaDough.allCases.reduce([]) {
      (result, dough) -> [MainDish2] in
      result + PizzaTopping.allCases.map{
        (topping) -> MainDish2 in
        MainDish2.pizza(dough: dough, topping: topping)
      }
    }
      + [true, false].map(MainDish2.chiken) + [MainDish2.rice]
  }
}

print(MainDish2.allCases)
//[__lldb_expr_24.MainDish2.pasta(taste: __lldb_expr_24.PastaTaste.cream), __lldb_expr_24.MainDish2.pasta(taste: __lldb_expr_24.PastaTaste.tomato), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.cheeseCrust, topping: __lldb_expr_24.PizzaTopping.pepperoni), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.cheeseCrust, topping: __lldb_expr_24.PizzaTopping.cheese), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.cheeseCrust, topping: __lldb_expr_24.PizzaTopping.bacon), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.thin, topping: __lldb_expr_24.PizzaTopping.pepperoni), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.thin, topping: __lldb_expr_24.PizzaTopping.cheese), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.thin, topping: __lldb_expr_24.PizzaTopping.bacon), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.original, topping: __lldb_expr_24.PizzaTopping.pepperoni), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.original, topping: __lldb_expr_24.PizzaTopping.cheese), __lldb_expr_24.MainDish2.pizza(dough: __lldb_expr_24.PizzaDough.original, topping: __lldb_expr_24.PizzaTopping.bacon), __lldb_expr_24.MainDish2.chiken(withSauce: true), __lldb_expr_24.MainDish2.chiken(withSauce: false), __lldb_expr_24.MainDish2.rice]
~~~



### 순환 열거형

순환 열거형은 열거형 항목의 연관 값이 열거형 자기 자신이고자 할 때 사용합니다. indirect 키워드를 통해 명실=할 수 있습니다. 

~~~swift
//순환 열거형
//열거형 항목의 연관 값이 열거형 자신의 값이고자 할 때 사용

enum ArithmeticExpression {
  case number(Int)
  indirect case addition(ArithmeticExpression, ArithmeticExpression)
  indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
} 
indirect enum ArithmeticExpression2 {
  case number(Int)
  case addition(ArithmeticExpression2, ArithmeticExpression2)
  case multiplication(ArithmeticExpression2, ArithmeticExpression2)
} //열거형 전체에 적용하고 싶을 때는 enum 키워드 앞에 indirect를 붙인다
~~~

위의 열거형을 활용하여 (5+4) * 2를 연산하는 예제를 수행해보겠습니다.

~~~Swift
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression : ArithmeticExpression) -> Int {
  switch expression {
  case .number(let value):
    return value
  case .addition(let left, let right) :
    return evaluate(left) + evaluate(right)
  case .multiplication(let left, let right) :
    return evaluate(left) * evaluate(right)
  }
}
let result : Int = evaluate(final)
print(result) // 18
~~~

indirect 키워드는 이진 탐색 트리나 순환 알고리즘을 구현할 때 유용하게 사용할 수 있습니다.