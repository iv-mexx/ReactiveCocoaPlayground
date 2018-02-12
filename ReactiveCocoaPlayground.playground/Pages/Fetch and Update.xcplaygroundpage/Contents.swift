//: [Previous](@previous)
//  For this example, imagine you haven an API to load details for a given record based on its `id`
//  You have a bunch of records (i.e. some record IDs) that you want to update, so you have to
//  request the details for each record from the API and the update them locally in your database

import Foundation
import ReactiveSwift
import ReactiveCocoa
import enum Result.NoError

let processRecords = fetchRecords()
  // Convert from `SignalProcuder<[Int], NoError>` to `SignalProducer<Int, NoError>`
  .flatMap(.latest) { SignalProducer.init($0) }
  // Fetch details for every single record
  .flatMap(.latest, detailsFor(recordId:))
  // Collect all records into a single Value
  // (from `SignalProducer<Record, NoError>` to SignalProducer<[Record], NoError>
  // If there is no batch update and you have to update each record individually, just ommit the `collect()` operator
  .collect()
  // Update all records in a batch update
  .flatMap(.latest, update(records:))

processRecords.start()
//: [Next](@next)
