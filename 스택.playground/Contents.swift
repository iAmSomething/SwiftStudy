import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
  var truck_queue = Queue<Int>()
  truck_queue.appendAll(truck_weights)
  var bridgeQueue = Queue<Int>()
  var bridgeWeight = 0
  var count = 0
  var truckDic = [Int]()
  while !(truck_queue.isEmpty && bridgeQueue.isEmpty) {
    if !bridgeQueue.isEmpty {
      if truckDic.first == bridge_length {
        let amount = bridgeQueue.dequeue()
        bridgeWeight -= amount!
        truckDic.removeFirst()
      }
    }
    if !truck_queue.isEmpty{
      if bridgeWeight + truck_queue.first()! <= weight {
        let truck = truck_queue.dequeue()!
        truckDic.append(0)
        bridgeWeight += truck
        bridgeQueue.enqueue(truck) // 다리로옮기기
      }
    }
    

    for i in 0..<truckDic.count {
      truckDic[i] += 1
    }
    print(bridgeQueue)
    count += 1
  }
  return count
}

solution(100, 100, [10,10,10,10,10,10,10,10,10,10]  )
struct Queue<T> {
  private var elements = [T]()
  var isEmpty : Bool {
    return elements.isEmpty
  }
  mutating func dequeue() -> T? {
    return elements.removeFirst() ?? nil
  }
  mutating func enqueue(_ value : T) {
    elements.append(value)
  }
  mutating func appendAll(_ array : [T]) {
    elements = array
  }
  func first () -> T?{
    return elements.first
  }
}
