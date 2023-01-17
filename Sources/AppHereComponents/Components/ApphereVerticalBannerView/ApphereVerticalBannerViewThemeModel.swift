import Foundation
import UIKit

public class ApphereVerticalBannerViewThemeModel {
    var key: String
    var bannerViewBackgroundColor: String?
    var titleLabelThemeKey: String?
    var cornerRadius: Float?

    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.bannerViewBackgroundColor = themeDict.value(forKey: "bannerViewBackgroundColor") as? String
        self.titleLabelThemeKey = themeDict.value(forKey: "titleLabelThemeKey") as? String
        self.cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
    }
}
