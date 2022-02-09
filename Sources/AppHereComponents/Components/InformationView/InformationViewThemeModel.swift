//
//  InformationViewThemeModel.swift
//  
//
//  Created by Arda Onat on 8.02.2022.
//

import UIKit
import Foundation

public class InformationViewThemeModel {
    var key: String
    var backgroundColor: String?
    var firstLabelThemeKey: String?
    var secondLabelThemeKey: String?
    var maxLineWidth: Double?
    
    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        backgroundColor = themeDict.value(forKey: "backgroundColor") as? String
        firstLabelThemeKey = themeDict.value(forKey: "firstLabelThemeKey") as? String
        secondLabelThemeKey = themeDict.value(forKey: "secondLabelThemeKey") as? String
    }
}
