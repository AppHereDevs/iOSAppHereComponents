//
//  QuickLinksView.swift
//  ooAutos
//
//  Created by Arda Onat on 18.12.2021.
//

import UIKit

public final class QuickLinksView: AppHereComponentView {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: AppHereLabel!
    @IBOutlet private weak var textView: AppHereTextView!
    @IBOutlet private weak var textField: AppHereTextField!
    @IBOutlet private weak var otpTextField: AppHereOTPTextField!
    
    public var viewModel: QuickLinksViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                self.isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }
    
    private func setupView(with viewModel: QuickLinksViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? QuickLinksViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        // MARK: Setup view's appearance with viewTheme
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor!)
        titleLabel.themeKey = viewTheme.labelThemeKey
        textView.themeKey = viewTheme.textViewThemeKey
        
        // MARK: Setup view values with viewModel
        titleLabel.text = viewModel.title
        textView.placeHolderText = "placeHolder"
        textView.resignFirstResponder()
        textField.placeholder = "Telefon Numaranızı Giriniz.."
        textField.regexPattern = "LL LLL L"
        textField.keyboardType = .default
        otpTextField.themeKey = viewTheme.otpTextFieldThemeKey
        otpTextField.configure(with: 4)
    }
}
