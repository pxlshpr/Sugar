import UIKit

extension CGFloat {
  
  func roundedToNumberOfDecimalPlaces(_ places: Int) -> CGFloat {
    let roundedString = String(format: "%.\(places)f", self)
    guard let rounded = NumberFormatter().number(from: roundedString) else { return self }
    return CGFloat(rounded.doubleValue)
  }
  
  mutating func roundToNumberOfDecimalPlaces(_ places: Int) {
    self = self.roundedToNumberOfDecimalPlaces(places)
  }
}
