import Foundation

protocol Themeable {
    var themeKey: String? { get set }
    var themeDict: NSDictionary? { get set }
}
