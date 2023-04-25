import CoreModule
import UIKit

public class AppHereCheckboxView: AppHereComponentView {
    @IBOutlet private var trailingConstraint: NSLayoutConstraint!
    @IBOutlet private var bottomConstraint: NSLayoutConstraint!
    @IBOutlet private var topConstraint: NSLayoutConstraint!
    @IBOutlet private var leadingConstraint: NSLayoutConstraint!
    @IBOutlet private var checkboxButton: AppHereButton!
    @IBOutlet private var checkboxImageView: UIImageView!
    @IBOutlet private var informationLabel: AppHereLabel!
    @IBOutlet private var componentStackView: UIStackView!
    @IBOutlet private var firstClickButton: UIButton!

    private var isFirstClick: Bool = true
    private var isChecked: Bool = false
    private var checkboxDefaultImageName: String = ""
    private var checkboxSelectedImageName: String = ""
    private var checkboxErrorImageName: String = ""

    public var firstClickFunction: (() -> Void)?

    public var viewModel: AppHereCheckboxViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                isHidden = true
                return
            }
            setupView(with: viewModel)
        }
    }

    private func setupView(with viewModel: AppHereCheckboxViewModel) {
        guard let themeDict = themeDict, let viewTheme = try? AppHereCheckboxViewThemeModel(with: themeDict) else {
            isHidden = true
            return
        }

        // MARK: Setup view's appearance with viewTheme

        backgroundColor = UIColor(hexString: viewTheme.backgroundColor)

        if let cornerRadius = viewTheme.cornerRadius {
            layer.cornerRadius = cornerRadius.CGFloatValue
            layer.masksToBounds = true
        }

        // MARK: Setup view's appearance with viewTheme

        checkboxButton.setTitle("", for: .normal)
        firstClickButton.setTitle("", for: .normal)
        trailingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        bottomConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        topConstraint.constant = viewTheme.verticalInset.valueOrEmpty.CGFloatValue
        leadingConstraint.constant = viewTheme.horizontalInset.valueOrEmpty.CGFloatValue
        componentStackView.spacing = viewTheme.stackViewSpacing.valueOrEmpty.CGFloatValue
        informationLabel.themeKey = viewTheme.informationLabelThemeKey
        checkboxButton.themeKey = viewTheme.checkBoxButtonThemeKey

        // MARK: Setup view values with viewModel

        informationLabel.text = viewModel.informationText
        checkboxDefaultImageName = viewModel.checkboxDefaultImageName
        checkboxSelectedImageName = viewModel.checkboxSelectedImageName
        checkboxErrorImageName = viewModel.checkboxErrorImageName
        checkboxImageView.image = UIImage(named: checkboxDefaultImageName)
        firstClickButton.isHidden = !viewModel.isFirstClickButtonEnabled
    }

    @IBAction public func checkBoxButtonPressed(_ sender: Any) {
        if let isCheck = sender as? Bool {
            isChecked = isCheck
            checkboxImageView
                .image = isChecked ? UIImage(named: checkboxSelectedImageName) :
                UIImage(named: checkboxDefaultImageName)
        } else {
            isChecked = !isChecked
            checkboxImageView
                .image = isChecked ? UIImage(named: checkboxSelectedImageName) :
                UIImage(named: checkboxDefaultImageName)
        }
    }

    @IBAction private func firstClickButtonPressed(_: Any) {
        isFirstClick = false
        firstClickButton.isHidden = true
        firstClickFunction?()
    }
}

extension AppHereCheckboxView: UserInputtable {
    public var isValidInput: Bool {
        isChecked
    }

    public func hideError() {}

    public func showError() {
        checkboxImageView.image = UIImage(named: checkboxErrorImageName)
    }
}
