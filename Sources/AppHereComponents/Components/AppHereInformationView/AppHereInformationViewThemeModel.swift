//
//  AppHereInformationViewThemeModel.swift
//  
//
//  Created by Arda Onat on 8.02.2022.
//

import UIKit
import Foundation

public class AppHereInformationViewThemeModel {
    var key: String
    var backgroundColor: String?
    var verticalInset: Float?
    var horizontalInset: Float?
    var firstLabelThemeKey: String?
    var secondLabelThemeKey: String?
    
    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String
        verticalInset = themeDict.value(forKey: "verticalInset") as? Float
        horizontalInset = themeDict.value(forKey: "horizontalInset") as? Float
        firstLabelThemeKey = themeDict.value(forKey: "firstLabelThemeKey") as? String
        secondLabelThemeKey = themeDict.value(forKey: "secondLabelThemeKey") as? String
    }
}
