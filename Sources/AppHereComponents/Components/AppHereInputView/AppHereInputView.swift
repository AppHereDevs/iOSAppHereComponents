//
//  AppHereInputView.swift
//  
//
//  Created by Muhammed Sevük on 10.02.2022.
//

import UIKit

public final class AppHereInputView: AppHereComponentView {
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: AppHereLabel!
    @IBOutlet weak var phoneLabel: AppHereLabel!
    @IBOutlet weak var inputTextField: AppHereTextField!
    
    public var viewModel: AppHereInputViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                self.isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }
    
    private func setupView(with viewModel: AppHereInputViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereInputViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        // MARK: Setup view's appearance with viewTheme
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        
        if let cornerRadius = viewTheme.cornerRadius {
            layer.cornerRadius = cornerRadius.CGFloatValue
            layer.masksToBounds = true
        }
        
        // MARK: Setup view insets
        trailingConstraint.constant = viewTheme.inset.valueOrEmpty.CGFloatValue
        bottomConstraint.constant = viewTheme.inset.valueOrEmpty.CGFloatValue
        topConstraint.constant = viewTheme.inset.valueOrEmpty.CGFloatValue
        leadingConstraint.constant = viewTheme.inset.valueOrEmpty.CGFloatValue
        titleLabel.themeKey = viewTheme.titleLabelThemeKey
        inputTextField.themeKey = viewTheme.inputTextFieldThemeKey
        phoneLabel.themeKey = viewTheme.phoneLabelThemeKey
        
        // MARK: Setup view values with viewModel
        if let title = viewModel.title {
            titleLabel.text = title
        } else {
            titleLabel.isHidden = true
        }
        
        if let phoneText = viewModel.phoneLabelText {
            phoneLabel.text = phoneText
        } else {
            phoneLabel.isHidden = true
        }
        
        inputTextField.placeholder = viewModel.placeholder
        inputTextField.regexPattern = viewModel.regex
        inputTextField.keyboardType = viewModel.keyboardType
    }
}
