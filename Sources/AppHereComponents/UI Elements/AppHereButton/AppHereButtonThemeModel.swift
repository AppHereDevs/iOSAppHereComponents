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
        self.key = themeDict.value(forKey: "key") as! String
        self.textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereButtonThemeModel.defaultTextColor
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereButtonThemeModel.defaultBackgroundColor
        self.fontName = themeDict.value(forKey: "fontName") as? String
        self.fontSize = themeDict.value(forKey: "fontSize") as? Float
        self.cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
        self.borderWidth = themeDict.value(forKey: "borderWidth") as? Float
    }
}
