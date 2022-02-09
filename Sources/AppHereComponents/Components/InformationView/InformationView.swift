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
        if let backgroundColor = viewTheme.backgroundColor {
            view.backgroundColor = UIColor(hexString: backgroundColor)
        } else {
            view.backgroundColor = UIColor.clear
        }
        
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
