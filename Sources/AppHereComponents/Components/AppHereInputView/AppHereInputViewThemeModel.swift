import Foundation

public class AppHereInputViewThemeModel {
    static var defaultBackgroundColor: String = "#00000000"

    var key: String
    var backgroundColor: String
    var cornerRadius: Float?
    var verticalInset: Float?
    var horizontalInset: Float?
    var titleLabelThemeKey: String?
    var phoneLabelThemeKey: String?
    var inputTextFieldThemeKey: String?
    var errorLabelThemeKey: String?

    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereInputViewThemeModel
            .defaultBackgroundColor
        self.cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
        self.verticalInset = themeDict.value(forKey: "verticalInset") as? Float
        self.horizontalInset = themeDict.value(forKey: "horizontalInset") as? Float
        self.titleLabelThemeKey = themeDict.value(forKey: "titleLabelThemeKey") as? String
        self.phoneLabelThemeKey = themeDict.value(forKey: "phoneLabelThemeKey") as? String
        self.inputTextFieldThemeKey = themeDict.value(forKey: "inputTextFieldThemeKey") as? String
        self.errorLabelThemeKey = themeDict.value(forKey: "errorLabelThemeKey") as? String
    }
}
