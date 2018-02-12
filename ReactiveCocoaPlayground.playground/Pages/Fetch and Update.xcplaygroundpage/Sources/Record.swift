import Foundation

public struct Record {
  public let id: Int
  public let name: String
}

extension Record: CustomDebugStringConvertible {
  public var debugDescription: String {
    return name
  }
}
