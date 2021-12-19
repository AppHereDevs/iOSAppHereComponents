//
//  QuickLinkViewThemeModel.swift
//  ooAutos
//
//  Created by Arda Onat on 18.12.2021.
//

import Foundation

class QuickLinksViewThemeModel {
    var key: String
    var backgroundColor: String?
    var labelThemeKey: String?
    
    init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String
        self.labelThemeKey = themeDict.value(forKey: "labelThemeKey") as? String
    }
}
