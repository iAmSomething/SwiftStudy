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



# 연산자

스위프트의 연산자는 문자로 표현한 함수와 같습니다. 프로그래머의 의도대로 연산자의 역할을 변경할 수 있습니다.

| 분류        | 설명                            | 예시      |
| :---------- | ------------------------------- | --------- |
| 단항연산자  | 피연산자가 한 개인 연산자       | !A        |
| 이항 연산자 | 피연산자가 두 개인 연산자       | A+B       |
| 삼항 연산자 | 피연산자가 세 개인 연산자       | A ? B : C |
| 전위 연산자 | 피연산자 앞에 위치하는 연산자   | !A        |
| 중위 연산자 | 피연산자 사이에 위치하는 연산자 | A+B       |
| 후위 연산자 | 피연산자 뒤에 위치하는 연산자   | A!        |

피연산자의 개수에 따라 혹은 연산자의 위치에 따라 위와 같이 구분할 수 있습니다.

> 스위프트에서는 띄어쓰기도 중요한 문법 중 하나입니ㅏㄷ. 연산자 앞 뒤중 공백의 위치에 따라 의미가 달라질 수 있기 때문입니다. 항상 연산자 사이사이에 띄어쓰기를 넣는 습관을 들이도록 합시다

## 연산자의 종류

### 할당 연산자

값을 할당할 때 사용하는 연산자입니다.

| 연산자      | 부호  | 설명                                                         |
| ----------- | ----- | ------------------------------------------------------------ |
| 할당 연산자 | A = B | A에 B의 값을 할당합니다. ( 서로 다른 데이터 타입인 경우 오류) |

### 산술 연산자

| 연산자 | 부호  | 설명                       |
| ------ | ----- | -------------------------- |
| 더하기 | A + B | A와 B를 더한 값을 반환     |
| 빼기   | A - B | A에서 B를 뻰 값을 반환     |
| 곱하기 | A * B | A와 B를 곱한 값을 반환     |
| 나누기 | A / B | A를 B로 나눈 값을 반환     |
| 나머지 | A % B | A를 B로 나눈 나머지를 반환 |

> ##### 스위프트의 나머지 연산자와 나누기 연산자
>
> 스위프트에서는 부동소수점 타입의 나머지 연산까지 지원합니다. 
>
> ~~~swift
> var number:Double = 5.0
> var result : Double = number.truncatingRemainder(dividingBy: 1.5) // 0.5
> result = 12.truncatingRemainder(dividingBy: 2.5) // 2.0
> ~~~
>
> 나누기 연산은 소수점을 제외한 정수를 결과값으로 반환합ㄴ디ㅏ.
>
> ~~~swift
> var result2:Int = 5 / 3 // 1
> result = 10 / 3 // 3
> ~~~
>
> 스위프트에서는 서로 다른 자료형끼리의 연산을 엄격하게 제한합ㄴ디ㅏ. .심지어 Int와 UInt끼리도 타입캐스팅을 해 주어야 연산이 가능합니다.

### 비교 연산자

| 연산자           | 부호    | 설명                                                         |
| ---------------- | ------- | ------------------------------------------------------------ |
| 값이 같다        | A == B  | A와 B가 같은 값인지 비교하여 불리언 값을 반환                |
| 값이 크거나 같다 | A >= B  | A가 B보다 크거나 같은 값인지 비교하여 불리언 값을 반환       |
| 값이 작거나 같다 | A <= B  | A가 B보다 작거나 같은 값인지 비교하여 불리언 값을 반환       |
| 값이 크다        | A > B   | A가 B보다 큰 값인지 비교하여 불리언 값을 반환                |
| 값이 작다        | A < B   | A가 B보다 작은 값인지 비교하여 불리언 값을 반환              |
| 값이 같지 않다   | A != B  | A와 B가 다른 값인지 비교하여 불리언 값을 반환                |
| 참조가 같다      | A === B | A와 B가 참조(레퍼런스)타입일 때<br /> A와B가 같은 인스턴스를 가리키는지 비교하여 불리언 값을 반환 |
| 참조가 같지 않다 | A !== B | A와 B가 참조(레퍼런스)타입일 때<br /> A와B가 다른 인스턴스를 가리키는지 비교하여 불리언 값을 반환 |
| 패턴 매치        | A ~= B  | A와 B의 패턴이 매치되는지 확인하여 불리언 값을 반환          |

> ##### 참조 비교
>
> 스위프트의 참조 타입인 클래스의 인스턴스에서 참조 비교 연산자를 사용합니다.
>
> ~~~swift
> let val1 = 3
> let val2 = 5
> let val3 = 5
> 
> let isSameValueAB: Bool = val1 == val2 // false
> let isSameValueBC: Bool = val2 == val3 // true
> class SomeClass{
>   
> }
> let refA : SomeClass = SomeClass()
> let refB : SomeClass = SomeClass()
> let refC : SomeClass = refA
> 
> let isSameRefAB : Bool = refA === refB // false
> let isSameRefAC : Bool = refA === refC // true
> 
> ~~~

### 삼항 조건 연산자

| 연산자           | 부호      | 설명                              |
| ---------------- | --------- | --------------------------------- |
| 삼항 조건 연산자 | Q ? A : B | Q가 참이면 A를, 거짓이면 B를 반환 |

삼항 조건 연산자를 이용하면 조건식을 한 줄에 표현할 수 있습니다.

~~~swift
var BiggerValue : Int = val1 > val3 ? val1 : val3
~~~

### 범위 연산자

| 연산자             | 부호    | 설명                                                  |
| ------------------ | ------- | ----------------------------------------------------- |
| 폐쇄 범위 연산자   | A...B   | A부터 B까지의 수를 묶어 범위를 표현(A,B 포함)         |
| 반폐쇄 범위 연산자 | A..< B  | A부터 B 미만의 수를 묶어 범위를 표현 (A포함, B불포함) |
| 단방향 범위 연산자 | A ....  | A 이상의 수를 묶어 범위를 표현                        |
|                    | ...A    | A 이하의 수를 묶어 범위를 표현                        |
|                    | ... < A | A 미만의 수를 묶어 범위를 표현                        |

### 부울 연산자

