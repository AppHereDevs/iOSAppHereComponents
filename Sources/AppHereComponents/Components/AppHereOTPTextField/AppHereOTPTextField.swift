//
//  AppHereOTPTextField.swift
//  AppHereOTPTextField
//
//  Created by Abdelrhman Eliwa on 10/12/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import CoreModule
import UIKit

public protocol AppHereOTPTextFieldDelegate: AnyObject {
    func didUserFinishEnter(the code: String)
    func showError()
    func hideError()
}

public class AppHereOTPTextField: UITextField, Themeable {
    public var otpDefaultCharacter = ""
    private var otpBackgroundColor: UIColor?
    private var otpFilledBackgroundColor: UIColor?
    private var otpCornerRadius: Float?
    private var otpDefaultBorderColor: UIColor?
    private var otpFilledBorderColor: UIColor?
    private var otpDefaultBorderWidth: Float?
    private var otpFilledBorderWidth: Float?
    private var otpTextColor: UIColor?
    private var otpFontSize: Float?
    private var otpFont: UIFont = UIFont.boldSystemFont(ofSize: 24)
    private var slotCount: Int = 0
    private var implementation = AppHereOTPTextFieldImplementation()
    private var isConfigured = false
    private var digitLabels = [UILabel]()
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()

    public weak var otpDelegate: AppHereOTPTextFieldDelegate?

    override public var text: String? {
        didSet {
            textDidChange()
        }
    }

    public var themeKey: String? {
        didSet {
            guard let themeKey = themeKey, let themeDict = AppHereThemeManager.shared.getTheme(byKey: themeKey) else {
                isHidden = true
                return
            }
            self.themeDict = themeDict

            configureOTPTextFieldAppearance()
        }
    }

    public var themeDict: NSDictionary?

    private func configureOTPTextFieldAppearance() {
        guard let themeDict = themeDict, let viewTheme = try? AppHereOTPTextFieldThemeModel(with: themeDict) else {
            isHidden = true
            return
        }
        otpBackgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        otpFilledBackgroundColor = UIColor(hexString: viewTheme.filledBackgroundColor)
        otpCornerRadius = viewTheme.cornerRadius
        otpDefaultBorderColor = UIColor(hexString: viewTheme.borderColor)
        otpFilledBorderColor = UIColor(hexString: viewTheme.filledBorderColor)
        otpDefaultBorderWidth = viewTheme.borderWidth
        otpFilledBorderWidth = viewTheme.filledBorderWidth
        otpTextColor = UIColor(hexString: viewTheme.textColor)
        otpFontSize = viewTheme.fontSize
        otpFont = AppHereThemeManager.shared.getFont(fontName: viewTheme.fontName, fontSize: viewTheme.fontSize)
    }

    public func configure(with slotCount: Int = 4) {
        guard isConfigured == false else { return }
        isConfigured.toggle()
        self.slotCount = slotCount
        configureTextField()

        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        addGestureRecognizer(tapRecognizer)
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        if #available(iOS 12.0, *) {
            textContentType = .oneTimeCode
        } else {
            // Fallback on earlier versions
        }
        borderStyle = .none
        addTarget(self, action: #selector(textDidChange), for: .allEditingEvents)
        addTarget(self, action: #selector(textDidChange), for: .valueChanged)
        delegate = implementation
        implementation.implementationDelegate = self
    }

    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        for _ in 1 ... count {
            let label = createLabel()
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
        }
        return stackView
    }

    private func createLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = otpBackgroundColor
        label.layer.cornerRadius = otpCornerRadius.valueOrEmpty.CGFloatValue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = otpTextColor
        label.font = otpFont
        label.isUserInteractionEnabled = true
        label.layer.masksToBounds = true
        label.text = otpDefaultCharacter
        for label in digitLabels {
            label.layer.borderWidth = otpDefaultBorderWidth.valueOrEmpty.CGFloatValue
            label.layer.borderColor = otpDefaultBorderColor?.cgColor
        }
        return label
    }

    @objc
    private func textDidChange() {
        guard let text = text, text.count <= digitLabels.count else { return }
        for labelIndex in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[labelIndex]
            if labelIndex < text.count {
                let index = text.index(text.startIndex, offsetBy: labelIndex)
                currentLabel.text = String(text[index])
                currentLabel.layer.borderWidth = otpFilledBorderWidth.valueOrEmpty.CGFloatValue
                currentLabel.layer.borderColor = otpFilledBorderColor?.cgColor
                currentLabel.backgroundColor = otpFilledBackgroundColor
            } else {
                currentLabel.text = otpDefaultCharacter
                currentLabel.layer.borderWidth = otpDefaultBorderWidth.valueOrEmpty.CGFloatValue
                currentLabel.layer.borderColor = otpDefaultBorderColor?.cgColor
                currentLabel.backgroundColor = otpBackgroundColor
            }
        }
        if text.count == digitLabels.count {
            otpDelegate?.didUserFinishEnter(the: text)
        }
    }
}

extension AppHereOTPTextField: AppHereOTPTextFieldImplementationProtocol {
    func digitalLabelsCount() -> Int {
        digitLabels.count
    }
}

extension AppHereOTPTextField: UserInputtable {
    public var isValidInput: Bool {
        guard let text = text else { return false }
        return text.count == slotCount
    }

    public func showError() {
        otpDelegate?.showError()
    }

    public func hideError() {
        otpDelegate?.hideError()
    }
}
