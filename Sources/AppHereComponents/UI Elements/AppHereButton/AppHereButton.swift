//
//  AppHereButton.swift
//  
//
//  Created by Arda Onat on 10.02.2022.
//

import UIKit

public class AppHereButton: UILabel, Themeable {
    
    public var themeDict: NSDictionary?
    
    public var themeKey: String? {
        didSet {
            guard let themeKey = themeKey, let themeDict = AppHereThemeManager.shared.getTheme(byKey: themeKey) else {
                self.isHidden = true
                return
            }
            self.themeDict = themeDict
            
            configureButtonAppearance()
        }
    }
    
    private func configureButtonAppearance() {
        guard let themeDict = themeDict, let viewTheme = try? AppHereButtonThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }

        textColor = UIColor(hexString: viewTheme.textColor)
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        font = AppHereThemeManager.shared.getFont(fontName: viewTheme.fontName, fontSize: viewTheme.fontSize)
        layer.cornerRadius = viewTheme.cornerRadius.valueOrEmpty.CGFloatValue
        layer.borderWidth = viewTheme.borderWidth.valueOrEmpty.CGFloatValue
    }
}
