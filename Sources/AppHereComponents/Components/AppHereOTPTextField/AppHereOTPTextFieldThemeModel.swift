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
        self.key = themeDict.value(forKey: "key") as! String
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? defaultBackgroundColor
        self.borderColor = themeDict.value(forKey: "borderColor") as? String ?? defaultBorderColor
        self.textColor = themeDict.value(forKey: "textColor") as? String ?? defaultTextColor
        self.fontName = themeDict.value(forKey: "fontName") as? String
        self.fontSize = themeDict.value(forKey: "fontSize") as? Float
        self.cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float ?? defaultCornerRadius
        self.borderWidth = themeDict.value(forKey: "borderWidth") as? Float ?? defaultBorderWidth
        self.filledBackgroundColor = themeDict.value(forKey: "filledBackgroundColor") as? String ?? defaultFilledBackgroundColor
        self.filledBorderColor = themeDict.value(forKey: "filledBorderColor") as? String ?? defaultBorderColor
        self.filledBorderWidth = themeDict.value(forKey: "filledBorderWidth") as? Float ?? defaultFilledBorderWidth
        
    }
}