| 연산자 | 표현     | 설명                               |
| ------ | -------- | ---------------------------------- |
| NOT    | !B       | B의 참, 거짓을 반                  |
| AND    | A && B   | A와 B의 AND연산을 실행한 값을 반환 |
| OR     | A \|\| B | A와 B의 OR 연산을 실행한 값을 반환 |

### 비트 연산자

| 연산자 | 표현                | 설명                                     |
| ------ | ------------------- | ---------------------------------------- |
| NOT    | ~A                  | A의 비트를 반전한 결과를 반환            |
| AND    | A & B               | A와 B의 비트AND연산을 실행한 결과를 반환 |
| OR     | A \| B              | A와 B의 비트OR연산을 실행한 결과를 반환  |
| XOR    | A ^ B               | A와 B의 비트XOR연산을 실행한 결과를 반환 |
| Shift  | A >> B<br /> A << B | A의 비트를 B만큼 이동한 결과를 반환      |

### 복합 할당 연산자

| 표현    | 같은 표현  |
| ------- | ---------- |
| A += B  | A = A + B  |
| A -= B  | A = A - B  |
| A *= B  | A = A * B  |
| A /= B  | A = A / B  |
| A %= B  | A = A % B  |
| A <<= N | A = A << N |
| A >>= N | A = A >> N |
| A &= B  | A = A & B  |
| A \|= B | A = A \| B |
| A ^= B  | A = A ^ B  |

### 오버플로 연산자

오버플로우 가능성이 있는 연산에서는 추가 알고리즘 및 로직을 설계하여 연산하는것이 일반적이지만 swift에서는 기본 연산자를 통해 오버플로에 대비할 수 있습니다..

| 연산자            | 부호 | 설명                     |
| ----------------- | ---- | ------------------------ |
| 오버플로우 더하기 | &+   | 오버플로우에 대비한 덧셈 |
| 오버플로우 빼기   | &-   | 오버플로우에 대비한 뺄셈 |
| 오버플로우 곱하기 | &*   | 오버플로우에 대비한 곱셈 |

~~~swift
var unsignedInt : UInt8 = 0
let errerUnderFlow : UInt8 = unsignedInt - 1 // 런타임 오류
let underFlow : UInt8 = unsignedInt &- 1 // 255
~~~

### 기타 연산자

스위프트 라이브러리에 기본적으로 정의된 기타 연산자

| 연산자                  | 부호   | 설명                                    |
| ----------------------- | ------ | --------------------------------------- |
| nil 병합 연산자         | A ?? B | A가 nil이면 B, 아니면 A를 반환          |
| 부호변경 연산자         | -A     | A의 부호를 변경                         |
| 옵셔널 강제 추출 연산자 | O!     | 강제 옵셔널 바인딩                      |
| 옵셔널 연산자           | O?     | O를 안전하게 추출 / O가 옵셔널임을 표현 |

## 사용자 정의 연산자

스위프트에서는 연산자의 역할을 부여하여 사용자 정의 연산자 기호를 만들 수 있습니다.

### 전위 연산자 구현

Int타입의 제곱을 구하는 **전위 연산자를 정의하고 구현해보고자 합니다.

~~~swift
// 정의
prefix operator **
~~~

이제 정의된 연산자에 기능을 추가해주어야 합니다.

~~~swift
prefix func ** (val : Int) -> Int {
  return val * val
}
print(**(-5))  //25
~~~

전위 연산자에 기능을 추가할 때는 따로 연산자를 정의하지 않고 함수만 중복 정의하면 됩니다. 

~~~swift
prefix func **(val : String) -> String {
  return val + "  " + val
}
print(**(-5))  //25
print(**"안녕") // 안녕   안녕
~~~

### 후위 연산자 구현

Int 타입의 값에 10을 더한 값을 반환하는 ** 후위 연산자를 구현해보고자 합니다..

~~~swift
postfix operator **

postfix func ** (val : Int) -> Int {
  return val + 10
}
print(10**) // 20
~~~

하나의 피연산자에 전위 연산과 후위 연산을 사용하게 되면 후위 연산을 먼저 수행합니다.

~~~swift
print(**10**) // 400
~~~

### 중위 연산자 구현

중위 연산자는 우선순위 그룹을 명시해 줄 수 있습니다. precedencegruop 뒤에 그룹 이름을 써주어 정의할 수 있습니다. 

~~~pseudocode
precedencegroup 우선순위 그룹 이름 {
		higherThan: 더 낮은 우선순위 그룹
		lowerThan : 더 높은 우선순위 그룹
		associativity : 결합 방향 (left/right/none)
		assignment : 할당방향 사용 ( true / false )
}
~~~

연산자 우선순위 그룹은 중위 연산자에서만 사용됩니다.  assignment의 경우 true일 경우 옵셔널 체이닝을 할 때 오른쪽부터 옵셔널 체이닝이 시작된다는 것을 의미합니다.

만약 중위 연산자를 정의할 때 우선순위 그룹을 명시해주지 않는다면 우선순위가 가장 높은 DefaultPrecedence 그룹을 가지게 됩니다.

~~~swift
infix operator ** : MultiplicationPrecedence
func ** (lhs : String, rhs : String) -> Bool {
  return lhs.contains(rhs)
}
print("hello world" ** "world")
~~~

연산자를 새로 정의한 데이터 타입에서 유용하게 사용할 수 있습니다.

