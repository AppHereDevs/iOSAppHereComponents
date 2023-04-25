import UIKit

public class AppHereLabel: UILabel, Themeable {
    private enum TextType {
        case underlined
        case defaultText
    }

    // MARK: Countdown variable

    private var timer = Timer()
    private var countDownSeconds: Int = 0
    private var timerCompletion: (() -> Void)?
    private var textType: TextType = .defaultText

    public var themeDict: NSDictionary?

    override public var text: String? {
        didSet {
            guard let text = text else { return }

            if textType == .underlined {
                let underlineAttribute = [
                    NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                    NSAttributedString.Key.foregroundColor: textColor as Any,
                    NSAttributedString.Key.font: font as Any,
                    NSAttributedString.Key.backgroundColor: backgroundColor as Any
                ] as [NSAttributedString.Key: Any]

                attributedText = NSAttributedString(string: text, attributes: underlineAttribute)
            }
        }
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
        guard let themeDict = themeDict, let viewTheme = try? AppHereLabelThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        if viewTheme.isUnderlined {
            textType = .underlined
        } else {
            textType = .defaultText
        }

        textColor = UIColor(hexString: viewTheme.textColor)
        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)
        font = AppHereThemeManager.shared.getFont(fontName: viewTheme.fontName, fontSize: viewTheme.fontSize)

        guard let cornerRadius = viewTheme.cornerRadius else { return }

        layer.cornerRadius = cornerRadius.CGFloatValue
        layer.masksToBounds = true
    }

    public func startCountdown(from seconds: Int, completion: (() -> Void)?) {
        isHidden = false
        text = seconds.timerString
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(update),
            userInfo: nil,
            repeats: true
        )

        countDownSeconds = seconds
        timerCompletion = completion
    }

    @objc private func update() {
        countDownSeconds -= 1
        text = countDownSeconds.timerString

        guard countDownSeconds == 0 else { return }

        timer.invalidate()
        timerCompletion?()
    }
}

private extension Int {
    var timerString: String {
        let minutes = self / 60 % 60
        let seconds = self % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}

private extension String {
    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
}
