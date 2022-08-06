//
//  AppHereInputView.swift
//
//
//  Created by Muhammed Sevük on 10.02.2022.
//

import CoreModule
import UIKit
import Validator

public final class AppHereInputView: AppHereComponentView {
    @IBOutlet private var trailingConstraint: NSLayoutConstraint!
    @IBOutlet private var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private var topConstraint: NSLayoutConstraint!
    @IBOutlet private var leadingConstraint: NSLayoutConstraint!
    @IBOutlet private var titleLabel: AppHereLabel!
    @IBOutlet private var phoneLabel: AppHereLabel!
    @IBOutlet public var inputTextField: AppHereTextField!
    @IBOutlet private var errorLabel: AppHereLabel!
    @IBOutlet private var phoneLabelView: UIView!

    private var isValid: Bool = false

    public var viewModel: AppHereInputViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }

    private func setupView(with viewModel: AppHereInputViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereInputViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        // MARK: Setup view's appearance with viewTheme

        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)

        if let cornerRadius = viewTheme.cornerRadius {
            layer.cornerRadius = cornerRadius.CGFloatValue
            layer.masksToBounds = true
        }

        // MARK: Setup view insets

        trailingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        bottomConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        topConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        leadingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        titleLabel.themeKey = viewTheme.titleLabelThemeKey
        inputTextField.themeKey = viewTheme.inputTextFieldThemeKey
        phoneLabel.themeKey = viewTheme.phoneLabelThemeKey

        if let errorLabelThemeKey = viewTheme.errorLabelThemeKey {
            errorLabel.themeKey = errorLabelThemeKey
        } else {
            errorLabel.isHidden = true
        }

        errorLabel.themeKey = viewTheme.errorLabelThemeKey
        inputTextField.delegate = self

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
            phoneLabelView.isHidden = true
        }
        inputTextField.placeholder = viewModel.placeholder

        if let patternType = viewModel.validationModel?.patternType {
            setValidationRuleSet(patternType)
        } else {
            inputTextField.regexPattern = viewModel.regex
        }

        inputTextField.keyboardType = viewModel.keyboardType

        if let righImage = viewModel.textFieldRightImageName {
            let rightImageView = UIImageView()
            rightImageView.image = UIImage(named: righImage)

            let rightView = UIView()
            rightView.addSubview(rightImageView)

            rightView.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
            rightImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            inputTextField.rightViewMode = UITextField.ViewMode.always
            inputTextField.rightView = rightView
        }
    }

    public func setValidationRuleSet(_ patternType: PatternType) {
        var validationRules = ValidationRuleSet<String>()
        validationRules.add(rule: patternType.rulePattern)
        inputTextField.validationRules = validationRules
        inputTextField.regexPattern = patternType.regex
    }
}

extension AppHereInputView: UITextFieldDelegate {
    @objc
    public func textFieldDidChangeSelection(_: UITextField) {
        isValid = false

        guard let inputText: String = inputTextField.text, !inputText.isEmpty else {
            return
        }

        checkValidation()
    }

    @objc
    public func checkValidation() {
        guard let viewModel = viewModel else {
            return
        }

        if (viewModel.validationModel?.regexPattern?.count) == inputTextField.text?.count, inputTextField.validate() == .valid {
            isValid = true
        }
    }

    public func textFieldShouldReturn(_: UITextField) -> Bool {
        inputTextField.endEditing(false)
        return true
    }

    public func textField(_ textField: UITextField, shouldChangeCharactersIn _: NSRange, replacementString string: String) -> Bool {
        guard let viewModel = viewModel, let maxChar = viewModel.validationModel?.maxCharLength else {
            return true
        }

        return (textField.text.valueOrEmpty + string).count <= maxChar
    }
}

extension AppHereInputView: UserInputtable {
    public var isValidInput: Bool {
        guard let inputText = inputTextField.text else { return false }
        return inputText.count > 0
    }

    public func hideError() {
        inputTextField.layer.borderWidth = 0
        errorLabel.text = " "
    }

    public func showError() {
        inputTextField.layer.borderColor = UIColor(hexString: "B84D97").cgColor
        inputTextField.layer.borderWidth = 3.0
        inputTextField.layer.cornerRadius = 5

        guard let errorLabelText = viewModel?.errorLabelText else { return }
        errorLabel.text = errorLabelText
    }
}
