import Foundation
import UIKit

public class AppHereInformationViewThemeModel {
    var key: String
    var backgroundColor: String?
    var verticalInset: Float?
    var horizontalInset: Float?
    var firstLabelThemeKey: String?
    var secondLabelThemeKey: String?

    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String
        self.verticalInset = themeDict.value(forKey: "verticalInset") as? Float
        self.horizontalInset = themeDict.value(forKey: "horizontalInset") as? Float
        self.firstLabelThemeKey = themeDict.value(forKey: "firstLabelThemeKey") as? String
        self.secondLabelThemeKey = themeDict.value(forKey: "secondLabelThemeKey") as? String
    }
}
