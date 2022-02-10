//
//  AppHereTextField.swift
//  
//
//  Created by Muhammed Sevük on 10.02.2022.
//

import UIKit

public enum RegexPatternKey: Character {
    case number = "N"
    case letter = "L"
    case both = "B"
    
    var pattern: String {
        switch self {
        case .number:
            return "[0-9]"
        case .letter:
            return "[a-zA-Z]"
        case .both:
            return "[a-zA-Z0-9]"
        }
    }
}

struct AppHereTextFieldRegexInputItem {
    var isConstant: Bool = false
    var value: Character?
    var itemIndex: Int?
    var regex: String?
}

public class AppHereTextField: UITextField, Themeable {
    
    public var themeDict: NSDictionary?
    private var patternRegexArray = [AppHereTextFieldRegexInputItem]()
    private var inputText = String()
    
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
    
    public var regexPattern: String? {
        didSet {
            guard let pattern = regexPattern else {
                return
            }
            initPatternArray(pattern: pattern)
            
        }
    }
    
    private func configureLabelAppearance() {
        guard let themeDict = themeDict, let viewTheme = try? AppHereTextFieldThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }

        textColor = UIColor(hexString: viewTheme.textColor)
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        font = AppHereThemeManager.shared.getFont(fontName: viewTheme.fontName, fontSize: viewTheme.fontSize)
        tintColor = UIColor(hexString: viewTheme.tintColor)
        if let minimumFontSize = viewTheme.minimumFontSize {
            self.minimumFontSize = minimumFontSize.CGFloatValue
        }
    }
    
    private func initPatternArray(pattern: String) {
        let patternArray = Array(pattern)
        
        for (index, patternItem) in patternArray.enumerated() {
            patternRegexArray.append(AppHereTextFieldRegexInputItem(isConstant: RegexPatternKey(rawValue: patternItem) == nil ? true : false,
                                                                    value: patternItem,
                                                                    itemIndex: index,
                                                                    regex: RegexPatternKey(rawValue: patternItem)?.pattern))
        }
        self.addTarget(self, action: #selector(self.textFieldDidChange) , for: UIControl.Event.editingChanged)
        self.addTarget(self, action: #selector(self.textFieldDidChange) , for: UIControl.Event.editingDidBegin)
    }
    
    @objc
    func textFieldDidChange() {
        inputText = self.text ?? ""
        let inputTextCharArray = Array(inputText)
        var regexFormatedText = ""
        
        for inputCharItem in inputTextCharArray {
            guard regexFormatedText.count < patternRegexArray.count else {
                setRegexFormattedText(formattedText: regexFormatedText)
                return
            }
            for regexPatternIndex in regexFormatedText.count...patternRegexArray.count - 1 {
                let patternItem = patternRegexArray[regexPatternIndex]
                
                if !patternItem.isConstant {
                    if validate(regex: patternItem.regex!, withText: String(inputCharItem)) {
                        regexFormatedText.append(inputCharItem)
                        break
                    } else {
                        break
                    }
                } else {
                    regexFormatedText.append(patternItem.value!)
                    
                    if inputCharItem == patternItem.value {
                        break
                    }
                }
            }
        }
        setRegexFormattedText(formattedText: regexFormatedText)
    }
    
    private func getRegexPatternPreConstans() -> String {
        var constantPrefix = ""
        for item in patternRegexArray {
            if item.isConstant, let value = item.value {
                constantPrefix += String(value)
            } else {
                break
            }
        }
        return constantPrefix
    }
    
    /// - Parameter formattedText: formatted input text according to given regex pattern
    private func setRegexFormattedText(formattedText: String) {
        var inputText = formattedText
        let formattedTextCharArray = Array(formattedText)
        
        for _ in formattedTextCharArray.reversed() {
            let lastIndex = inputText.count - 1
            if lastIndex < patternRegexArray.count {
                let patternItem = patternRegexArray[lastIndex]
                if patternItem.isConstant {
                    inputText.removeLast()
                }
            } else {
                break
            }
        }
        
        if inputText.isEmpty {
            self.text = getRegexPatternPreConstans()
        } else {
            self.text = inputText
        }
    }
    
    func validate(regex: String, withText text: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
    
}

