//
//  ApphereVerticalBannerView.swift
//
//
//  Created by Muhammed Sevük on 24.05.2022.
//

import UIKit

public protocol ImageCaching: AnyObject {
    func cacheImage(for imageView: UIImageView, url: URL)
}

public final class ApphereVerticalBannerView: AppHereComponentView {
    @IBOutlet private var titleLabel: AppHereLabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var bannerView: UIView!

    public var viewModel: ApphereVerticalBannerViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }
    

    private func setupView(with viewModel: ApphereVerticalBannerViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? ApphereVerticalBannerViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        // MARK: Setup view's appearance with viewTheme

        if let cornerRadius = viewTheme.cornerRadius {
            layer.cornerRadius = cornerRadius.CGFloatValue
            layer.masksToBounds = true
        }
        if let backgroundColor = viewTheme.bannerViewBackgroundColor {
            bannerView.backgroundColor = UIColor(hexString: backgroundColor)
        } else {
            bannerView.backgroundColor = UIColor.clear
        }

        // MARK: Setup view values with viewModel

        if let text = viewModel.informationText {
            titleLabel.themeKey = viewTheme.titleLabelThemeKey
            titleLabel.text = text
        } else {
            titleLabel.isHidden = true
        }

        if let imageURL = viewModel.imageUrl,
           let imageCaching = viewModel.imageCaching
        {
            imageCaching.cacheImage(for: imageView, url: imageURL)
        } else {
            imageView.isHidden = true
        }
    }
}