~~~swift
class Car {
  var modelYear : Int?
  var modelName : String?
}
struct SmartPhone {
  var company : String?
  var model : String?
}
func == (lhs : Car, rhs : Car) -> Bool {
  return lhs.modelName == rhs.modelName
}
func == (lhs : SmartPhone, rhs : SmartPhone) -> Bool {
  return lhs.model == rhs.model
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
~~~

타입 내부에 타입 매서드로 연산자 함수를 정의할 수 있습니다.

~~~swift
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
~~~



# 흐름 제어

특정 명령들을 반복해서 실행해야 하는 경우 조건문과 반복문을 통해 처리합니다. 스위프트의 흐름 제어 구문에서는 소괄호를 대부분 생략할 수 있습니다. 중괄호는 생략할 수 없습니다.

## 조건문

조건문에서는 **if** 구문과 **switch** 구문을 소개합니다.

### if 구문

다른 언어에서는 정수 실수 등 0이 아닌 모든 값을 참으로 취급하여 조건 값이 될 수 있지만, swift에서는 항상 Bool 타입이어야 합니다.

~~~swift
let first = 5
let second = 7
if first > second {
  print("first > second")
} else if first < second {
  print("first < second")
} else {
  print("first == second")
}
~~~

else if 는 몇 개가 이어져도 상관 없으며 else 는 없어도 상관없습니다. else if 조건을 충족하면 다음 else if 조건에 충족되더라도 실행되지 않고 조건문을 빠져나옵니다.

~~~swift
var biggerVal = 0
if first > second{
  biggerVal = first
} else if first == second {
  biggerVal = first
} else if first < second {
  biggerVal = second
} else if first == 5 { //이 조건이 충족되지만 실행되지 않는다
  biggerVal = 100
}
print(biggerVal) // 7
~~~

### switch 구문

보통 switch 문에서는 break 키워드를 사용하는데 swift에서는 break키워드 사용은 선택 사항입니다. case 내부의 코드를 모두 실행하면 switch 문이 종료됩니다. 그래서 일부러 break를 사용하지 않고 case를 연속 수행하던 트릭을 사용하지 못합니다. 이런 방식을 사용하려면 fallthrough 키워드를 사용합니다.

C언어와는 다르게 swift에서는 정수 타입 외에도 다양한 타입의 값이 들어갈 수 있습니다. 비교할 값이 열거형과 같은 한정된 값이 아닐 때는 꼭 default를 작성해주어야 합니다.  또 각 case에는 범위 연산자를 사용할 수도, where절을 사용하여 조건을 확장시킬 수 있습니다.

~~~swift
let integerValue : Int = 5
switch integerValue {
case 0:
  print("value == zero")
case 1...10:   // 범위 연산자를 사용
  print("value == 1~10")
  fallthrough  //다음 case도 실행
case Int.min..<0, 101..<Int.max :
  print("value < 0 or Value > 100")
  break
default:
  print("10 < value <= 100")
}

//value == 1~10
//value < 0 or Value > 100
~~~

부동소수 타입이나  String 타입의 데이터도 switch 문에 사용할 수 있습니다. 심지어는 튜플도 사용이 가능합니다.

~~~swift
switch tupleVal {
case ("김태훈", 25) :
  print("나야나")
default :
  print("누구")
}
~~~

튜플의 경유 **와일드카드 식별자**와 함께 사용하면 더 유용합니다.

~~~swift
switch tupleVal {
case ("김태훈", 23):
  print("나야나")
case ("김태훈 ", _) :
  print("이름만 맞음")
case (_, 25) :
  print("나이만") //이게 실행됨
default:
  print("누구?")
}
~~~

와일드카드 식별자를 사용하면 무시된 값을 직접 가져와야 하는 불편함도 생깁니다.. 그래서 미리 지정된 조건 값을 제외한 다른 값은 실행문 안으로 가져올 수 있습니다. let을 붙인 값 바인딩을 사용합니다.

~~~swift
switch tupleVal {
case ("김태훈", 24):
  print("나야나")
case ("김태훈", let age) :
  print("이름만 맞음 \(age)") // 이게 실행됨
case (let name, 25) :
  print("나이만 \(name)")
default:
  print("누구?")
}
~~~

where 키워드를 사용하여  case문의 조건을 확장할 수 있습니다.

~~~swift
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
~~~

열거형의 경우 모든 case에 대항하는 블럭을 구현하였다면 default를 구현하지 않나도 됩니다.

~~~swift
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
~~~

나중에 열거형에 case를 추가하면 기존의 switch 구문은 컴파일 오류가 발생할 것입니다.  그래서 이런 경우를 대비하기 위해서 swift5.0버전에서 추가된 unknown 속성을 사용해 이런 문제를 대처할 수 있게 도와줍니다.

~~~swift
enum Menu {
  case chicken
  case pizza
}
let lunchMenu : Menu = .chicken
switch lunchMenu {
case .chicken:
  print("칰힌")
case .pizza :
  print("pizza")
case _:
  print("메뉴가 뭔지")
}
~~~

이렇게 와일드카드 case를 만들어서 case추가에 대해 대응할 수 있지만, 만약에  열거형 case를 추가하고 switch의 해당 case문을 수정하지 않았다면 컴파일러도 잡지 못하는 논리 오류를 불러일으키게 됩니다. 이런 문제를 해결하기 위해서  @unknown 속성을 사용합니다.

~~~swift
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
~~~

이렇게 unknown속성을 사용 할 경우 다음과 같은 wraning이 발생하기 때문에 나중에 디버깅할 때 한번 더 확인할 수 있게 됩니다.

![image-20200731143102150](https://tva1.sinaimg.cn/large/007S8ZIlgy1gha3dx3kcxj314y08mtap.jpg)

unknown속성을 부여한 case는 가장 마지막  case로 작성하여야 합니다.

## 반복문

이렇게 조건을 통해 명령어를 분기했다면, 같거나 비슷한 명령을 반복해야 할 때는 반복문을 사용합니다. 특히나 배열처럼 sequence가 있는 데이터는 반복문으로 편리하게 처리할 수 있습니다.

### for in 구문

for in 반복 구문은 다른 언어에서의  for each와 비슷합니다. 

~~~pseudocode
for 임시 상수 in 시퀀스 아이템 {
  실행 코드
}
~~~

다음과 같은 방식으로 사용됩니다.

~~~swift
for i in 0...5 {
  if i.isMultiple(of: 2){
    print(i) // 0,2,4
  }
}
for char in "안녕하세요" {
  print(char) //한글자씩 나옴
}
var result = 1
for _ in 1...3 { // 와일드카드 식별자를 이용할 수 있다
  result *= 10
}
print(result) // 1000
~~~

for in 구문은 swift의 기본 컬렉션 타입에서도 유용하게 사용할 수 있습니다.

~~~swift
let friends : [String : Int] = ["김태훈" : 25, "노한솔" : 26, "나무": 7]
for tuple in friends{
  print(tuple)
}
for (key, val) in friends {
  print(key)
  print(val)
}
~~~

### while 구문

while 구문도 for 구문과 다르지 않습니다. 조건은 Bool 타입으로 지정되어야 하며 continue, break 등을 사용할 수 있습니다.

~~~swift
var names : [String] = ["a","b","c","d","e"]

while names.isEmpty == false {
  print("bye \(names.removeFirst())")
}
print()
names = ["a","b","c","d","e"]
repeat {
  print("bye \(names.removeFirst())")
} while names.isEmpty == false
~~~

repeat while구문은 do while구문과 다르지 않습니다. repeat 블록의 코드를 1회 실행하고  while 조건문을 거칩니다.

## 구문 이름표

반복문을 작성하다 보면 여러 겹의 반복문을 사용하는 경우가 많이 발생합니다. 이 때 반복문을 제어하는 break, continue 가 어떤 범위에 적용되어야 하는지 애매하거나 실수가 발생할 수 있습니다. 그래서 구문의 이름을 지정해주면 구문 이름표를 사용할 수 있습니다. 

~~~swift
var numbers:[Int] = [3,2342,6,3252]

numberLoop: for num in numbers {
  if num > 5 || num < 1 {
    continue numberLoop
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
      break numberLoop
    }
    numbers.removeFirst()
  }
}
~~~

--------

# 함수

함수는 작업의 가장 작은 단위이자 하나의 작은 프로그램이기도 합니다. 함수는 프로그램을 이루는 주된 요소 중 하나인데, 스위프트에서 함수는 하나의 값으로도 사용할 수 있습니다. 

스위프트에서 함수는 다른 언어에서의 함수보다 다양한 모습으로 존재하며, 코딩 스타일도 여러 가지입니다. 따라서 개인이나 협업자끼리 **코딩 규칙**을 만들고 함수를 사용하기를 권합니다.

## 함수와 메서드

함수와 메서드는 상황이나 위치에 따라 다른 용어로 부르는 것일 뿐 기본적으로 같습니다. 

- 구조체 클래스 열거형 등 특정 타입에 연관되어 사용하는 함수를 **메서드**라고 부릅니다.
- 모듈 전체에서 전역적으로 사용할 수 있는 함수를 그냥 **함수**라고 부릅니다.

함수가 위치하거나 사용되는 범위에 따라 호칭이 달라질 뿐 함수라는것은 변함이 없습니다.

## 함수의 정의와 호출

스위프트에서 함수는 **재정의**(override)와 **중복 정의**(overload)를 모두 지원합니다. 따라서 매개변수의 타입이 다르면 같은 이름의 함수르르여러 개 만들 수 있고, 매개변수의 개수가 달라도 같은 이름의 함수를 만들 수 있습니다.

### 기본적인 함수의 정의와 호출

기본적으로는 함수의 이름과 매개변수, 반환 타입등을 사용하여 함수를 정의합니다.

함수를 저으이하는 키워드는 func입니다 .함수 이름을 지정해준 후 매개변수는 소괄호로 감싸주고, 반환 타입을 명시하기 위해서 ->를 사용하여 어떤 타입이 반환될 것인지 명시해줍니다. 반환 키워드는 return입니다.

~~~pseudocode
func 함수 이름(매개변수 ...) -> 반환 타입 {
    실행 구문
    return 반환 값	
}
~~~

스위프트에서 기본 형태의 함수 정의와 사용

~~~~swift
func hello (name : String) -> String {
  return "hello \(name)"
}
let helloJenny : String = hello(name: "Jenny")
print(helloJenny)
~~~~

기본 형태는 다른 프로그래밍 언어와 비슷합니다.

### 매개변수

스위프트의 매개변수를 어떻게 정의하냐에 따라서도 모습이 크게 달라질 수 있습니다.

#### 매개변수가 없는 함수와 매개변수가 여러개인 함수

매개변수가 필요 없다면 매개변수 위치를 공란으로 비워 둡니다.

~~~swift
func helloWorld() -> String {
  return "Hello, world!"
}
print(helloWorld())

~~~

매개변수를 여러 개 사용하려면 쉼표로 매개변수를 구분합니다. 주의할 점은 함수를 호출할 때 매개변수 이름을 붙여주고 :을 사용하여 전달인자를 보내준다는 점입니다. 

~~~swift
func sayHello(myName : String, yourName: String) -> String{
  return "hello \(yourName)!, I'm \(myName)"
}
print(sayHello(myName: "김태훈", yourName: "탱구"))
~~~

#### 매개변수 이름과 전달인자 레이블

매개변수 이름과 더불어 전달인자 레이블을 지정해줄 수 있습니다. 보통 함수를 정의할 때 매개변수를 정의하면 매개변수 이름과 전달인자 레이블은 같은 이름으로 사용할 수 있지만, 전달인자 레이블을 별도로 지정하면 함수 외부에서 매개변수의 역할을 좀 더 명확히 할 수 있습니다.

~~~swift
func sayHello(from myName : String, to yourName: String) -> String{
  return "hello \(yourName)!, I'm \(myName)"
}
print(sayHello(from: "김태훈", to: "탱구"))
~~~

기존의 읜어들처럼 전달인자 레이블을 사용하고 싶지 않다면 와일드카드 식별자를 사용할 수 있습니다.

~~~swift
func sayHello(_ myName : String, _ yourName: String) -> String{
  return "hello \(yourName)!, I'm \(myName)"
}
print(sayHello("김태훈", "탱구"))
~~~

이렇게 전달인자 레이블을 변경하면 함수이름이 변경됩니다. 즉 전달인자 레이블만 다르게 써준 함수도 오버로드로 동작할 수 있습니다.

~~~swift
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
~~~

#### 매개변수 기본값

스위프트 함수에서는 매개변수마다 기본값을 지정할 수 있습니다. 즉 매개변수가 전달되지 않으면 기본값을 사용합니다. 예를 들어 위에 작성한 함수에서 repeatCount 값을 3으로 기본값을 지정해 주면 함수를 호출 할 때 매개변수를 넘겨 주지 않아도 3으로 설정해 함수를 실행합니다.

~~~swift
func sayHello(_ name :String, times : Int = 3) -> String{
  var result : String = ""
  for _ in 0..<times{
    result += "Hello \(name)!" + " "
  }
  return result
}
print(sayHello("탱구"))
print(sayHello("탱구", times : 5))
~~~

기본값이 없는 매개변수를 기본값이 있는 매개변수 앞에 사용하세요 기본값이 없는 매개변수는 함수를 사용함에 잇어 중요한 값을 전달할 가능성이 높습니다. 무엇보다 기본값이 있는지와 상관 없이 중요한 매개변수는 앞쪽에 뱊치하는 것이 좋습니다.

#### 가변 매개변수와 입출력 매개변수

매개변수로 몇 개의 값이 들어올 지 모를 때 가변 매개변수를 사용할 수 있습니다. .가변 매개변수는 0개 이상의 값을 받아올 수 있으며, 가변 매개변수로 들어온 인자 값은 배열처럼 사용할 수 있습니다. 함수마다 가변 매개변수는 하나만 가질 수 있습니다.

~~~swift
func sayHelloToFriends(me :String, friends names : String...) -> String{
  var result : String = ""
  for friend in names{
    result += "Hello \(friend)! "
  }
  result += "I'm \(me)"
  return result
}
print(sayHelloToFriends(me: "김태훈", friends: "a","b","c","d"))
~~~

함수의 전달인자로 값을 전달할 때는 보통 값을 복사해서 전달합니다. 값이 아닌 참조를 전달하려면 입출력 매개변수를 사용합니다. 값 타입 데이터의 참조를 전달인자로 보내면 함수 내부에서 참조하여 원래 값을 변경합니다. 하지만 이 방법은 함수 외부의 값에 어떤 영향을 줄 지 모르기 때문에 지양하는 패턴입니다.

~~~swift
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

~~~

입출력 매개변수는 메모리 안전을 위협할 수 있기 때문에 몇몇 제약이 있습니다.

### 반환이 없는 함수

반환 값이 굳이 필요하지 않은 함수의 경우 반환 타입을 Void로 표기하거나, 생략하면 됩니다.

~~~swift
func sayHelloWorld(){
  print("Hello world")
}
sayHelloWorld()
~~~

### 데이터 타입으로의 함수

스위프트의 함수는 일급 객체이므로 하나의 데이터 타입으로 사용할 수 있습니다. 각 함수는 매개변수 타입과 반환 타입으로 구성된 하나의 타입으로 사용할 수 있다는 뜻입니다.

~~~swift
typealias CalculateTwoInts = (Int, Int) -> Int // 두 개의 int를 받아 하나의 int를 반환하는 함수를 타입 별칭 짓기를 통해 관리한다.

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
~~~

> ##### 매개변수 타입과 반환 타입
>
> 함수형 프로그래밍에서 특정 로직에 관여할 함수의 매개변수와 반환 타입은 매우 종요합니다. 타입 별칭을 통해 손쉽게 함수를 관리할 수 있으며 매개변수와 반환 타입만 잘 연계된다면 굉장히 훌륭한 패턴을 완성할 수 있습니다.

전달 인자로 함수를 전달받는 경우도 있습니다.

~~~swift
func printMathResult(_ mathFunc : CalculateTwoInts, _ a : Int, _ b : Int) {
  print("result: \(mathFunc(a,b))")
}
printMathResult(addTwoInts,3, 5)
~~~

특정 조건에 따라 다른 함수를 반환해줄 수 있습니다.

~~~swift
func chooseMathFunc( _ toAdd : Bool)->CalculateTwoInts {
  return toAdd ? addTwoInts : multiplyTwoInts
}
printMathResult(chooseMathFunc(true), 3, 5)
~~~

> ##### 전달인자 레이블과 함수 타입
>
> 전달인자 레이블은 함수 타입의 구성요소가 아니므로 함수 타입을 작성할 때는 전달인자 레이블을 써줄 수 없습니다.
>
> let someFunc : (lhs : Int, rhs : Int) -> Int //오류
>
> let someFunc : (_ lhs : Int, _ rhs : Int) -> Int // 오류 아님
>
> let someFunc : (Int, Int) -> Int // 오류 아님

## 중첩 함수

스위프트는 데이터 타입의 중첩이 자유롭습니다. 예를 들어 열거형 안에 또 다른 열거형이 들어갈 수 있고 클래스 안에 또 다른 클래스가 들어올 수 있습니다. 함수도 마찬가지로 함수 안에 함수가 들어올 수 있습니다.

중첩 함수는 상위 함수의 블록 내부에서만 사용할 수 있습니다. 

~~~swift
typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft : Bool) -> MoveFunc {
  func goRight(_ currentPosition : Int) -> Int{ //중첩 함수
    return currentPosition + 1
  }
  func goLeft(_ currentPosition : Int) -> Int{ //중첩 함수
    return currentPosition - 1
  }
  return shouldGoLeft ? goLeft :  // 함수 내부에서만 쓰인다
}

