//
//  AppHereLabel.swift
//
//
//  Created by Arda Onat on 19.12.2021.
//

import UIKit

public class AppHereLabel: UILabel, Themeable {
    
    public var themeDict: NSDictionary?
    
    private var seconds: Int = 0
    
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
        font = AppHereThemeManager.shared.getFont(fontName: viewTheme.fontName, fontSize: viewTheme.fontSize)
        
        if let cornerRadius = viewTheme.cornerRadius {
            layer.cornerRadius = cornerRadius.CGFloatValue
            layer.masksToBounds = true
        }
        
    }
    
    public func startTimer(seconds: Int) {
        self.seconds = seconds
        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimerText), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        seconds -= 1
        self.text = seconds.timerString
    }
}

extension Int {
    var timerString: String {
        let minutes = self / 60 % 60
        let seconds = self % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
