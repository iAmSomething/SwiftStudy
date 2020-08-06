import UIKit
struct BasicInformation {
  var name:String
  var age:Int
}

var myInfo : BasicInformation = BasicInformation(name: "김태훈", age: 25)
myInfo.name = "나무"
myInfo.age = 26

var friendInfo : BasicInformation = myInfo

print(friendInfo.name)
print(myInfo.name)

friendInfo.name = "탱구"

print(friendInfo.name)
print(myInfo.name)

class Person {
  var height : Float = 0.0
  var weight : Float = 0.0
}

var me : Person = Person()
var friend : Person = me
var anotherFriend : Person = Person()
print(me.height)
print(friend.height)

friend.height = 100

print(me.height)
print(friend.height)

func changeBasicInfo(_ info : BasicInformation) {
  var copiedInfo : BasicInformation = info
  copiedInfo.age = 1
}
func changePersonInfo(_ info : Person) {
  info.height = 200
}

changeBasicInfo(myInfo)
print(myInfo.age)

changePersonInfo(me)
print(me.height)

print(me === friend)
print(me === anotherFriend)