var position = -4

let moveToZero : MoveFunc = functionForMove(position > 0)
while(position != 0) {
  print("\(position)...")
  position = moveToZero(position)
}
~~~

전역함수가 많은 프로젝트에서는 전역으로 사용이 불필요한 함수들을 사용 범위를 명확하고 깔끔하게 표현해 줄 수 있습니다.

## 종료되지 않는 함수

스위프트에는 return되지 않는 함수가 있습니다. 

종료되지 않는다는 의미는 정상적으로 끝나지 않는 함수라는 뜻입니다. 이를 비반환 함수/매서드 라고 합니다. 비반환 함수 안에서는 오류를 던진다던가 중대한 시스템 오류를 보고하는 일을 하고 프로세스를 종료해 버립니다.. 비반환 함수는 어디서든 호출이 가능하고 guard구문의 else블록에서도 호출할 수 있습니다.

비반환 함수는 반환 타입을 Never라고 명시해 주면 됩니다.

~~~swift
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

someFunction(isAllIswell: true) // all is well
someFunction(isAllIswell: false) // 에러
// 프로세스 종료 후 오류 보고
~~~

Never 타입이 스위프트 표준 라이브러리로 사용되는 대표적인 예로 fatalError함수가 있습니다.

## 반환 값을 무시할 수 있는 함수

