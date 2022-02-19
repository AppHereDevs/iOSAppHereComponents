//
//  AppHereLabel.swift
//
//
//  Created by Arda Onat on 19.12.2021.
//

import UIKit

public class AppHereLabel: UILabel, Themeable {
    
    // MARK: Countdown variable
    private var timer = Timer()
    private var countDownSeconds: Int = 0
    private var timerCompletion: (() -> ())?
    
    public var themeDict: NSDictionary?
    
    @IBInspectable public var themeKey: String? {
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
        
        guard let cornerRadius = viewTheme.cornerRadius else { return }
        
        layer.cornerRadius = cornerRadius.CGFloatValue
        layer.masksToBounds = true
    }
    
    public func startCountdown(from seconds: Int, completion: (() -> ())?) {
        isHidden = false
        text = seconds.timerString
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        self.countDownSeconds = seconds
        self.timerCompletion = completion
    }
    
    @objc func update() {
        self.countDownSeconds -= 1
        self.text = countDownSeconds.timerString
        
        guard self.countDownSeconds == 0 else { return }
        
        timer.invalidate()
        timerCompletion?()
    }
}

extension Int {
    var timerString: String {
        let minutes = self / 60 % 60
        let seconds = self % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
}
