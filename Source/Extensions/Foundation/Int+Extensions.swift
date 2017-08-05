import Foundation

public extension Int {
  
  //TODO: rename this
  public var paddedString: String {
    return self < 10 ? "0\(self)" : "\(self)"
  }
}
