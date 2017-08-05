import UIKit

public extension UIView {
  
  public class var identifier: String {
    return String(describing: self)
  }
}

//MARK: - Borders
public extension UIView {
  
  public func addBorder(side: UIRectEdge, thickness: CGFloat, color: UIColor) {
    let border = borderLayer(side: side, thickness: thickness, color: color)
    self.layer.addSublayer(border)
  }
  
  public func borderFrame(side: UIRectEdge, thickness: CGFloat, color: UIColor) -> CGRect {
    let borderFrame: CGRect
    let h = frame.size.height
    let w = frame.size.width
    switch (side) {
    case UIRectEdge.top:
      borderFrame = CGRect(x: 0, y: 0, width: w, height: thickness)
    case UIRectEdge.bottom:
      borderFrame = CGRect(x: 0, y: h - thickness, width: w, height: thickness)
    case UIRectEdge.right:
      borderFrame = CGRect(x: w - thickness, y: 0, width: thickness, height: h)
    default: //UIRectEdge.left
      borderFrame = CGRect(x: 0, y: 0, width: thickness, height: h)
    }
    return borderFrame
  }
  
  public func borderLayer(side: UIRectEdge, thickness: CGFloat, color: UIColor) -> CALayer {
    let border = CALayer()
    border.frame = borderFrame(side: side, thickness: thickness, color: color)
    border.backgroundColor = color.cgColor
    return border
  }
  
  public func addBorders(lightSides: [UIRectEdge]?) {
    let allSides: [UIRectEdge] = [.top, .left, .bottom, .right]
    for side in allSides {
      let light: Bool
      if lightSides == nil {
        light = false
      } else {
        light = lightSides!.contains(side)
      }
      let thickness: CGFloat =  light ? 0.5 : 1.0
      let color: UIColor = light ? .lightGray : .black
      addBorder(side: side, thickness: thickness, color: color)
    }
  }
  
  public func addBorders(sidesToExclude: [UIRectEdge]?) {
    let allSides: [UIRectEdge] = [.top, .left, .bottom, .right]
    for side in allSides {
      if let sidesToExclude = sidesToExclude, !sidesToExclude.contains(side) {
        addBorder(side: side, thickness: 1.0, color: .black)
      }
    }
  }
}

//MARK: - Miscellaneous
public extension UIView {
  
  //TODO: what does this actually do?
  public func colorStatusBar(withColor color: UIColor) {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let frame = CGRect(x: 0, y: 0,
                       width: width > height ? width : height,
                       height: UIApplication.shared.statusBarFrame.size.height)
    let colorView = UIView(frame: frame)
    
    colorView.backgroundColor = color
    self.addSubview(colorView)
  }
}
