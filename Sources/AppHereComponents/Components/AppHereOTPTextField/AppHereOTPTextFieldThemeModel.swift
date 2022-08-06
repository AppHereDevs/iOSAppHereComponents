//
//  AppHereOTPTextFieldThemeModel.swift
//
//
//  Created by Muhammed Sevük on 17.02.2022.
//

import Foundation
import UIKit

public class AppHereOTPTextFieldThemeModel {
    let defaultBackgroundColor: String = "#F1F1F1"
    let defaultBorderColor: String = "#00000000"
    let defaultTextColor: String = "#000000"
    let defaultCornerRadius: Float = 10
    let defaultBorderWidth: Float = 0
    let defaultFilledBorderWidth: Float = 1
    let defaultFilledBorderColor: String = "#A9A9A9"
    let defaultFilledBackgroundColor: String = "#F1F1F1"

    var key: String
    var backgroundColor: String
    var borderColor: String
    var textColor: String
    var fontName: String?
    var fontSize: Float?
    var cornerRadius: Float
    var borderWidth: Float
    var filledBackgroundColor: String
    var filledBorderColor: String
    var filledBorderWidth: Float

    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? defaultBackgroundColor
        borderColor = themeDict.value(forKey: "borderColor") as? String ?? defaultBorderColor
        textColor = themeDict.value(forKey: "textColor") as? String ?? defaultTextColor
        fontName = themeDict.value(forKey: "fontName") as? String
        fontSize = themeDict.value(forKey: "fontSize") as? Float
        cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float ?? defaultCornerRadius
        borderWidth = themeDict.value(forKey: "borderWidth") as? Float ?? defaultBorderWidth
        filledBackgroundColor = themeDict.value(forKey: "filledBackgroundColor") as? String ?? defaultFilledBackgroundColor
        filledBorderColor = themeDict.value(forKey: "filledBorderColor") as? String ?? defaultBorderColor
        filledBorderWidth = themeDict.value(forKey: "filledBorderWidth") as? Float ?? defaultFilledBorderWidth
    }
}
