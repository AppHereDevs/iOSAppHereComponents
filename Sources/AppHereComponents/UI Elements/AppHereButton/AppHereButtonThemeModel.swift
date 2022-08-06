//
//  AppHereButtonThemeModel.swift
//
//
//  Created by Arda Onat on 10.02.2022.
//

import Foundation

public struct AppHereButtonThemeModel {
    static var defaultTextColor: String = "#FFFFFFF"
    static var defaultBackgroundColor: String = "#000000"

    var key: String
    var textColor: String
    var backgroundColor: String
    var fontName: String?
    var fontSize: Float?
    var cornerRadius: Float?
    var borderWidth: Float?

    // TODO: Research UIButton default values

    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereButtonThemeModel.defaultTextColor
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereButtonThemeModel.defaultBackgroundColor
        fontName = themeDict.value(forKey: "fontName") as? String
        fontSize = themeDict.value(forKey: "fontSize") as? Float
        cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
        borderWidth = themeDict.value(forKey: "borderWidth") as? Float
    }
}
