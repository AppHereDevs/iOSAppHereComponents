//
//  File.swift
//
//
//  Created by Muhammed Sevük on 8.02.2022.
//

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
//    var textAlignment: NSTextAlignment?

    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereTextViewThemeModel.defaultTextColor
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereTextViewThemeModel.defaultBackgroundColor
        placeHolderTextColor = themeDict.value(forKey: "placeHolderTextColor") as? String ?? AppHereTextViewThemeModel.defaultPlaceHolderTextColor
        fontName = themeDict.value(forKey: "fontName") as? String
        fontSize = themeDict.value(forKey: "fontSize") as? Float
    }
}
