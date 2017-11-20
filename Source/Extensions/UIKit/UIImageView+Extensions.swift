import UIKit

public extension UIImageView {
  
  public func addAspectRatioHeightConstraint() {
    guard let image = self.image else { return }
    self.addConstraint(NSLayoutConstraint(item: self,
                                          attribute: .height,
                                          relatedBy: .equal,
                                          toItem: self,
                                          attribute: .width,
                                          multiplier: image.size.height/image.size.width,
                                          constant: 0))
  }
  
  public func addAspectRatioWidthConstraint() {
    guard let image = self.image else { return }
    self.addConstraint(NSLayoutConstraint(item: self,
                                          attribute: .width,
                                          relatedBy: .equal,
                                          toItem: self,
                                          attribute: .height,
                                          multiplier: image.size.width/image.size.height,
                                          constant: 0))
  }
}
