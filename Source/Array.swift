import Foundation

//MARK: - NIH
//source: http://stackoverflow.com/questions/29588158/check-if-all-elements-of-an-array-have-the-same-value-in-swift
public extension Array where Element: Equatable {
  
  public var areAllEqual: Bool {
    if let firstElement = first {
      return !dropFirst().contains { $0 != firstElement }
    }
    return true
  }
}
//MARK: ***
