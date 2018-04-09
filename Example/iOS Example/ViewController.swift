import UIKit
import Sugar

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let word = "String is a string".firstWord {
      print(word)
    }
  }
}
