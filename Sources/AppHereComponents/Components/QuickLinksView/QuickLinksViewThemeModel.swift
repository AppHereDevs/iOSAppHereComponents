//
//  QuickLinkViewThemeModel.swift
//  ooAutos
//
//  Created by Arda Onat on 18.12.2021.
//

import Foundation

public class QuickLinksViewThemeModel {
    var key: String
    var backgroundColor: String?
    var labelThemeKey: String?
    var textViewThemeKey: String?
    var textFieldThemeKey: String?
    var otpTextFieldThemeKey: String?

    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String
        labelThemeKey = themeDict.value(forKey: "labelThemeKey") as? String
        textViewThemeKey = themeDict.value(forKey: "textViewThemeKey") as? String
        textFieldThemeKey = themeDict.value(forKey: "textFieldThemeKey") as? String
        otpTextFieldThemeKey = themeDict.value(forKey: "otpTextFieldThemeKey") as? String
    }
}
