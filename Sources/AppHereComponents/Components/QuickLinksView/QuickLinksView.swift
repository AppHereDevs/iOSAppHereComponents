//
//  QuickLinksView.swift
//  ooAutos
//
//  Created by Arda Onat on 18.12.2021.
//

import UIKit

public final class QuickLinksView: AppHereComponentView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: AppHereLabel!
    
    public var viewModel: QuickLinksViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                self.isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }
    
    private func setupView(with viewModel: QuickLinksViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? QuickLinksViewThemeModel(with: themeDict) else {
            self.isHidden = true
            return
        }
        
        // MARK: Setup view's appearance with viewTheme
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor!)
        
        // MARK: Setup view values with viewModel
        titleLabel.text = viewModel.title
        titleLabel.themeKey = viewTheme.labelThemeKey
    }
}