프로그래머가 의도적으로 함수의 반환 값을 사용하지 않을 경우 컴파일러가 함수의 결과 값을 사용하지 않았다는 경고를 보낼 때도 있습니다. 이 때 함수의 반환 값을 무시해도 된다는  @discardableResult 선언속성을 사용하면 됩니다.

~~~swift
func say(_ something:String) -> String{
  print(something)
  return something
}
@discardableResult func discardableResultSay(_ something : String) -> String{
  print(something)
  return something
}
say("hello") // 컴파일러가 경고를 표시할 수 있음
discardableResultSay("hello")
~~~

# 옵셔널

옵셔널은 스위프트의 특징 중 하나인 안전성을 문법으로 담보하는 기능입니다. 단어 뜻 그대로 '선택적인', 즉 값이 '있을수도, 없을수도 있음'을 나타내는 표현입니다. 변수나 상수의 값이 nil일 수도 있다는 것을 의미합니다.

## 옵셔널 사용

옵셔널은 해당 변수 또는 상수에 값이 있을지 보장할 수 없는 경우 사용합니다.

~~~swift
var name : String = "김태훈"
name = nil // 오류
var myName : String? = "김태훈"
myName = nil
~~~

nil은 옵셔널로 선언된 곳에서만 사용될 수 있습니다. 옵셔널 변수 또는 상수 등은 데이터 타입 뒤에 ?를 붙여 표현해줍니다.

