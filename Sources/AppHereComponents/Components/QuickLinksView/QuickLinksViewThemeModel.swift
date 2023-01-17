import Foundation

public class QuickLinksViewThemeModel {
    var key: String
    var backgroundColor: String?
    var labelThemeKey: String?
    var textViewThemeKey: String?
    var textFieldThemeKey: String?
    var otpTextFieldThemeKey: String?

    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String
        self.labelThemeKey = themeDict.value(forKey: "labelThemeKey") as? String
        self.textViewThemeKey = themeDict.value(forKey: "textViewThemeKey") as? String
        self.textFieldThemeKey = themeDict.value(forKey: "textFieldThemeKey") as? String
        self.otpTextFieldThemeKey = themeDict.value(forKey: "otpTextFieldThemeKey") as? String
    }
}
