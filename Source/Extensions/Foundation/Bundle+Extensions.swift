import Foundation

public extension Bundle {
  public var versionNumber: String? {
    return infoDictionary?["CFBundleShortVersionString"] as? String
  }
  public var buildNumber: String? {
    return infoDictionary?["CFBundleVersion"] as? String
  }
}