옵셔널은 변수나 상수의 값이 잘못된 값인 경우 함수의 매개변수로 쓰이거나 다른 프로퍼티등을 사용할 때 오류를 반환할 수도 있기 때문에 이를 명시적으로 처리하기 위해 사용됩니다..

# 구조체와 클래스

객체지향 프로그래밍 패러다임을 사용하는 프로그래머라면 클래스를 사용하여 데이터를 구조화하여 관리해 본 경험이 있을 것입니다. 스위프트에서 구조체와 클래스는 모습과 문법이 거의 흡사합니다. 차이점이 있다면 구조체의 인스턴스는 **값 타입**이고, 클래스의 인스턴스는 **참조 타입**이라는 것입니다.

## 구조체

구조체를 어떻게 정의하고 인스턴스를 어떻게 생성하는지, 그리고 구조체를 어떻게 활용하는지 알아보겠습니다. 아래 예시를 통해 구조체의 기본적인 구조를 확인할 수 있습니다.

~~~swift
struct BasicInformation {
  var name:String
  var age:Int
}
~~~

구조체의 블럭 안에는 프로피티나 메서드들을 선언할 수 있습니다.

### 구조체 인스턴스의 생성 및 초기화

구조체를 정의하고, 인스턴스를 생성하여 초기화하고자 할 때 기본적으로 생서오디는 멤버와이즈 이니셜라이저라는 것을 사용합니다. 구조체에 매개변수는 프로퍼티 이름으로 자동 지정됩니다.

인스턴스가 생성되고 초기화된 후 프로퍼티 값에 접근하고 싶으면 마침표를 사용하면 됩니다.

~~~swift
var myInfo : BasicInformation = BasicInformation(name: "김태훈", age: 25) // 자동으로 구조체 내부의 프로퍼티의 이름으로 이니셜라이저를 구성합니다.
myInfo.name = "나무"
myInfo.age = 26
~~~

이렇게 기본적으로 적용되는 멤버와이즈 이니셜라이저 외에도 사용자 정의 이니셜라이저를 구현할 수 있습니다.

## 클래스

swift에서 클래스는 부모클래스가 없더라도 상속 없이 단독으로 정의가 가능합니다.

> ##### 클래스 명명법
>
> 클래스는 새로운 타입을 생성해주는 것과 마찬가지이므로 UpperCamelCase를 사용하여 명명하여줍니다.

클래스의 정의 방법은 다음과 같습니다.

~~~pseudocode
class 클래스 이름 : 부모 클래스 이름 {
	프로퍼티 밑 메서드
}
~~~

클래스를 정의하는 방식이 위에서 사용한 구조체와 매우 흡사하다는 것을 알 수 있습니다. 여타 다른 객체지향 패러다임 언어들처럼 상속을 받을 수 있는데, 이 때는 콜론을 써주고 상속받을 부모클래스 이름을 명시합니다.

~~~swift
class Person {
  var height : Float = 0.0
  var weight : Float = 0.0
}
~~~

### 클래스 인스턴스의 생성과 초기화

클래스를 정의한 후 인스턴스를 생성하고 초기화하고자 할 때 기본적인 이니셜라이저를 사용합니다. 위에서 작성한 Person 클래스의 경우 프로퍼티의 기본값이 지정되어 있으니 따로 초깃값을 전달해주지 않아도 됩니다.

인스턴스가 초기화된 후 프로퍼티의 값에 접근하고 싶다면 마침표를 사용하여 접근하면 됩니다. 여기서 구조체와 다른 점은 클래스는 **참조 타입**이므로 선언한 인스턴스를 let으로 선언하더라도 내부 프로퍼티의 값을 변경할 수 있다는 것입니다.

~~~swift
var thkim:Person = Person()
thkim.height = 100
thkim.weight = 50

let 김나무:Person = Person() 
김나무.weight = 6.0 //let으로 선언한 인스턴스의 프로퍼티를 변경할 수 있다.
~~~

마찬가지로 사용자가 직접 이니셜라이저를 정의해 줄 수 있습니다.

### 클래스 인스턴스의 소멸

클래스의 인스턴스는 **참조 타입**이기 때문에 더 이상 참조가 필요 없을 때 메모리에서 해제됩니다. 이 때 클래스 내부에 deinit 메서드를 구현해 주면 클래스가 소멸되기 직전 deinit 메서드를 호출합니다. 이렇게 호출되는 메서드를 디이니셜라이저라고 부릅니다. 이러한 디이니셜라이저 메서드는 클래스당 하나만 구현할 수 있으며, 매개변수와 반환값을 가질 수 없습니다. 

~~~swift
class Person {
  var height : Float = 0.0
  var weight : Float = 0.0
  
  deinit {
    print("클래스가 소멸됩니다.")
  }
}


var thkim:Person? = Person()
thkim?.height = 100
thkim?.weight = 50
thkim = nil //이 때 클래스가 반환되며 디이니셜라이저를 호출합니다.
~~~

보통 deinit 메서드에는 인스턴스가 메모리에서 해제되기 직전에 처리할 코드를 넣어줍니다. 예를 들면 인스턴스 소멸 전에 데이터를 저장한다던가, 다른 객체에 인스턴스 소멸을 알려야 할 때 많이 사용합니다.

## 구조체와 클래스의 차이

구조체와 클래스는 다음과 같은 공통점들을 갖습니다.

* 값을 저장하기 위해 **프로퍼티**를 정의할 수 있습니다.
* 기능 실행을 위해 **메서드**를 정의할 수 있습니다.
* 서브스크립트 문법을 통해 구조체 또는 클래스가 같는 프로퍼티에 접근하도록 서브스크립트를 정의할 수 있습니다.
* 초기화될 때의 상태를 지정하기 위해 **이니셜라이저**를 정의할 수 있습니다.
* 초기구현과 더불어 새로운 기능 추가를 위해 **익스텐션**을 통해 확장할 수 있습니다.
* 특정 기능을 실행하기 위해 특정 **프로토콜**을 준수할 수 있습니다..

