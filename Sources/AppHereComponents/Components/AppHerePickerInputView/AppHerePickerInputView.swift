//
//  ApphereDropdownInputView.swift
//
//
//  Created by Arda Onat on 15/05/2022.
//

import CoreModule
import UIKit

public final class AppHerePickerInputView: AppHereComponentView {
    @IBOutlet private var titleLabel: AppHereLabel!
    @IBOutlet public var pickerTextField: AppHereTextField!
    @IBOutlet private var errorLabel: AppHereLabel!

    public lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        return pickerView
    }()

    public var viewModel: AppHerePickerInputViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                isHidden = true
                return
            }
            setupView(with: viewModel, pickerDelegate: viewModel.pickerDelegate)
        }
    }

    private func setupView(with viewModel: AppHerePickerInputViewModel, pickerDelegate: PickerManager) {
        guard let themeDict = themeDict, let viewTheme = try? AppHerePickerInputViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        pickerView.delegate = pickerDelegate
        pickerView.dataSource = pickerDelegate

        // MARK: Setup view's appearance with viewTheme

        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)

        if let cornerRadius = viewTheme.cornerRadius {
            layer.cornerRadius = cornerRadius.CGFloatValue
            layer.masksToBounds = true
        }

        if let errorLabelThemeKey = viewTheme.errorLabelThemeKey {
            errorLabel.themeKey = errorLabelThemeKey
        } else {
            errorLabel.isHidden = true
        }
        errorLabel.themeKey = viewTheme.errorLabelThemeKey

        // MARK: Setup view insets

        titleLabel.themeKey = viewTheme.titleLabelThemeKey
        pickerTextField.themeKey = viewTheme.inputTextFieldThemeKey
        pickerTextField.textAlignment = viewModel.textAlignment

        // MARK: Setup view values with viewModel

        if let title = viewModel.title {
            titleLabel.text = title
        } else {
            titleLabel.isHidden = true
        }

        pickerTextField.placeholder = viewModel.placeholder
        pickerTextField.inputView = pickerView
    }
}

extension AppHerePickerInputView: UIPickerViewDataSource {
    public func numberOfComponents(in _: UIPickerView) -> Int {
        1
    }

    public func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        guard let pickerData = viewModel?.pickerData else { return 0 }
        return pickerData.count
    }
}

extension AppHerePickerInputView: UserInputtable {
    public var isValidInput: Bool {
        guard let inputText = pickerTextField.text else { return false }
        return inputText.count > 0
    }

    public func showError() {
        pickerTextField.layer.borderColor = UIColor(hexString: "B84D97").cgColor
        pickerTextField.layer.borderWidth = 3.0
        pickerTextField.layer.cornerRadius = 5

        guard let errorLabelText = viewModel?.errorLabelText else { return }
        errorLabel.text = errorLabelText
    }

    public func hideError() {
        pickerTextField.layer.borderWidth = 0
        errorLabel.text = " "
    }
}
