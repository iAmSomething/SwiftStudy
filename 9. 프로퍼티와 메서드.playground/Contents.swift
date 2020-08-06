import UIKit

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

class Position {
  var point : CoordinatePoint
  let name : String
  init (name : String, currentPoint : CoordinatePoint){
    self.name = name
    self.point = currentPoint
  }
}
let myPosition : Position = Position(name: "김태훈", currentPoint: myPoint)

class Position2{
  var point : CoordinatePoint?
  let name :String
  init (name : String){
    self.name = name
  }
}

let myPosition2 : Position2 = Position2(name: "김태훈")
myPosition2.point = CoordinatePoint(x: 4, y: 3)




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
var myPoint2 : CoordinatePoint2 = CoordinatePoint2(x: 10, y: 20)
print(myPoint2)
print(myPoint2.oppsitePoint)
myPoint2.oppsitePoint = CoordinatePoint(x: 15, y: 10)
print(myPoint2)
