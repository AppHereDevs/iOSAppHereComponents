import Foundation

public struct AppHereTextViewThemeModel {
    static var defaultTextColor: String = "#FFFFF"
    static var defaultBackgroundColor: String = "#00000"
    static var defaultPlaceHolderTextColor: String = "C7C7CD"

    var key: String
    var textColor: String
    var backgroundColor: String
    var placeHolderTextColor: String
    var fontName: String?
    var fontSize: Float?

    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereTextViewThemeModel.defaultTextColor
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereTextViewThemeModel
            .defaultBackgroundColor
        self.placeHolderTextColor = themeDict
            .value(forKey: "placeHolderTextColor") as? String ?? AppHereTextViewThemeModel.defaultPlaceHolderTextColor
        self.fontName = themeDict.value(forKey: "fontName") as? String
        self.fontSize = themeDict.value(forKey: "fontSize") as? Float
    }
}
