import UIKit

public extension UIViewController {
  
  public func isRootViewControllerInNavigationController() -> Bool {
    guard let navigationController = navigationController else { return false }
    return self == navigationController.viewControllers.first
  }
}
