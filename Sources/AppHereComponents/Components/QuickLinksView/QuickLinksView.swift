import UIKit

public final class QuickLinksView: AppHereComponentView {
    // MARK: - IBOutlets

    @IBOutlet private var titleLabel: AppHereLabel!
    @IBOutlet private var textView: AppHereTextView!
    @IBOutlet private var textField: AppHereTextField!
    @IBOutlet private var otpTextField: AppHereOTPTextField!

    public var viewModel: QuickLinksViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }

    private func setupView(with viewModel: QuickLinksViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? QuickLinksViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        // MARK: Setup view's appearance with viewTheme

        backgroundColor = UIColor(hexString: viewTheme.backgroundColor!)
        titleLabel.themeKey = viewTheme.labelThemeKey
        textView.themeKey = viewTheme.textViewThemeKey

        // MARK: Setup view values with viewModel

        titleLabel.text = viewModel.title
        textView.placeHolderText = "placeHolder"
        textView.resignFirstResponder()
        textField.placeholder = "Telefon Numaranızı Giriniz.."
        textField.regexPattern = "LL LLL L"
        textField.keyboardType = .default
        otpTextField.themeKey = viewTheme.otpTextFieldThemeKey
        otpTextField.configure(with: 4)
    }
}
