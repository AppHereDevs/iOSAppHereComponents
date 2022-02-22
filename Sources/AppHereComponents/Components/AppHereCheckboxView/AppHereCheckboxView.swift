//
//  AppHereCheckboxView.swift
//  
//
//  Created by Arda Onat on 11.02.2022.
//

import UIKit
import CoreModule

public class AppHereCheckboxView: AppHereComponentView {
    
    @IBOutlet private weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var topConstraint: NSLayoutConstraint!
    @IBOutlet private weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var checkboxButton: AppHereButton!
    @IBOutlet private weak var checkboxImageView: UIImageView!
    @IBOutlet private weak var informationLabel: AppHereLabel!
    @IBOutlet private weak var componentStackView: UIStackView!
    @IBOutlet private weak var firstClickButton: UIButton!
    
    private var isFirstClick: Bool = true
    private var isChecked: Bool = false
    private var checkboxDefaultImageName: String = ""
    private var checkboxSelectedImageName: String = ""
    private var checkboxErrorImageName: String = ""
    
    public var firstClickFunction: (() -> ())?
    
    public var viewModel: AppHereCheckboxViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }
    
    private func setupView(with viewModel: AppHereCheckboxViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereCheckboxViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }
        
        // MARK: Setup view's appearance with viewTheme
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        
        if let cornerRadius = viewTheme.cornerRadius {
            layer.cornerRadius = cornerRadius.CGFloatValue
            layer.masksToBounds = true
        }
        
        // MARK: Setup view's appearance with viewTheme
        checkboxButton.setTitle("", for: .normal)
        firstClickButton.setTitle("", for: .normal)
        trailingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        bottomConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        topConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        leadingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        componentStackView.spacing = viewTheme.stackViewSpacing.valueOrEmpty.CGFloatValue
        informationLabel.themeKey = viewTheme.informationLabelThemeKey
        checkboxButton.themeKey = viewTheme.checkBoxButtonThemeKey
        
        // MARK: Setup view values with viewModel
        informationLabel.text = viewModel.informationText
        checkboxDefaultImageName =  viewModel.checkboxDefaultImageName
        checkboxSelectedImageName = viewModel.checkboxSelectedImageName
        checkboxErrorImageName = viewModel.checkboxErrorImageName
        checkboxImageView.image = UIImage(named: checkboxDefaultImageName)
    }
    
    @IBAction func checkBoxButtonPressed(_ sender: Any) {
        isChecked = !isChecked
        checkboxImageView.image = isChecked ? UIImage(named: checkboxSelectedImageName) : UIImage(named: checkboxDefaultImageName)
    }
    
    @IBAction func firstClickButtonPressed(_ sender: Any) {
        isFirstClick = false
        firstClickButton.isHidden = true
        firstClickFunction?()
    }
}

extension AppHereCheckboxView: UserInputtable {
    
    public var isValidInput: Bool {
        return isChecked
    }
    
    public func hideError() {
        checkboxButton.layer.borderWidth = 0
        checkboxImageView.layer.borderWidth = 0
    }
    
    public func showError() {
        checkboxImageView.image = UIImage(named: checkboxErrorImageName)
    }
}
