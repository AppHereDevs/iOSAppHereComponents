//
//  File.swift
//  
//
//  Created by Arda Onat on 11.02.2022.
//

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
        
        key = themeDict.value(forKey: "key") as! String
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereInputViewThemeModel.defaultBackgroundColor
        cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
        informationLabelThemeKey = themeDict.value(forKey: "informationLabelThemeKey") as? String
        checkBoxButtonThemeKey = themeDict.value(forKey: "checkBoxButtonThemeKey") as? String
        verticalInset = themeDict.value(forKey: "verticalInset") as? Float
        horizontalInset = themeDict.value(forKey: "horizontalInset") as? Float
        stackViewSpacing = themeDict.value(forKey: "stackViewSpacing") as? Float
    }
}
