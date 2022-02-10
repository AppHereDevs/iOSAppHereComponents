//
//  AppHereTextView.swift
//
//
//  Created by Muhammed Sevük on 8.02.2022.
//

import Foundation
import UIKit

public class AppHereTextView: UITextView, Themeable {

    public var placeHolderText: String?{
        didSet {
            self.text = placeHolderText
        }
    }
    public var themeDict: NSDictionary?
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        initComponent()
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponent()
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
        guard let themeDict = themeDict, let viewTheme = try? AppHereTextViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        textColor = UIColor(hexString: viewTheme.placeHolderTextColor)
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        font = AppHereThemeManager.shared.getFont(fontName: viewTheme.fontName, fontSize: viewTheme.fontSize)
        
        //TODO: Should add Text Alignment
        /*
        if let textAlignment = theme.textAlignment {
            self.textAlignment = textAlignment
        }
        */
    }
    
    private func initComponent() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textViewDidBeginEditing(_:)),
                                               name: UITextView.textDidBeginEditingNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidEndEditing(_:)),
                                               name: UITextView.textDidEndEditingNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(textViewDidChange(_:)),
                                               name: UITextView.textDidChangeNotification,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func textViewDidBeginEditing(_ notification: NSNotification) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereTextViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        if textColor == UIColor.init(hexString: viewTheme.placeHolderTextColor) {
            text = ""
            textColor = UIColor.init(hexString: viewTheme.textColor)
        }
    }
    
    @objc private func textViewDidEndEditing(_ notification: NSNotification) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereTextViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        if text?.isEmpty ?? true {
            text = placeHolderText
            textColor = UIColor.init(hexString: viewTheme.placeHolderTextColor)
        }
    }
    
//    @objc private func textViewDidChange(_ textView: UITextView) {
//        guard let themeDict = themeDict, let viewTheme = try? AppHereTextViewThemeModel(with: themeDict) else {
//            self.isHidden = true
//            return
//        }
//
//        if text?.isEmpty ?? true {
//            text = placeHolderText
//            textColor = UIColor.init(hexString: viewTheme.placeHolderTextColor)
//        }
//    }
}
