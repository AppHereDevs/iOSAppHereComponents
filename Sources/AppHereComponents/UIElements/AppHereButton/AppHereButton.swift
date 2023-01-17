//
//  AppHereButton.swift
//
//
//  Created by Arda Onat on 10.02.2022.
//
import UIKit

public class AppHereButton: UIButton, Themeable {
    public var themeDict: NSDictionary?

    @IBInspectable public var themeKey: String? {
        didSet {
            guard let themeKey = themeKey, let themeDict = AppHereThemeManager.shared.getTheme(byKey: themeKey) else {
                isHidden = true
                return
            }
            self.themeDict = themeDict

            configureButtonAppearance()
        }
    }

    private func configureButtonAppearance() {
        guard let themeDict = themeDict, let viewTheme = try? AppHereButtonThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        tintColor = UIColor(hexString: viewTheme.textColor)
        titleLabel?.font = AppHereThemeManager.shared.getFont(
            fontName: viewTheme.fontName,
            fontSize: viewTheme.fontSize
        )
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        layer.cornerRadius = viewTheme.cornerRadius.valueOrEmpty.CGFloatValue
        layer.borderWidth = viewTheme.borderWidth.valueOrEmpty.CGFloatValue
    }
}
