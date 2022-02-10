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
    static var defaultTintColor: String = "#FFFFFF"
    
    var key: String
    var backgroundColor: String
    var textColor: String
    var fontName: String?
    var fontSize: Float?
    var minimumFontSize: Float?
    var tintColor: String
    
    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereTextFieldThemeModel.defaultTextColor
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereTextFieldThemeModel.defaultBackgroundColor
        self.fontName = themeDict.value(forKey: "fontName") as? String
        self.fontSize = themeDict.value(forKey: "fontSize") as? Float
        self.minimumFontSize = themeDict.value(forKey: "minimumFontSize") as? Float
        self.tintColor = themeDict.value(forKey: "tintColor") as? String ?? AppHereTextFieldThemeModel.defaultTintColor
        
    }
}
