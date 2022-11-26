//
//  AppHereTextFieldThemeModel.swift
//
//
//  Created by Muhammed Sevük on 10.02.2022.
//

import Foundation

struct AppHereTextFieldThemeModel {
    static var defaultTextColor: String = "#FFFFFF"
    static var defaultBackgroundColor: String = "#00000000"
    static var defaultTintColor: String = "#000000"

    var key: String
    var backgroundColor: String
    var textColor: String
    var fontName: String?
    var fontSize: Float?
    var minimumFontSize: Float?
    var tintColor: String

    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereTextFieldThemeModel.defaultTextColor
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereTextFieldThemeModel.defaultBackgroundColor
        fontName = themeDict.value(forKey: "fontName") as? String
        fontSize = themeDict.value(forKey: "fontSize") as? Float
        minimumFontSize = themeDict.value(forKey: "minimumFontSize") as? Float
        tintColor = themeDict.value(forKey: "tintColor") as? String ?? AppHereTextFieldThemeModel.defaultTintColor
    }
}
