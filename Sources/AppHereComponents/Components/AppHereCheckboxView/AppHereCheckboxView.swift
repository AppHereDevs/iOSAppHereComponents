//
//  AppHereCheckboxView.swift
//  
//
//  Created by Arda Onat on 11.02.2022.
//

import UIKit

public class AppHereCheckboxView: AppHereComponentView {
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var checkboxButton: AppHereButton!
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var informationLabel: AppHereLabel!
    
    private var isChecked: Bool = false
    private var checkboxDefaultImageName: String = ""
    private var checkboxSelectedImageName: String = ""
    
    
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
        
        // MARK: Setup view insets
        checkboxButton.setTitle("", for: .normal)
        trailingConstraint.constant = viewTheme.inset.valueOrEmpty.CGFloatValue
        bottomConstraint.constant = viewTheme.inset.valueOrEmpty.CGFloatValue
        topConstraint.constant = viewTheme.inset.valueOrEmpty.CGFloatValue
        leadingConstraint.constant = viewTheme.inset.valueOrEmpty.CGFloatValue
        informationLabel.themeKey = viewTheme.informationLabelThemeKey
        checkboxButton.themeKey = viewTheme.checkBoxButtonThemeKey
        
        // MARK: Setup view values with viewModel
        informationLabel.text = viewModel.informationText
        checkboxDefaultImageName =  viewModel.checkboxDefaultImageName.valueOrEmpty
        checkboxSelectedImageName = viewModel.checkboxSelectedImageName.valueOrEmpty
        checkboxImageView.image = UIImage(named: checkboxDefaultImageName)
    }
    
    @IBAction func checkboxButtonPressed(_ sender: Any) {
        isChecked  = !isChecked
        
        checkboxImageView.image = isChecked ? UIImage(named: checkboxSelectedImageName) : UIImage(named: checkboxSelectedImageName)
    }
}