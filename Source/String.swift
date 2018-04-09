import Foundation

public extension String {
  
  /**
   A string value that returns the first word of this string, as separated by whitespace. Any leading whitespaces or newlines are ignored.
   */
  public var firstWord: String? {
    return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).components(separatedBy: " ").first
  }

  /**
   A string value that returns the first word of this string, as separated by whitespace. Any leading whitespaces or newlines are ignored.
   */
  public var lastWord: String? {
    return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).components(separatedBy: " ").last
  }
  
  /**
   A Boolean value indicating whether a string only contains hexadecimal characters.
   */
  public var isValidHexadecimal: Bool {
    let chars = CharacterSet(charactersIn: "0123456789ABCDEF").inverted
    guard self.count != 0, self.rangeOfCharacter(from: chars, options: .caseInsensitive, range: nil) == nil else {
      return false
    }
    return true
  }

  public func substring(from: Int, to: Int) -> String {
    let start = self.index(self.startIndex, offsetBy: from)
    let end = self.index(self.endIndex, offsetBy: to)
    let range = start..<end
    
    return String(self[range])
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
