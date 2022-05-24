//
//  ApphereVerticalBannerViewThemeModel.swift
//  
//
//  Created by Muhammed Sevük on 24.05.2022.
//

import UIKit
import Foundation

public class ApphereVerticalBannerViewThemeModel {
    var key: String
    var bannerViewBackgroundColor: String?
    var titleLabelThemeKey: String?
    var cornerRadius: Float?
    
    public init(with themeDict: NSDictionary) throws {
        key = themeDict.value(forKey: "key") as! String
        bannerViewBackgroundColor = themeDict.value(forKey: "bannerViewBackgroundColor") as? String
        titleLabelThemeKey = themeDict.value(forKey: "titleLabelThemeKey") as? String
        cornerRadius = themeDict.value(forKey: "cornerRadius") as? Float
    }
}

