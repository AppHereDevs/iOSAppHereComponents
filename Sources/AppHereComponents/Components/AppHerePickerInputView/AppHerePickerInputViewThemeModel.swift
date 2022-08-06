//
//  AppHerePickerInputViewThemeModel.swift
//
//
//  Created by Arda Onat on 15/05/2022.
//

import Foundation

public class AppHerePickerInputViewThemeModel {
    static var defaultBackgroundColor: String = "#00000000"

    var key: String
    var backgroundColor: String
    var cornerRadius: Float?
    var verticalInset: Float?
    var horizontalInset: Float?
    var titleLabelThemeKey: String?
    var inputTextFieldThemeKey: String?
    var errorLabelThemeKey: String?

    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereInputViewThemeModel.defaultBackgroundColor
        cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
        verticalInset = themeDict.value(forKey: "verticalInset") as? Float
        horizontalInset = themeDict.value(forKey: "horizontalInset") as? Float
        titleLabelThemeKey = themeDict.value(forKey: "titleLabelThemeKey") as? String
        inputTextFieldThemeKey = themeDict.value(forKey: "inputTextFieldThemeKey") as? String
        errorLabelThemeKey = themeDict.value(forKey: "errorLabelThemeKey") as? String
    }
}
