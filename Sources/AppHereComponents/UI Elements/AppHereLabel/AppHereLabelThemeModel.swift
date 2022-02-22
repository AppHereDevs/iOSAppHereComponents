//
//  AppHereLabelThemeModel.swift
//
//
//  Created by Arda Onat on 19.12.2021.
//

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
   
    // TODO: Add remaining values
    
    /*
    var numberOfLines: Int?
    var textAlignment: NSTextAlignment*/
    
    // TODO: Research UILabel default values
    
    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereLabelThemeModel.defaultTextColor
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereLabelThemeModel.defaultBackgroundColor
        fontName = themeDict.value(forKey: "fontName") as? String
        fontSize = themeDict.value(forKey: "fontSize") as? Float
        cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
        isUnderlined = themeDict.value(forKey: "isUnderlined") as? Bool ?? false
    }
}
