import Foundation

public extension String {
  
  public var firstWord: String? {
    return self.components(separatedBy: " ").first
  }
  
  public var lastWord: String? {
    return self.components(separatedBy: " ").last
  }
  
  public func substring(from: Int, to: Int) -> String {
    let start = self.index(self.startIndex, offsetBy: from)
    let end = self.index(self.endIndex, offsetBy: to)
    let range = start..<end
    
    return self.substring(with: range)
  }
  
  public static func randomHexString(ofLength length: Int) -> String {
    let letters: NSString = "abcdef012345678"
    return randomString(fromLetters: letters, ofLength: length)
  }
  
  public static func randomString(ofLength length: Int) -> String {
    let letters: NSString = "abcdefghijklmnoABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return randomString(fromLetters: letters, ofLength: length)
  }
  
  public static func randomString(fromLetters letters: NSString, ofLength length: Int) -> String {
    
    let len = UInt32(letters.length)
    
    var randomString = ""
    
    for _ in 0 ..< length {
      let rand = arc4random_uniform(len)
      var nextChar = letters.character(at: Int(rand))
      randomString += NSString(characters: &nextChar, length: 1) as String
    }
    
    return randomString
  }
}