하지만 다음과 같은 차이점을 가집니다.

* 구조체는 **상속**할 수 없습니다.
* 타입캐스팅은 클래스의 인스턴스에만 허용됩니다.
* 디이니셜라이저는 클래스의 인스턴스에서만 활용할 수 있습니다.
* 참조 횟수 계산은 클래스의 인스턴스에만 적용됩니다.

가장 차이점을 보이는 부분은 타입에 대한 부분입니다. 

### 값 타입과 참조 타입

구조체는 값 타입이고 클래스는 참조 타입입니다. 이 둘의 가장 큰 차이는 '무엇이 전달되느냐'입니다. 어떤 함수의 전달 인자로 값 타입을 넘긴다면 **전달될 값이 복사**되어 넘어갑니다. 그러나 참조 타입이 전달인자로 전달될 때는 **전달될 값의 주소**가 전달됩니다. C언어에서 사용되는 포인터와 유사한 개념입니다.

~~~swift
struct BasicInformation {
  var name:String
  var age:Int
}

var myInfo : BasicInformation = BasicInformation(name: "김태훈", age: 25)
myInfo.name = "나무"
myInfo.age = 26

var friendInfo : BasicInformation = myInfo // 값 타입이기 때문에 전달될 값이 복사되어 넘어갑니다.

print(friendInfo.name) // 나무
print(myInfo.name) // 나무

friendInfo.name = "탱구" // 전달된 값을 바꾸어도 원래 값에 영향을 주지 않습니다.

print(friendInfo.name) // 탱구
print(myInfo.name) // 나무

class Person {
  var height : Float = 0.0
  var weight : Float = 0.0
}

var me : Person = Person()
var friend : Person = me // 참조 타입이기 때문에 주소값이 전달됩니다.

print(me.height) // 0
print(friend.height) // 0

friend.height = 100 // 해당 값을 바꾸면 주소값에 있는 프로퍼티의 값을 바꿉니다.

print(me.height) // 100
print(friend.height) // 100

func changeBasicInfo(_ info : BasicInformation) {
  var copiedInfo : BasicInformation = info
  copiedInfo.age = 1
}
func changePersonInfo(_ info : Person) {
  info.height = 200
}

changeBasicInfo(myInfo) 
print(myInfo.age) // 26

changePersonInfo(me)
print(me.height) // 200
~~~

클래스의 인스턴스끼리 참조가 같은지 확인하기 위해 식별 연산자를 사용합니다. 식별 연산자를 통해 두 참조가 같은 인스턴스를 가리키고 있는지 비교해보는 코드입니다.

~~~swift
var me : Person = Person()
var friend : Person = me
var anotherFriend : Person = Person()
print(me === friend) //true
print(me === anotherFriend) // false
~~~

>##### 스위프트의 기본 데이터 타입은 모두 구조체입니다.
>
>스위프트 표준 라이브러리에는 여러 데이터타입들이 구현되어 있는데 Int Bool Float 등등 기본 데이터 타입들은 전부 구조체로 구현되어 있습니다.

## 구조체와 클래스 선택하는 기준

애플의 가이드라인에서는 다음 조건 중 하나 이상에 해당된다면 구조체를 사용하는 것을 권장합니다.

* 연관된 간단한 값의 집합을 캡슐화할 때
* 캡슐화 한 값을 복사하는것이 합당할 때
* 구조체에서 저장된 프로퍼티가 값 타입이며, 참조하는 것이 합당하지 않을 때
* 다른 타입으로부터 상속받거나 상속할 필요가 없을 때

# 프로퍼티와 메서드

**프로퍼티**란 클래스나 구조체 또는 열거형 등에 관련된 값을 의미합니다. 메서드는 앞에 함수파트에서 설명한 것 처럼 클래스나 구조체 등에서 사용되는 함수를 뜻합니다.

## 프로퍼티

프로퍼티는 크게 **저장 프로퍼티**, **연산 프로퍼티**, **타입 프로퍼티**로 나뉩니다. 

저장 프로퍼티는 인스턴스의 변수 또는 상수를 의미합니다. 연산 프로퍼티는 값을 저장한 것이 아니라 특정 연산을 실행한 결과값을 의미합니다. 특정 타입에 사용되는 프로퍼티도 있는데 이를 타입 프로퍼티라고 합니다.

| 프로퍼티 종류 | 의미                                                | 사용되는 영역          |
| ------------- | --------------------------------------------------- | ---------------------- |
| 저장 프로퍼티 | 상수나 변수 처럼 특정 타입의 값을 저장하는 프로퍼티 | 구조체, 클래스         |
| 연산 프로퍼티 | 특정 연산을 실행한 결괏값을 나타내는 프로퍼티       | 구조체, 클래스, 열거형 |
| 타입 프로퍼티 | 특정 타입에 사용되는 프로퍼티                       | 클래스                 |

프로퍼티의 값이 변하는 것을 감시하는 프로퍼티 감시자도 있습니다. 프로퍼티 감시자는 값의 변화에 따른 특정 작업을 수행합니다. 프로퍼티 감시자는 저장 프로퍼티에 적용할 수 있으며 부모클래스로부터 상속받을 수 있습니다.

### 저장 프로퍼티

var 혹은 let 키워드를 통해 선언하는 변수 및 상수 값을 저장하는 프로퍼티입니다. 저장 프로퍼티를 정의할 때 기본값과 초기값을 지정해 줄 수 있습니다.

> 구조체는 저장 프로퍼티가 옵셔널이 아니더라도, 저장 프로퍼티를 모두 포함하는 이니셜라이저를 자동으로 생성합니다. 하지만 클랫의 경우 저장 프로퍼티가 옵셔널이 아니라면 프로퍼티 기본값을 지정해 주거나 사용자 정의 이니셜라이저를 작성하여 초기화해주어야 합니다.
>
> 또한 클래스 인스턴스의 상수 프로퍼티는 인스턴스가 초기화 될 때 한 번만 값을 할당할 수 있으며, 자식클래스에서 이 값을 재정의 할 수 없습니다.

