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
//    var placeHolderTextColor: String
//    var font: String
//    var textAlignment: NSTextAlignment?
    // UIImage
    //
    
    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereTextViewThemeModel.defaultTextColor
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereTextViewThemeModel.defaultBackgroundColor
//        self.placeHolderTextColor = AppHereThemeManager.getColor(colorHex: themeDict.value(forKey: "placeHolderTextColor") ?? AppHereTextViewThemeModel.defaultPlaceHolderTextColor)
    }
}
