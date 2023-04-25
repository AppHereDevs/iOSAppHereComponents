import Foundation
import UIKit

public class AppHereTextView: UITextView, Themeable {
    public var themeDict: NSDictionary?

    public var placeHolderText: String? {
        didSet {
            text = placeHolderText
        }
    }

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        initComponent()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponent()
    }

    @IBInspectable public var themeKey: String? {
        didSet {
            guard let themeKey = themeKey, let themeDict = AppHereThemeManager.shared.getTheme(byKey: themeKey) else {
                isHidden = true
                return
            }
            self.themeDict = themeDict

            configureLabelAppearance()
        }
    }

    private func configureLabelAppearance() {
        guard let themeDict = themeDict, let viewTheme = try? AppHereTextViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        textColor = UIColor(hexString: viewTheme.placeHolderTextColor)
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        font = AppHereThemeManager.shared.getFont(fontName: viewTheme.fontName, fontSize: viewTheme.fontSize)
    }

    private func initComponent() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textViewDidBeginEditing(_:)),
            name: UITextView.textDidBeginEditingNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textViewDidEndEditing(_:)),
            name: UITextView.textDidEndEditingNotification,
            object: nil
        )
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func textViewDidBeginEditing(_: NSNotification) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereTextViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        if textColor == UIColor(hexString: viewTheme.placeHolderTextColor) {
            text = ""
            textColor = UIColor(hexString: viewTheme.textColor)
        }
    }

    @objc private func textViewDidEndEditing(_: NSNotification) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereTextViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        if text?.isEmpty ?? true {
            text = placeHolderText
            textColor = UIColor(hexString: viewTheme.placeHolderTextColor)
        }
    }
}