~~~swift
struct CoordinatePoint {
  var x : Int
  var y : Int
}
let myPoint : CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position {
  var point : CoordinatePoint
  let name : String
  init (name : String, currentPoint : CoordinatePoint){ // 저장 프로퍼티의 기본값을 지정해주지 않았기 때문에 이니셜라이저를 작성
    self.name = name
    self.point = currentPoint
  }
}
let myPosition : Position = Position(name: "김태훈", currentPoint: myPoint) // 사용자 정의 이니셜라이저를 호출해야 합니다.
~~~

구조체는 프로퍼티에 맞는 이니셜라이저를 자동으로 제공하지만 클래스는 사용자 지정 이니셜라이저를 작성해주어야 합니다. 

인스턴스를 생성할 때 이니셜라이저를 통해 초깃값을 보내야 하는 이유는 프로퍼티가 **옵셔널이 아닌 값**으로 선언되어 있기 때문입니다. 프로퍼티의 값이 옵셔널이라면 초깃값을 넣어주지 않아도 됩니다.

~~~swift
class Position2{
  var point : CoordinatePoint?
  let name :String
  init (name : String){
    self.name = name
  }
}

let myPosition2 : Position2 = Position2(name: "김태훈")
myPosition2.point = CoordinatePoint(x: 4, y: 3)

~~~

이렇게 옵셔널과 이니셜라이저를 적절히 사용하면 구조체와 클래스를 의도했던 대로 작성할 수 있게 됩니다.

### 지연 저장 프로퍼티

인스턴스에서 값이 필요할 때 값이 할당되는 지연 저장 프로퍼티가 있습니다.. 지연 저장 프로퍼티는 호출이 있어야 값을 초기화하며, 이 때 lazy라는 키워드를 사용합니다.

상수는 인스턴스가 완전히 생성되기 전에 초기화해야 하므로 지연 저장 프로퍼티와는 맞지 않아 변수들만 지연 저장 프로퍼티로 활용합니다. 

지연 저장 프로퍼티는 주로 복잡한 클래스나 구조체를 구현할 때 많이 사용됩니다. 클래스 인스턴스의 저장 프로퍼티로 다른 클래스의 인스턴스나 구조체 인스턴스를 할당할 때 지연 저장 프로퍼티를 활용하여 불필요한 성능 저하나 공간 낭비를 줄일 수 있습니다.

~~~swift
class Position2{
  lazy var point : CoordinatePoint = CoordinatePoint()
  let name :String
  init (name : String){
    self.name = name
  }
}
~~~

> 다중 스레드 환경에서 지연 저장 프로퍼티에 동시다발적으로 접근할 때는 한 번만 초기화된다는 보장이 없습니다.많은 스레드가 비슷한 시점에 지연 저장 프로퍼티에 접근한다면 여러 번 초기화 될 수 있으니 사용에 주의해야 합니다.

### 연산 프로퍼티

연산 프로퍼티는 실제 값을 저장하는 프로퍼티가 아니라, 특정 상태에 따른 값을 연산하는 프로퍼티입니다.. 인스턴스의 내/외부 값을 연산하여 적절한 값을 돌려주는 getter의 역할이나, 내부의 프로퍼티 값을 간접적으로 설정하는 setter의 역할을 할 수도 있습니다.

메서드를 두고 연산 프로퍼티를 사용하는 데 의문이 들 수 있습니다. 메서드를 통해 인스턴스 내부에 접근하려면 접근자와 설정자를 구현해야 합니다. 이를 감수하고 메서드로 구현한다 하더라도 두 메서드가 분산 구현되어서 코드의 가독성이 나빠집니다.

~~~swift
//메서드로 구현한 경우
struct CoordinatePoint {
  var x : Int
  var y : Int
  
  //접근자
  func oppositePoint() -> Self {
    return CoordinatePoint(x: -x, y: -y)
  }
  //설정자
  mutating func setOppositePoint(_ oppsite : CoordinatePoint){
    x = -oppsite.x
    y = -oppsite.y
  }
}

var myPoint : CoordinatePoint = CoordinatePoint(x: 10, y: 5)
print(myPoint)
print(myPoint.oppositePoint())

myPoint.setOppositePoint(CoordinatePoint(x: 15, y: 10))
print(myPoint)
~~~

oppsitePoint() 메서드를 통해 대칭점을 구할 수 있으며, setOppsitePoint(_ :)를 통해 대칭점을 설정해주어야 합니다.

이 경우 접근자와 설정자가 분리되어 코드를 한번에 이해하기 어렵습니다.

~~~swift
struct CoordinatePoint2 {
  var x : Int
  var y : Int
  var oppsitePoint : CoordinatePoint{ // 연산 프로퍼티
    //접근자
    get {
      return CoordinatePoint(x : -x, y : -y)
    }
    //설정자
    set(oppsite) {
      x = -oppsite.x
      y = -oppsite.y
    }
  }
}
var myPoint2 : CoordinatePoint2 = CoordinatePoint2(x: 10, y: 20)
print(myPoint2)
print(myPoint2.oppsitePoint)
myPoint2.oppsitePoint = CoordinatePoint(x: 15, y: 10)
print(myPoint2)
~~~

이런 식으로 연산 프로퍼티를 사용하면 하나의 프로퍼티에 접근자와 설정자가 모두 모여있고, 각각의 역할이 명확하게 표현됩니다. 

설정자의 매개변수로 원하는 이름을 소괄호 안에 명시해주면 set 메서드 내부에서 잔달받은 전달인자를 사용할 수 있습니다. 관용적인 표현으로newValue로 매개변수 이름을 대신할 수 있습니다. 그럴 경우에는 매개변수를 따로 표기하지 말아야 합니다.

접근자 내부의 코드가 단 한 줄이고, 그 결괏값의 타입이 프로퍼티의 타입과 같다면 return 키워드를 생략해도 됩니다.

~~~swift
struct CoordinatePoint2 {
  var x : Int
  var y : Int
  var oppsitePoint : CoordinatePoint{ // 연산 프로퍼티
    get {
      CoordinatePoint(x : -x, y : -y)
    }
    set {
      x = -newValue.x
      y = -newValue.y
    }
  }
}
~~~

연산 프로퍼티를 읽기 전용으로만 구현하려면 get 메서드만 사용하면 됩니다.

