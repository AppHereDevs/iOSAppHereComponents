import Foundation

public struct AppHereLabelThemeModel {
    static var defaultTextColor: String = "#FFFFF"
    static var defaultBackgroundColor: String = "#00000000"

    var key: String
    var textColor: String
    var backgroundColor: String
    var fontName: String?
    var fontSize: Float?
    var cornerRadius: Float?
    var isUnderlined: Bool

    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereLabelThemeModel.defaultTextColor
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereLabelThemeModel
            .defaultBackgroundColor
        self.fontName = themeDict.value(forKey: "fontName") as? String
        self.fontSize = themeDict.value(forKey: "fontSize") as? Float
        self.cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
        self.isUnderlined = themeDict.value(forKey: "isUnderlined") as? Bool ?? false
    }
}
