//
//  AppHereTextView.swift
//
//
//  Created by Muhammed Sevük on 8.02.2022.
//

import Foundation
import UIKit

public class AppHereTextView: UITextView, Themeable {
//    typealias T =
    public var placeHolderText: String?
    public var themeDict: NSDictionary?
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public var themeKey: String? {
        didSet {
            guard let themeKey = themeKey, let themeDict = AppHereThemeManager.shared.getTheme(byKey: themeKey) else {
                self.isHidden = true
                return
            }
            self.themeDict = themeDict
            
            configureLabelAppearance()
        }
    }
    
    private func configureLabelAppearance() {
        guard let themeDict = themeDict, let viewTheme = try? AppHereLabelThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }

        textColor = UIColor(hexString: viewTheme.textColor)
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
    }
}
