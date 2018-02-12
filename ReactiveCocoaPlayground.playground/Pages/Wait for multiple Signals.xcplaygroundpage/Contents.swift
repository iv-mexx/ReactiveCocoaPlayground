//: [Previous](@previous)
// How to wait until multiple signals have completed
import Foundation
import ReactiveSwift
import ReactiveCocoa
import enum Result.NoError

let (signalA, observerA) = Signal<Int, NoError>.pipe()
let (signalB, observerB) = Signal<Int, NoError>.pipe()

let producerA = SignalProducer(value: 1)
let producerB = SignalProducer(value: 2)

let both = SignalProducer([producerA, producerB]).flatten(.concat)
//let both = SignalProducer([signalA, signalB]).flatten(.concat)
//let both = Signal.merge([signalA, signalB])

//both.observeCompleted {
both.startWithCompleted {
  print("Both have completed")
}

observerA.send(value: 0)
observerB.send(value: 1)
observerA.sendCompleted()
observerB.send(value: 2)
observerB.sendCompleted() //`both` will complete here

var array = [Int]()
for i in [1, 2, 3] {
  array.append(i)
}
array

//: [Next](@next)
