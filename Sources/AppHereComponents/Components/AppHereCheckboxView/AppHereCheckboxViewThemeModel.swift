import Foundation

public class AppHereCheckboxViewThemeModel {
    static var defaultBackgroundColor: String = "#00000000"

    var key: String
    var backgroundColor: String
    var cornerRadius: Float?
    var informationLabelThemeKey: String?
    var checkBoxButtonThemeKey: String?
    var verticalInset: Float?
    var horizontalInset: Float?
    var stackViewSpacing: Float?

    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereInputViewThemeModel
            .defaultBackgroundColor
        self.cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
        self.informationLabelThemeKey = themeDict.value(forKey: "informationLabelThemeKey") as? String
        self.checkBoxButtonThemeKey = themeDict.value(forKey: "checkBoxButtonThemeKey") as? String
        self.verticalInset = themeDict.value(forKey: "verticalInset") as? Float
        self.horizontalInset = themeDict.value(forKey: "horizontalInset") as? Float
        self.stackViewSpacing = themeDict.value(forKey: "stackViewSpacing") as? Float
    }
}
