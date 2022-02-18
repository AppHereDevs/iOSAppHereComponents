//
//  AppHereCheckboxView.swift
//  
//
//  Created by Arda Onat on 11.02.2022.
//

import UIKit
import CoreModule

public class AppHereCheckboxView: AppHereComponentView {
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var checkboxButton: AppHereButton!
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var informationLabel: AppHereLabel!
    @IBOutlet weak var componentStackView: UIStackView!
    
    private var isChecked: Bool = false
    private var checkboxDefaultImageName: String = ""
    private var checkboxSelectedImageName: String = ""
    private var checkboxErrorImageName: String = ""
    
    public var viewModel: AppHereCheckboxViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                self.isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }
    
    private func setupView(with viewModel: AppHereCheckboxViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereCheckboxViewThemeModel(with: themeDict) else {
            self.isHidden = true
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
