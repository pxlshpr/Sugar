import Foundation

public extension Sequence {
  
  public func groupAsDictionary<GroupingType: Hashable>(by key: (Iterator.Element) -> GroupingType?) -> [GroupingType: [Iterator.Element]] {
    var groups: [GroupingType: [Iterator.Element]] = [:]
    forEach { element in
      //TODO: handle pyramiding somehow, use guard instead
      if let key = key(element) {
        if case nil = groups[key]?.append(element) {
          groups[key] = [element]
        }
      }
    }
    return groups
  }
  
  public func groupAsArray<GroupingType: Hashable>(by key: (Iterator.Element) -> GroupingType) -> [[Iterator.Element]] {
    let dictionary = groupAsDictionary(by: key)
    return dictionary.keys.map { dictionary[$0]! }
  }
}
