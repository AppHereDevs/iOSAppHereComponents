//
//  AppHereLabelThemeModel.swift
//
//
//  Created by Arda Onat on 19.12.2021.
//

import Foundation
import UIKit

public class AppHereLabelThemeModel {
    static var defaultTextColor: String = "#FFFFF"
    static var defaultBackgroundColor: String = "#00000"
    
    var key: String
    var textColor: String
    var backgroundColor: String
    var font: UIFont
   
    // TODO: Add remaining values
    
    /*var isUnderlined: Bool?
    var numberOfLines: Int?
    var cornerRadius: CGFloat?
    var letterSpacing: Double?
    var layoutMargin: CGFloat
    var textAlignment: NSTextAlignment*/
    
    // TODO: Research UILabel default values
    
    public init(with themeDict: NSDictionary) throws {
        self.key = themeDict.value(forKey: "key") as! String
        self.textColor = themeDict.value(forKey: "textColor") as? String ?? AppHereLabelThemeModel.defaultTextColor
        self.backgroundColor = themeDict.value(forKey: "backgroundColor") as? String ?? AppHereLabelThemeModel.defaultBackgroundColor
        let fontName = themeDict.value(forKey: "fontName") as? String
        let fontSize = themeDict.value(forKey: "fontSize") as? CGFloat
        self.font = UIFont(name: fontName ?? "HelveticaNeue-Regular", size: fontSize ?? 16) ?? UIFont.systemFont(ofSize: 16)
    }
}
