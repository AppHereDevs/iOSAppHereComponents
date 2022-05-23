//
//  ApphereDropdownInputView.swift
//  
//
//  Created by Arda Onat on 15/05/2022.
//

import UIKit
import CoreModule

public final class AppHerePickerInputView: AppHereComponentView {

    @IBOutlet private weak var titleLabel: AppHereLabel!
    @IBOutlet public weak var pickerTextField: AppHereTextField!
    
    private lazy var pickerView: UIPickerView = {
      let pickerView = UIPickerView()
      pickerView.dataSource = self
      return pickerView
    }()
    
    public var viewModel: AppHerePickerInputViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                self.isHidden = true
                return
            }
            setupView(with: viewModel, pickerDelegate: viewModel.pickerDelegate)
        }
    }
    
    private func setupView(with viewModel: AppHerePickerInputViewModel, pickerDelegate: UIPickerViewDelegate) {
        guard let themeDict = themeDict, let viewTheme = try? AppHerePickerInputViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        pickerView.delegate = pickerDelegate
        
        // MARK: Setup view's appearance with viewTheme
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        
        if let cornerRadius = viewTheme.cornerRadius {
            layer.cornerRadius = cornerRadius.CGFloatValue
            layer.masksToBounds = true
        }
        
        // MARK: Setup view insets
        //trailingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        //bottomConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        //topConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        //leadingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
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
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let pickerData = viewModel?.pickerData else { return 0 }
        return pickerData.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let pickerData = viewModel?.pickerData, let title = pickerData[safe: row] as? String else { return "" }
        return title
    }
}
