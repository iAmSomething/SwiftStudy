import UIKit

//데이터 타입 Safety
//스위프트는 "타입"에 굉장히 민감하고 엄격합니다. 다른 타입끼리의 데이터 교환은 꼭 타입캐스팅을 거쳐야 합니다.(실제로는 인스턴스를 생성하여 할당하는 것)

//데이터 타입 안심.
//스위프트가 컴파일 시 타입을 확인하는것을 말함

//타입 추론
//변수나 상수를 선언할 때 타입을 명시하지 않아도 타입을 추론하여 결정한다.
var name = "김태훈" //String타입으로 타입 추론을 하였다
//name = 100 // String 타입으로 추론된 변수에 Int타입 값을 넣으면 에러가 난다

//타입 별칭
//이미 존재하는 데이터 타입ㅇ에 임의로 다른 이름을 부여할 수 있댜.

typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 25
var year:YourInt = 2020
year = age // 둘다 Int타입이기 때문에 같은 타입으로 취급된다.

//튜플
//튜플은 타입 이름이 따로 없고 일정 타입의 나열만으로 생성이 가능하다.
//간단한 구조체 형식이라고 생각되는,,

var Person : (String, Int, Double) = ("김태훈",100,187.0)

Person.1 = 25 // 튜플의 각 항목에 대해서는 순서대로 .0, .1, .2 이렇게 접근할 수 있다.
print(Person)
//찐구조체처럼 각 요소에 이름을 붙여줄 수도 있다

var Person2 : (name:String, age:Int, height:Double) = ("김태훈",100,187.0)

print(Person2.age)

//위에 있는 타입 별칭과 튜플을 합치면 매번 튜플을 사용할 때 마다 안적어줘도 된다.
typealias PersonTuple = (name:String, age:Int, height:Double)
let me : PersonTuple =  ("김태훈",100,187.0)

//배열
//배열 타입은 Array키워드와 타입 이름 조합으로 사용한다.
//빈 배열은 생성자 또는 리터럴 문법으로 생성할 수 있다.

var names : Array<String> = ["김태훈","노한솔"]
var names2: [String] = ["김태훈","노한솔"]

var emptyArray : [Any] = [Any]() // Any 데이터타입의 빈 배열 생성
var emptyArray2: [Any] = Array<Any>()
var emptyArray3: [Any] = [] //배열의 타입을 정확히 명시해 준 경우 []를 통해 빈 배열 생성 가능

//배열의 요소는 인덱스를 통해 접근이 가능함
//배열의 사용

print(names[0])
names[0] = ""
names.append("탱구")
names.insert("iOS", at: 1)
print(names)
names.insert(contentsOf: ["1","4"] , at: 4)
print(names)
print(names.firstIndex(of: "탱구"))
print(names.first)
print(names.last)

let firstItem : String = names.removeFirst()
let lastItem : String = names.removeLast()
let indexZeroItem : String = names.remove(at: 0)

print(names)

//딕셔너리
//순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입
//딕셔너리 안에는 키가 하나 혹은 여러개가 있을 수 있지만, 키는 같은 이름을 중복해서 쓸 수 없다.

typealias StringIntDic = [String : Int]
// 비어있는 딕셔너리 민들기
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
var numberForName2:[String:Int] = [String : Int]()
var numberForName3:[String:Int] = [:]
var numberForName4:StringIntDic = StringIntDic()
var numberForName5:StringIntDic = [:]

//초기값을 주기
var numberForName6:[String:Int] = ["태훈":100, "한솔":200, "탱구":300]
print(numberForName6.count)

//딕셔너리 접근

print(numberForName6["태훈"])
print(numberForName6.removeValue(forKey: "탱구"))
print(numberForName6["탱구", default : 0])

//세트
//순서 없이 하나의 묶음으로 저장하는 컬렉션 타입
//요소 안에 중복이 존재하지 않는다. 각 요소가 유일한 값이어야 하는 경우에 사용, 해시 가능한 값이 들어와야 한다.

var namesSet:Set<String> = Set<String>()
var namesSet2:Set<String> = []

namesSet = ["태훈", "한솔", "탱구"]

print(namesSet.count)
print(namesSet.isEmpty)

//세트 사용
namesSet.insert("나무")
namesSet.remove("철수")
//세트는 집합관계를 표현할 때 유용하게 쓰임

let englishClass : Set<String> = ["Noah", "Jacob", "Marcus"]
let koreanClass : Set<String> = ["Chris", "Noah", "chulsoo"]

let intersectSet : Set<String> = englishClass.intersection(koreanClass)
let symmetricDiffSet : Set<String> = englishClass.symmetricDifference(koreanClass)
let unionSet : Set<String> = englishClass.union(koreanClass)
let subtractSet : Set<String> = englishClass.subtracting(koreanClass)

print(unionSet.sorted())

print(englishClass.isDisjoint(with: koreanClass))
print(englishClass.isSubset(of: unionSet))
print(englishClass.isSuperset(of: unionSet))

//random / shuffle
print(unionSet.randomElement())
print(unionSet.shuffled())
print(numberForName6.shuffled())
var str :String = "asdfghjkl"
print(str.shuffled())

//열거형 enum
//연관된 항목들을 묶어서 표현하는 타입, 배열이나 딕셔너리같은 타입과 다르게 정의해준 항목 값 외에는 수정/추가가 불가능
//제한된 선택지를 주고 싶을때, 정해진 값 외에는 입력받고 싶지 않을때, 예상되는 입력값이 한정되어 있을때 like 자판기
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

var highestLevel :School = .univ
highestLevel = .graudate

//원시 값 raw value
//enum의 각 항목은 원시값을 가질 수 있다.

enum School3 : String {
  case primary = "유치원"
  case elementary = "초등학교"
  case middle = "중딩"
  case high = "고딩"
  case college = "대학"
  case univ = "대학교"
  case graudate = "대학원"
}

//원시 값 자동 지정

enum School4 : String {
  case primary = "유치원"
  case elementary = "초등학교"
  case middle = "중딩"
  case high = "고딩"
  case college = "대학"
  case univ
  case graudate
}
let educationStatus1 : School4 = .primary
let educationStatus2 : School4 = .univ
print(educationStatus1.rawValue)
print(educationStatus2.rawValue)

enum Numbers : Int {
  case zero
  case one
  case two
  case ten = 10
}
print(Numbers.one.rawValue)

let num = Numbers(rawValue: 2)
let school = School4(rawValue: "중딩")

//연관 값을 갖는 열거형
enum MainDish{
  case pastar(taste:String)
  case pizza(dough : String, topping : String)
  case chicken(withSause:Bool)
  case rice
}
var dinner : MainDish = MainDish.pizza(dough: "치즈", topping: "베이컨")

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
print(allCases)

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

//열거형의 케이스가 연관 값을 갖는 경우 항목 순회

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
}

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
print(result)

//이진탐색 등 순환알고리즘을 구현할 때 유용하게 쓰인다.
