import UIKit

public extension UIApplication {
  
  public static func topViewController() -> UIViewController? {
    if var topController = UIApplication.shared.keyWindow?.rootViewController {
      while let presentedViewController = topController.presentedViewController {
        topController = presentedViewController
      }
      
      return topController
    }
    return nil
  }
}
