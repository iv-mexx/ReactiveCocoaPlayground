import Foundation
import ReactiveSwift
import ReactiveCocoa
import enum Result.NoError

// API-Stubs
// In a real project, you would implement these methods with the actual logic to fetch, update, ...

// Fetches IDs for all Records that should be updated
public func fetchRecords() -> SignalProducer<[Int], NoError> {
  print("Fetching records")
  return SignalProducer(value: [1, 4, 6, 11])
}

// Fetches Details for a record with the given ID (e.g. from an API)
public func detailsFor(recordId: Int) -> SignalProducer<Record, NoError> {
  print("Getting details for record \(recordId)")
  return SignalProducer(value: Record(id: recordId, name: "Record \(recordId)"))
}

// Updates a number of records at once (e.g in the local database)
public func update(records: [Record]) -> SignalProducer<Void, NoError> {
  print("Updating records \(records)")
  return SignalProducer.empty
}
