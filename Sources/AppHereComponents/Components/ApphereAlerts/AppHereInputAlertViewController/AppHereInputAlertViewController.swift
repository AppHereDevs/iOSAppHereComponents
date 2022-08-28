import UIKit

public struct InputAlertModel {
    let imageName: String
    let titleText: String?
    let descriptionText: String?
    let textFieldPlaceHolder: String?
    let leftButtonTitle: String?
    let rightButtonTitle: String?
    let centerButtonTitle: String?
    let isSecureEntry: Bool
}

public struct PresentableInputAlertInformation {
    let imageName: String
    let titleText: String
    let textFieldPlaceHolder: String
    let descriptionText: String
    let descriptionLabelHidden: Bool
    let leftButtonTitle: String
    let leftButtonHidden: Bool
    let rightButtonTitle: String
    let rightButtonHidden: Bool
    let centerButtonTitle: String
    let centerButtonHidden: Bool
    let isSecureEntry: Bool

    public init(imageName: String, titleText: String, textFieldPlaceHolder: String, descriptionText: String, descriptionLabelHidden: Bool, leftButtonTitle: String, leftButtonHidden: Bool, rightButtonTitle: String, rightButtonHidden: Bool, centerButtonTitle: String, centerButtonHidden: Bool, isSecureEntry: Bool) {
        self.imageName = imageName
        self.titleText = titleText
        self.textFieldPlaceHolder = textFieldPlaceHolder
        self.descriptionText = descriptionText
        self.descriptionLabelHidden = descriptionLabelHidden
        self.leftButtonTitle = leftButtonTitle
        self.leftButtonHidden = leftButtonHidden
        self.rightButtonTitle = rightButtonTitle
        self.rightButtonHidden = rightButtonHidden
        self.centerButtonTitle = centerButtonTitle
        self.centerButtonHidden = centerButtonHidden
        self.isSecureEntry = isSecureEntry
    }
}

public final class AppHereInputAlertViewController: UIViewController {
    @IBOutlet private var alertImageView: UIImageView!
    @IBOutlet private var alertTitleLabel: AppHereLabel!
    @IBOutlet private var alertDescriptionLabel: AppHereLabel!
    @IBOutlet private var alertInputTextField: AppHereTextField!
    @IBOutlet private var alertLeftButton: AppHereButton!
    @IBOutlet private var alertRightButton: AppHereButton!
    @IBOutlet private var alertCenterButton: UIButton!

    public var leftButtonHandler: (() -> Void)?
    public var rightButtonHandler: (() -> Void)?
    public var centerButtonHandler: (() -> Void)?

    public var inputtedText: String {
        alertInputTextField.text.valueOrEmpty
    }

    public init(presentableModel: PresentableInputAlertInformation) {
        super.init(nibName: nil, bundle: .main)
        _ = view

        alertImageView.image = UIImage(named: presentableModel.imageName)
        alertTitleLabel.text = presentableModel.titleText
        alertInputTextField.placeholder = presentableModel.textFieldPlaceHolder
        if #available(iOS 13.0, *) {
            alertInputTextField.overrideUserInterfaceStyle = .light
        }

        alertDescriptionLabel.isHidden = presentableModel.descriptionLabelHidden
        alertDescriptionLabel.text = presentableModel.descriptionText

        alertInputTextField.isSecureTextEntry = presentableModel.isSecureEntry

        alertLeftButton.isHidden = presentableModel.leftButtonHidden
        alertLeftButton.setTitle(presentableModel.leftButtonTitle, for: .normal)

        alertRightButton.isHidden = presentableModel.rightButtonHidden
        alertRightButton.setTitle(presentableModel.rightButtonTitle, for: .normal)

        alertCenterButton.isHidden = presentableModel.centerButtonHidden
        alertCenterButton.setTitle(presentableModel.centerButtonTitle, for: .normal)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public func enablePasswordToggle() {
        alertInputTextField.enablePasswordToggle()
    }

    @IBAction private func leftButtonPressed(_: Any) {
        leftButtonHandler?()
    }

    @IBAction private func rightButtonPressed(_: Any) {
        rightButtonHandler?()
    }

    @IBAction private func centerButtonPressed(_: Any) {
        centerButtonHandler?()
    }
}
