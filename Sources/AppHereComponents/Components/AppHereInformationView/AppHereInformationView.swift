//
//  AppHereInformationView.swift
//  
//
//  Created by Arda Onat on 8.02.2022.
//

import UIKit

public final class AppHereInformationView: AppHereComponentView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var firstInformationLabel: AppHereLabel!
    @IBOutlet weak var secondInformationLabel: AppHereLabel!
    
    public var viewModel: AppHereInformationViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                self.isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }
    
    private func setupView(with viewModel: AppHereInformationViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereInformationViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        // MARK: Setup view's appearance with viewTheme
        if let backgroundColor = viewTheme.backgroundColor {
            view.backgroundColor = UIColor(hexString: backgroundColor)
        } else {
            view.backgroundColor = UIColor.clear
        }
        trailingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        bottomConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        topConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        leadingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        
        // MARK: Setup view values with viewModel
        if let firstInformationText = viewModel.firstInformationText {
            firstInformationLabel.themeKey = viewTheme.firstLabelThemeKey
            firstInformationLabel.text = firstInformationText
        } else {
            firstInformationLabel.isHidden = true
        }
        
        if let secondInformationText = viewModel.secondInformationText {
            secondInformationLabel.themeKey = viewTheme.secondLabelThemeKey
            secondInformationLabel.text = secondInformationText
        } else {
            secondInformationLabel.isHidden = true
        }
    }
}
