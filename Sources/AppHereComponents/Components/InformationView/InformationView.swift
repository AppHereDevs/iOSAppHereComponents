//
//  File.swift
//  
//
//  Created by Arda Onat on 8.02.2022.
//

import UIKit

public final class InformationView: AppHereComponentView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var firstInformationLabel: AppHereLabel!
    @IBOutlet weak var secondInformationLabel: AppHereLabel!
    @IBOutlet weak var maxLineWidthConstraint: NSLayoutConstraint!
    
    public var viewModel: InformationViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                self.isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }
    
    private func setupView(with viewModel: InformationViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? InformationViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        // MARK: Setup view's appearance with viewTheme
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor!)
        firstInformationLabel.themeKey = viewTheme.firstLabelThemeKey
        secondInformationLabel.themeKey = viewTheme.secondLabelThemeKey
        maxLineWidthConstraint.constant = viewTheme.maxLineWidth ?? view.bounds.width
        
        // MARK: Setup view values with viewModel
        firstInformationLabel.text = viewModel.firstInformationText
        secondInformationLabel.text = viewModel.secondInformationText
    }
}
